## mrc-ide vault

This repo is still somewhat tied to our needs but is hopefully closer to something that can be repurposed at will than it's predecessor [`montagu-vault`](https://github.com/vimc/montagu-vault).

## Install vault

Download vault from it's official site https://www.vaultproject.io/downloads.html

This needs to be done on the machine that will host the vault container too.

## Use this vault

```bash
export VAULT_ADDR=https://vault.dide.ic.ac.uk:8200
vault login -method=github
```

## Initial setup

* Create an encrypted copy of the SSL certificate (`tls/key.pem.enc`) if that has not been done yet (see section below)
* Run `./run` and follow the instructions

## TLS and SSL keys

ICT will now provide a single updated certificate file, update the `certs/certificate.pem` file with the new file and commit.

## Re-keying

This is documented here:

https://www.vaultproject.io/guides/operations/rekeying-and-rotating

## Generate a new root token

https://www.vaultproject.io/guides/operations/generate-root
