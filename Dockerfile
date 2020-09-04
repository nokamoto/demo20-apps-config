FROM alpine:3.12.0 as helm

RUN apk add curl

RUN curl -sSL https://get.helm.sh/helm-v3.3.1-linux-amd64.tar.gz > helm-v3.3.1-linux-amd64.tar.gz

RUN tar -zxvf helm-v3.3.1-linux-amd64.tar.gz

FROM alpine:3.12.0

COPY --from=helm /linux-amd64/helm /usr/local/bin/helm

RUN chmod u+x /usr/local/bin/helm
