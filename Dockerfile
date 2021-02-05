FROM golang:1.15-alpine
RUN apk --no-cache add git
RUN go get -u github.com/FiloSottile/mkcert
RUN mkdir /certs
RUN chown -R 1000:1000 /certs
WORKDIR /certs
CMD ["mkcert"]
