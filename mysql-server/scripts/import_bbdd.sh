#!/bin/bash

# Script de importación de respaldos de BBDD
DIRECTORIO_BACKUPS=/backup-bbdd
DIRECTORIO_BACKUPS_DEBUG=/a/Evi/Workspace-Web2024/restaurant-micros/backup-bbdd
BBDDS=("keycloak")
FECHA=$(date +'%Y%m%d%H%M%S')
LOG_IMPORTACION="$DIRECTORIO_BACKUPS/log_importacion_bbdd_$FECHA.log"

## Función encargada de loggear en fichero los mensajes de las operaciones realizadas en el script
function imprimirOutput() {
	fechaOutput="["$(date +'%d/%m/%Y %H:%M:%S')"]"
	outputText="$fechaOutput $1"
	if [ -f "$LOG_IMPORTACION" ]; then
		echo $outputText | tee $LOG_IMPORTACION -a
	else
		echo $outputText | tee $LOG_IMPORTACION
	fi
}

## - Primer parámetro: base de datos
## - Segundo parámetro: fichero
function realizarProcesoRestauracion() {

	# Consulta para verificar la existencia de la base de datos proporcioanda por parámetro
	QUERY="SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = '$nombreBD';"
	DB_EXISTS=$(mysql -u root -p123456a -se "${QUERY}")
	
	imprimirOutput "Valor de DB_EXISTS $DB_EXISTS"
	
	# Comprobar si la variable está vacía
	if [ -z "$DB_EXISTS" ]; then
		imprimirOutput "La base de datos indicada no existe"
		return 1
	else
		imprimirOutput "La base de datos ($nombreBD) existe. Procediendo a su restauración..."
		# Generación de fichero temporal en caso de producirse un error durante el proceso
		TEMPORAL_FILE="$DIRECTORIO_BACKUPS/RECONSTRUCCION_BBDD_$1_"$(date +'%Y%m%d%H%M%S')".sql.tmp"
		mysqldump -u root -p123456a $1 > "$TEMPORAL_FILE"
		
		if [ $? -eq 0 ]; then
			imprimirOutput "ARCHIVO TEMPORAL DE BBDD GENERADO: $TEMPORAL_FILE"
				
			reimportarDatos $1 $2
			
			if [ $? -eq 0 ]; then
				imprimirOutput "Restauración de datos completada"
				return 0
			else
				return 1
			fi
		fi
	fi
}

# Función encargada de limpiar la base de datos indicada por parámetro ($1)
# y de reimportar el fichero .SQL ($2)
## Valores de código de retorno:
## 	- Devuelve 0 si se importan los datos correctamente
## 	- Devuelve 1 si se produce cualquier error durante la importación
function reimportarDatos() {
	mysql -u root -p123456a -e "DROP DATABASE "$1";CREATE DATABASE "$1";"
	mysql -u root -p123456a $1 < $2
	
	if [ $? -eq 0 ]; then
		# TODO: Eliminar el TEMPORAL_FILE generado
	    imprimirOutput "La importación de la base de datos se realizó correctamente."
	    return 0;
	else
		# TODO: Restaurar el TEMPORAL_FILE
		imprimirOutput "Hubo un error al importar la base de datos."
		return 1;
	fi
}

## Función que es llamada cuando el script es ejecutado sin parámetros, esto implica:
## - Se intentará realizar la importación de BBDD en base al archivo de backup más reciente para esa BBDD
function main() {

	# main
	imprimirOutput "Inicializando importación de bases de datos"

	for bd in "${BBDDS[@]}"; do
		ficherosBackup=$(find "$DIRECTORIO_BACKUPS" -maxdepth 1 -type f -name 'mysql_'$bd'*')
		ficherosMatriz=($ficherosBackup)
		
		# Ordenar el array alfabéticamente
		IFS=$'\n' ordenado=($(sort -r <<<"${ficherosMatriz[*]}"))
		unset IFS
		
		backupReciente="${ordenado[0]}"
		
		imprimirOutput "[BD: $bd] El backup más reciente es $backupReciente"
		
		realizarProcesoRestauracion $bd $backupReciente
		
		if [ $? -eq 0 ]; then
			imprimirOutput "El proceso de restauración de base de datos para la BD ($bd) se ha realizado correctamente"
			exit 0;
		else
			imprimirOutput "El proceso de restauración de base de datos para la BD ($bd) ha fallado. Cod Retorno: $?"
			exit 1;
		fi
	done
}

# Salir en caso de no existir directorio con backups existentes
if [ ! -e $DIRECTORIO_BACKUPS ]; then
	exit 1;
fi

if [ $# -eq 0 ]; then
	# Camino principal, cuando no se proporcionan argumentos
	main
elif [ $# -eq 2 ]; then
	# Argumentos esperados:
	# $1 -> Ubicación del fichero .SQL a restaurar
	# $2 -> Nombre de base de datos a la que aplicar la restauración
	ficheroProporcionado=$1
	nombreBD=$2
	
	if [ ! -f $ficheroProporcionado ]; then
		imprimirOutput "El fichero proporcionado ($ficheroProporcionado) no existe"
		exit 1
	fi
	
	realizarProcesoRestauracion $nombreBD $ficheroProporcionado
	
	if [ $? -eq 0 ]; then
		imprimirOutput "El proceso de restauración de base de datos para la BD ($nombreBD) se ha realizado correctamente"
		exit 0;
	else
		imprimirOutput "El proceso de restauración de base de datos para la BD ($nombreBD) ha fallado. Cod Retorno: $?"
		exit 1;
	fi
	
else
	imprimirOutput "Se proporcionaron una cantidad de argumentos inválida (se permite sin parámetros, y 2 parámetros estrictos: ubicación de fichero y nombre de bbdd"
	exit 1;
fi;

