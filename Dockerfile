FROM alpine:3.13.2

# Install required tools

RUN apk add --no-cache curl make docker gettext net-tools openssl bash yq --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
WORKDIR /tmp/install_dir
# Install Helm 3
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | sh 
# Install kubectl
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
chmod +x ./kubectl && \
mv ./kubectl /usr/local/bin/kubectl
