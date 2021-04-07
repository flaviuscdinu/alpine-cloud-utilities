FROM alpine:latest

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
  python3 -m pip install --upgrade pip && \
  python3 -m pip install awscli && \
  python3 -m pip install boto3 && \
  python3 -m pip install azure-cli && \
  python3 -m pip install ansible && \ 
  python3 -m pip install oci && \ 
  python3 -m pip install oci-cli

ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

RUN cd /tmp \
    && wget https://releases.hashicorp.com/terraform/0.14.9/terraform_0.14.9_linux_amd64.zip \
    && unzip terraform_0.14.9_linux_amd64.zip \
    && mv terraform /usr/local/bin/ \
    && rm -rf terraform_0.14.9_linux_amd64.zip

