#!/bin/sh

LOG_DIR=/vault-storage/logs
FECHA=$(date +'%Y%m%d%H%M%S')
LOG_FILE="$LOG_DIR/vault_entrypoint_"$FECHA".log"

function imprimirOutput() {
	fechaOutput="["$(date +'%d/%m/%Y %H:%M:%S')"]"
	outputText="$fechaOutput $1"
	if [ -f "$LOG_FILE" ]; then
		echo $outputText | tee $LOG_FILE -a
	else
		echo $outputText | tee $LOG_FILE
	fi
}

# Función para esperar a que Vault esté listo
wait_for_vault() {
  while ! nc -z vault 8200; do
    imprimirOutput "Esperando a que Vault se inicie..."
    sleep 5
  done
}

# Función encargada de la inicialización de Vault
inicializarVault() {
    # Inicializar Vault
  	vault operator init -key-shares=1 -key-threshold=1 > /vault/keys/keys.txt

	# Verificar si la inicialización fue exitosa
	if [ $? -ne 0 ]; then
		imprimirOutput "Error al inicializar Vault"
		exit 1
	fi
}

# Función encargada de la extracción de clave/s de desellado y token raíz de Vault
extraerClavesToken() {
	UNSEAL_KEY=$(grep 'Unseal Key 1:' /vault/keys/keys.txt | awk '{print $NF}')
	ROOT_TOKEN=$(grep 'Initial Root Token:' /vault/keys/keys.txt | awk '{print $NF}')

	# Verificar si las claves fueron extraídas correctamente
	if [ -z "$UNSEAL_KEY" ] || [ -z "$ROOT_TOKEN" ]; then
		imprimirOutput "Error al extraer las claves de desellado o el token raíz"
		exit 1
	fi
	
	# TODO: Se podrían almacenar en una ubicación segura
}

# Función encargada de desellar Vault para que pueda ser utilizado, empleando la clave de desellado
desellarVault() {
  	vault operator unseal $UNSEAL_KEY

	# Verificar si el desellado fue exitoso
	if [ $? -ne 0 ]; then
		imprimirOutput "Error al desellar Vault"
		exit 1
	fi
}

# Función encargada de que el sistema inicie sesión en Vault para poder utilizar sus comandos
iniciarSesion() {
	export VAULT_TOKEN=$ROOT_TOKEN
	vault login $ROOT_TOKEN

	# Verificar si el inicio de sesión fue exitoso
	if [ $? -ne 0 ]; then
		imprimirOutput "Error al iniciar sesión con el token raíz"
		exit 1
	fi
}

# Función encargada de habilitar el motor de secretos KV en los paths requeridos (actualmente solo secret/)
habilitarMotorSecretos() {
	
	imprimirOutput "Habilitando motor de secretos KV"
	
	# Habilitar el motor de secretos KV en secret/
	vault secrets enable -path=secret/ kv

	# Verificar si el motor de secretos fue habilitado correctamente
	if [ $? -ne 0 ]; then
		imprimirOutput "Error al habilitar el motor de secretos KV"
		exit 1
	fi
}

# Función encargada de añadir los secretos deseados a Vault
inicializacionSecretos() {
	imprimirOutput "Inicializando secretos de Vault"
	# Adición de secretos (no recomendable dejar esto)
	vault kv put secret/gitrepo git.uri=<enlace_git> git.username=<usuario_git> git.password=<password_git>
}

almacenarArchivoHealthCheck() {
	mkdir -p /healthcheck
	touch /healthcheck/status
	echo -n "HEALTHY" > /healthcheck/status
}

# main

if [ ! -e "$LOG_DIR" ]; then
	mkdir -p $LOG_DIR
fi


# Iniciar Vault en segundo plano
vault server -config=/vault/config/config.hcl&

# Esperar a que Vault termine
wait_for_vault

inicializacionVault=$(vault operator init -status)

# Comprobar si Vault ya ha sido inicializado previamente
if [ "$inicializacionVault" = "Vault is initialized" ]; then
	imprimirOutput "Vault ya ha sido inicializado, se omite el proceso de inicialización"
	extraerClavesToken
	desellarVault
	iniciarSesion 
else
	imprimirOutput "Inicializando configuración de token raíz y claves de desellado de Vault"
	
	inicializarVault 
	
	# Extraer la clave de desellado y el token raíz
	extraerClavesToken
	
	# Desellar Vault
	desellarVault

	# Iniciar sesión con el token raíz
	iniciarSesion
	
	# Habilitar motor de secretos (necesario iniciar sesión primero)
	habilitarMotorSecretos 
	
	inicializacionSecretos 
fi

imprimirOutput "Unseal Key: $UNSEAL_KEY"
imprimirOutput "Root Token: $ROOT_TOKEN"
imprimirOutput "El servidor gestor de secretos Vault se está ejecutando correctamente"
almacenarArchivoHealthCheck 

# Mantener el contenedor en ejecución
wait

######################## END MAIN ########################
