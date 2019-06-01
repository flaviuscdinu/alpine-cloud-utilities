FROM alpine:latest

LABEL version="1.0"

RUN apk -v --update add \
    git \ 
    python3 \
    curl \
    bash \
    make \
    && \
  apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev && \
  ln -s /usr/bin/python3 /usr/bin/python && \
  python3 -m pip install --upgrade pip && \
  python3 -m pip install awscli && \
  python3 -m pip install boto3 && \
  python3 -m pip install azure-cli && \
  python3 -m pip install ansible && \ 
  python3 -m pip install oci && \ 
  python3 -m pip install oci-cli

RUN cd /tmp \
    && wget https://releases.hashicorp.com/terraform/0.12.0/terraform_0.12.0_linux_amd64.zip \
    && unzip terraform_0.12.0_linux_amd64.zip \
    && mv terraform /usr/local/bin/ \
    && rm -rf terraform_0.12.0_linux_amd64.zip

