param(
	[string]$tagVersion
)

$imagenes = docker images --format "{{.Repository}} {{.ID}}" --filter "reference=restaurant*";


foreach ($imagen in $imagenes) {
    $fragmentos = $imagen -split ' ' 
	
	$repositorio = $fragmentos[0];
	$imageId = $fragmentos[1];
	
	$comando = "docker tag ${imageId} ${repositorio}:${tagVersion}";
	
	Write-Output "Comando a ejecutar: " $comando
	Invoke-Expression $comando;
}

Write-Output "Se han etiquetado todos las imágenes del proyecto con el tag ${tagVersion}"