FROM alpine:3.11

LABEL version="1.1"

RUN apk -v --update add \
    git \ 
    python3 \
    curl \
    bash \
    make \
    openssh \
    docker \
    && \
  apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev binutils musl go && \
  ln -s /usr/bin/python3 /usr/bin/python && \
  apk add py3-pip && \
  pip3 install --upgrade pip && \
  pip3 install awscli && \
  pip3 install boto3 && \
  pip3 install azure-cli && \
  pip3 install ansible && \ 
  pip3 install oci && \ 
  pip3 install oci-cli

ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

RUN cd /tmp \
    && wget https://releases.hashicorp.com/terraform/0.14.9/terraform_0.14.9_linux_amd64.zip \
    && unzip terraform_0.14.9_linux_amd64.zip \
    && mv terraform /usr/local/bin/ \
    && rm -rf terraform_0.14.9_linux_amd64.zip

