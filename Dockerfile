FROM alpine:3.13.2

# Install required tools

RUN apk add --update curl make docker gettext net-tools openssl bash && \
rm -rf /var/cache/apk/*

WORKDIR /tmp/install_dir
# Install Helm 3
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash 
# Install kubectl
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
chmod +x ./kubectl && \
mv ./kubectl /usr/local/bin/kubectl
# Install yq 
RUN apk add yq --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
