FROM vault:0.11.0

RUN apk add --update openssl curl

COPY conf/vault.conf /vault/config/
COPY tls /vault/config/tls
COPY bin /usr/local/bin

WORKDIR /app

ARG GITHUB_URL
ARG SERVER_URL

ENV VAULT_GITHUB_URL=$GITHUB_URL
ENV VAULT_ADDR=$SERVER_URL

ENTRYPOINT /usr/local/bin/vault-entrypoint
