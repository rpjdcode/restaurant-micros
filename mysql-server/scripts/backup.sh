#!/bin/bash

## constantes
BBDDS=("keycloak" "mysql" "restaurantdb")
NOMBRE_LOG="backup_bbdd_"$(date +'%Y%m%d%H%M%S')".log"
BACKUP_DIR=/backup-bbdd
LOG_DIR="$BACKUP_DIR/logs"
UBICACION_LOG="$LOG_DIR/$NOMBRE_LOG"

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
if [ ! -e "$BACKUP_DIR" ] || [ ! -e "$LOG_DIR" ]; then
	mkdir -p $BACKUP_DIR
	mkdir -p $LOG_DIR
	imprimirOutput "Directorio de backup y logging creados"
fi

imprimirOutput "Iniciando proceso de backup de BBDD"

for bd in "${BBDDS[@]}"; do
	imprimirOutput "Base de datos a copiar $bd"
	fechaFichero=$(date +'%Y%m%d%H%M%S')
	backupFile="$BACKUP_DIR/mysql_"$bd"_backup_"$fechaFichero".sql"
	if mysqldump -u ${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} $bd > "$backupFile"; then
		imprimirOutput "Backup realizado: $backupFile"
	else
		imprimirOutput "Error al realizar el backup"
	fi
done

imprimirOutput "Fin del proceso de backup de BBDD"
