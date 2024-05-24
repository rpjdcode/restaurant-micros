#!/bin/sh

######################## BEGIN FUNCIONES ########################
# Función para esperar a que Vault esté listo
wait_for_vault() {
  while ! nc -z localhost 8200; do
    echo "Esperando a que Vault se inicie..."
    sleep 1
  done
}

# Función encargada de la inicialización de Vault
inicializarVault() {
    # Inicializar Vault
  	vault operator init -key-shares=1 -key-threshold=1 > /vault/keys/keys.txt

	# Verificar si la inicialización fue exitosa
	if [ $? -ne 0 ]; then
		echo "Error al inicializar Vault"
		exit 1
	fi
}

# Función encargada de la extracción de clave/s de desellado y token raíz de Vault
extraerClavesToken() {
	UNSEAL_KEY=$(grep 'Unseal Key 1:' /vault/keys/keys.txt | awk '{print $NF}')
	ROOT_TOKEN=$(grep 'Initial Root Token:' /vault/keys/keys.txt | awk '{print $NF}')

	# Verificar si las claves fueron extraídas correctamente
	if [ -z "$UNSEAL_KEY" ] || [ -z "$ROOT_TOKEN" ]; then
		echo "Error al extraer las claves de desellado o el token raíz"
		exit 1
	fi
	
	# TODO: Se podrían almacenar en una ubicación segura
}

# Función encargada de desellar Vault para que pueda ser utilizado, empleando la clave de desellado
desellarVault() {
  	vault operator unseal $UNSEAL_KEY

	# Verificar si el desellado fue exitoso
	if [ $? -ne 0 ]; then
		echo "Error al desellar Vault"
		exit 1
	fi
}

# Función encargada de que el sistema inicie sesión en Vault para poder utilizar sus comandos
iniciarSesion() {
	export VAULT_TOKEN=$ROOT_TOKEN
	vault login $ROOT_TOKEN

	# Verificar si el inicio de sesión fue exitoso
	if [ $? -ne 0 ]; then
		echo "Error al iniciar sesión con el token raíz"
		exit 1
	fi
}

# Función encargada de habilitar el motor de secretos KV en los paths requeridos (actualmente solo secret/)
habilitarMotorSecretos() {
	
	echo "Habilitando motor de secretos KV"
	
	# Habilitar el motor de secretos KV en secret/
	vault secrets enable -path=secret/ kv

	# Verificar si el motor de secretos fue habilitado correctamente
	if [ $? -ne 0 ]; then
		echo "Error al habilitar el motor de secretos KV"
		exit 1
	fi
}

# Función encargada de añadir los secretos deseados a Vault
inicializacionSecretos() {
	echo "Inicializando secretos de Vault"
	# Adición de secretos (no recomendable dejar esto)
	vault kv put secret/gitrepo git.uri=https://github.com/rpjdcode/microservices-configuration git.username=rpjdcode git.password=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
}

almacenarArchivoHealthCheck() {
	mkdir -p /healthcheck
	touch /healthcheck/status
	echo -n "HEALTHY" > /healthcheck/status
}
######################## END FUNCIONES ########################


######################## BEGIN MAIN ########################

# Iniciar Vault en segundo plano
vault server -config=/vault/config/config.hcl&

# Esperar a que Vault termine
wait_for_vault

inicializacionVault=$(vault operator init -status)

# Comprobar si Vault ya ha sido inicializado previamente
if [ "$inicializacionVault" = "Vault is initialized" ]; then
	echo "Vault ya ha sido inicializado, se omite el proceso de inicialización"
	extraerClavesToken
	desellarVault
	iniciarSesion 
else
	echo "Inicializando configuración de token raíz y claes de desellado de Vault"
	
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

echo "Unseal Key: $UNSEAL_KEY"
echo "Root Token: $ROOT_TOKEN"
echo "El servidor gestor de secretos Vault se está ejecutando correctamente"
almacenarArchivoHealthCheck 

# Mantener el contenedor en ejecución
wait

######################## END MAIN ########################
