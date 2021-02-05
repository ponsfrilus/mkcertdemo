# Demo mkcert and Traefik templating

A demo using [mkcert](https://github.com/FiloSottile/mkcert) and [Go templating](https://doc.traefik.io/traefik/providers/file/#go-templating) to
provide local development environment with signed SSL certificate.


## How To

1. Edit the `.env` file and change `MKCERT_URL` as needed
1. Then run `make`
1. Head to http://`MKCERT_URL` : it should redirect to https://`MKCERT_URL`

Additionaly, you can head to http://`MKCERT_URL`:8080 to visit the Traefik dashboard.

