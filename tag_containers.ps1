param(
	[string]$tagVersion
)

# Almacenar la salida del comando en una variable
$imagenes = docker images --format "{{.Repository}} {{.ID}}" --filter "reference=restaurant*";

Write-Output $imagenes;

# Recorrer cada registro
foreach ($imagen in $imagenes) {
    $fragmentos = $imagen -split ' ' 
	
	$repositorio = $fragmentos[0];
	$imageId = $fragmentos[1];
	
	$comando = "docker tag ${imageId} ${repositorio}:${tagVersion}";
	
	Write-Output "Comando a ejecutar: " $comando
	Invoke-Expression $comando;
}