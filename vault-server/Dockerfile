# Use an official HashiCorp Vault image as a parent image
FROM hashicorp/vault:latest

# Set environment variables to configure Vault
ENV VAULT_ADDR='http://0.0.0.0:8200'
ENV VAULT_DEV_ROOT_TOKEN_ID='root'

# Expose port 8200 for the Vault API
EXPOSE 8200

# Set the entrypoint
ENTRYPOINT ["vault"]

# Run Vault in development mode
CMD ["server", "-dev"]