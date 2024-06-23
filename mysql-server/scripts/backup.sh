#!/bin/bash

## constantes
BBDDS=("keycloak" "mysql")
NOMBRE_LOG="backup_bbdd_"$(date +'%Y%m%d%H%M%S')".log"
BACKUP_DIR=/backup-bbdd
UBICACION_LOG="$BACKUP_DIR/$NOMBRE_LOG"

## funciones
function imprimirOutput() {
	fechaOutput="["$(date +'%d/%m/%Y %H:%M:%S')"]"
	outputText="$fechaOutput $1"
	if [ -f "$UBICACION_LOG" ]; then
		echo $outputText | tee $UBICACION_LOG -a
	else
		echo $outputText | tee $UBICACION_LOG
	fi
}

## main
if [ ! -e "$BACKUP_DIR" ]; then
	mkdir -p $BACKUP_DIR
	imprimirOutput "Directorio de backup creado"
fi

imprimirOutput "Iniciando script de backup de BBDD"

for bd in "${BBDDS[@]}"; do
	imprimirOutput "Base de datos a copiar $bd"
	fechaFichero=$(date +'%Y%m%d%H%M%S')
	backupFile="$BACKUP_DIR/mysql_"$bd"_backup_"$fechaFichero".sql"
	if mysqldump -u root -p123456a $bd > "$backupFile"; then
		imprimirOutput "Backup realizado: $backupFile"
	else
		imprimirOutput "Error al realizar el backup"
	fi
done

imprimirOutput "Fin del script de backup de BBDD"
