# Utiliza la imagen oficial de Vault
FROM hashicorp/vault:1.13.3

# Crear el directorio para las claves si no existe
RUN mkdir -p /vault/keys

# Copia el archivo de configuración y el script de inicialización a la imagen
COPY ./configs/config.hcl /vault/config/config.hcl

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY healthchecks.sh /usr/local/bin/healthchecks.sh

# Establece permisos de ejecución para el script
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/healthchecks.sh

# Expone el puerto de Vault
EXPOSE 8200

# Comando para iniciar Vault con la configuración especificada
#CMD ["sh", "-c", "/vault/init-vault.sh"]
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]