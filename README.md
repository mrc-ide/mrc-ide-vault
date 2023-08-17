# mrc-ide vault

## Install vault

Download vault from it's official site https://www.vaultproject.io/downloads.html

This needs to be done on the machine that will host the vault container too.

## Use this vault

```bash
export VAULT_ADDR=https://vault.dide.ic.ac.uk:8200
vault login -method=github
```

## Configure TLS

Copy your certificate and key into a directory `tls/` (gitignored in this repo) and run

```
docker volume create mrc-ide-tls
docker run --rm -v ${PWD}/tls:/src -v mrc-ide-tls:/dst ubuntu cp /src/key.pem /dst
docker run --rm -v ${PWD}/tls:/src -v mrc-ide-tls:/dst ubuntu cp /src/certificate.pem /dst
```

You need to restart the vault after this.

## Restarting the vault

```
docker stop mrc-ide-vault
./run
```

Then unlock the vault

## TLS and SSL keys

ICT will now provide a single updated certificate file, update the `certs/certificate.pem` file with the new file and commit.

## Re-keying

This is documented here:

https://www.vaultproject.io/guides/operations/rekeying-and-rotating

## Generate a new root token

https://www.vaultproject.io/guides/operations/generate-root
