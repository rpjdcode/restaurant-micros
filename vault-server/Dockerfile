FROM hashicorp/vault:latest

RUN mkdir -p /vault/config
COPY config.hcl /vault/config/

ENV VAULT_ADDR='http://0.0.0.0:8200'
ENV VAULT_DEV_ROOT_TOKEN_ID='root'
ENV VAULT_CONFIG_DIR /vault/config

EXPOSE 8200

ENTRYPOINT ["vault"]

CMD ["server", "-config=/vault/config/config.hcl"]