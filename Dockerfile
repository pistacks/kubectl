FROM pistacks/alpine

RUN apk --no-cache add curl bash git openssl ncurses  \
    && wget https://dl.k8s.io/v1.19.0/kubernetes-client-linux-arm.tar.gz \
    && tar -xvf kubernetes-client-linux-arm.tar.gz \
    && mv kubernetes/client/bin/kubectl /bin/kubectl \
    && rm -rf kubernetes* 
