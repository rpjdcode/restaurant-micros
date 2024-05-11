# config.hcl
storage "file" {
  path = "/vault/data"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 1
}

# Habilita la interfaz de usuario
ui = true

# Configuración de los logs
log_level = "info"

# Desactivar el modo 'mlock'
disable_mlock = true

# Define el entorno de Vault
api_addr = "http://0.0.0.0:8200"
cluster_addr = "https://127.0.0.1:8201"