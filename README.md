# mrc-ide vault

## Install vault

Download vault from it's official site https://www.vaultproject.io/downloads.html

This needs to be done on the machine that will host the vault container too.

## Use this vault

From the command line:

```bash
export VAULT_ADDR=https://vault.dide.ic.ac.uk:8200
vault login -method=github
```

Via the web ui:

Go to https://vault.dide.ic.ac.uk:8200/ui - select "github" from the authentication options and enter your token.

## Configuring TLS certificates

The certificates are automatically obtained from Let's Encrypt. The following
command will obtain an initial certificate and start a long-running container
to automatically renew the certificate when needed.

```
./scripts/configure_tls
```

The long-running container will automatically send a signal to Vault when the
certificate is renewed, which will cause Vault to reload it.

The script assumes the existence of an `hdb-credentials` file on disk. The
credentials can be found in the Vault itself under
`secret/certbot-hdb/credentials`, assuming the Vault is up and running in the
first place. If the Vault contents and these credentials are lost, we would
need to obtain new credentials from ICT. See the [acme-buddy][acme-buddy] docs
for more details about the file's expected format.

[acme-buddy]: https://github.com/reside-ic/acme-buddy

## Starting the vault

```
./scripts/start
```

Then unseal the vault

## Unsealing the vault

Everyone needs to run

```
vault operator unseal
```

and provide their key

## Restarting the vault

```
./scripts/restart
```

You need to unseal the vault after this

## Re-keying

This is documented here:

https://www.vaultproject.io/guides/operations/rekeying-and-rotating

## Generate a new root token

https://www.vaultproject.io/guides/operations/generate-root
