FROM alpine:3.13
LABEL maintainer="Danny August Ramaputra <daystram@gmail.com>"
ENV KUBECONFIG="/.kube/config"
ENV KUBECTL_VERSION="v1.20.2"
ENV HELM_VERSION="v3.5.2"
RUN apk add --no-cache git curl tar
RUN curl -sL "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" -o kubectl
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN mkdir /.kube
RUN curl -s "https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz" -o helm.tgz
RUN tar -zxvf helm.tgz
RUN mv linux-amd64/helm /usr/local/bin/helm
RUN rm -rf kubectl helm.tgz linux-amd64/