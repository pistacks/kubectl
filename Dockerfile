FROM pistacks/alpine AS builder

ENV VERSION 1.19.0
ENV ARCH arm

RUN apk --no-cache add curl bash git openssl ncurses  \
    && wget https://dl.k8s.io/v${VERSION}/kubernetes-client-linux-${ARCH}.tar.gz \
    && tar -xvf kubernetes-client-linux-${ARCH}.tar.gz \
    && mv kubernetes/client/bin/kubectl /bin/kubectl \
    && rm -rf kubernetes*

FROM scratch

COPY --from=builder /bin/kubectl /bin/kubectl
ENTRYPOINT ["/bin/kubectl"]
