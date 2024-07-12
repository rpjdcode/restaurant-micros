package com.eviden.api.products.controller;

import org.springframework.core.io.buffer.DataBufferUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.http.codec.multipart.FilePart;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;

import com.eviden.api.products.model.ProductData;
import com.eviden.api.products.model.ProductDataTypes;
import com.eviden.api.products.service.ProductDataService;
import com.eviden.commons.api.media.types.EvidenMediaTypes;

import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

@RestController
@RequestMapping("/products/data")
public class ProductDataController {

	private final ProductDataService service;

	public ProductDataController(ProductDataService service) {
		this.service = service;
	}

	/**
	 * TODO: Cambiar el tipo de Mono<String> a Mono<APIResponse>
	 * Endpoint para subir una imagen asociada a un producto
	 * @param product
	 * @param filePartMono
	 * @return
	 */
	@PostMapping("/upload")
	public Mono<String> uploadImage(@RequestParam("productCode") String productCode,
			@RequestPart("file") Mono<FilePart> filePartMono) {
		
		return filePartMono.flatMap(filePart -> DataBufferUtils.join(filePart.content())
				.flatMap(dataBuffer -> {
					byte[] data = new byte[dataBuffer.readableByteCount()];
					dataBuffer.read(data);
					DataBufferUtils.release(dataBuffer);

					ProductData productData = new ProductData();
					productData.setProductCode(productCode);
					productData.setDataType(ProductDataTypes.PRESENTATION);
					productData.setFileName(filePart.filename());
					productData.setData(data);
					
					return service.updateProductData(productCode, ProductDataTypes.PRESENTATION, productData)
					.switchIfEmpty(service.saveProductData(productData))
					.then(Mono.just("File uploaded: " + filePart.filename()));

				}).subscribeOn(Schedulers.boundedElastic()) // Mover el trabajo pesado fuera del hilo principal
		);
	}

	/**
	 * Endpoint para mostrar la imagen del producto como respuesta en caso de existir.
	 * 
	 * @param productCode
	 * @return
	 */
	@GetMapping("/download/{productCode}")
	public Mono<ResponseEntity<byte[]>> downloadImage(@PathVariable("productCode") String productCode) {
		return service.getProductDataByCode(productCode).map(data -> {
			if (data.getData() != null) {
				HttpHeaders headers = new HttpHeaders();
				headers.setContentType(EvidenMediaTypes.IMAGE_WEBP);
				headers.setContentLength(data.getData().length);
				headers.setContentDispositionFormData("attachment", data.getFileName());
				return ResponseEntity.ok().headers(headers).body(data.getData());
			}
			return ResponseEntity.notFound().<byte[]>build();

		}).defaultIfEmpty(ResponseEntity.notFound().build());
	}
}
