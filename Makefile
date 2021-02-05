-include .env
export

.PHONY: all
all: clean certs install perms

.PHONY: check-env
check-env:
	echo "@TODO"

certs/${MKCERT_URL}.pem certs/${MKCERT_URL}-key.pem:
	echo "cert for ${MKCERT_URL}"
	docker-compose run mkcert mkcert ${MKCERT_URL}

.PHONY: certs
certs: certs/${MKCERT_URL}.pem certs/${MKCERT_URL}-key.pem

.PHONY: perms
perms:
	docker-compose run mkcert sh -c "chown 1000:1000 -R /certs"

.PHONY: install
install:
	docker-compose run mkcert mkcert -install

.PHONY:
hosts:
	grep "${MKCERT_URL}" -q /etc/hosts || echo "127.0.0.1       ${MKCERT_URL}" >> /etc/hosts

.PHONY: clean
clean:
	rm certs/${MKCERT_URL}* || true
	sed -i "/127.0.0.1\s*${MKCERT_URL}$/d" /etc/hosts

