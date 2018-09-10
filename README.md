## mrc-ide vault

This repo is still somewhat tied to our needs but is hopefully closer to something that can be repurposed at will than it's predecessor [`montagu-vault`](https://github.com/vimc/montagu-vault).

## Initial setup

* Create an encrypted copy of the SSL certificate (`tls/key.pem.enc`) if that has not been done yet (see section below)
* Run `./run` and follow the instructions

## TLS and SSL keys

ICT are likely to give a series of files:

* `QuoVadisOVIntermediateCertificate.crt`
* `<fqdn>.crt`
* `<something>.key`

The certificates will likely come in a zip file.  For this particular vault these were dealt with by

```bash
cat tls/certs/web-dev_dide_ic_ac_uk.crt \
    tls/certs/QuoVadisOVIntermediateCertificate.crt > \
    tls/certificate.pem
```

and copying the key file as `tls/key.pem`

Then run `./tls/encrypt-key` and follow the instructions it produces.
