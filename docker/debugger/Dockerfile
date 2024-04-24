# BUILDER IMAGE
FROM debian:latest AS builder

RUN apt update && apt install curl unzip -y
RUN curl 'https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip' -o 'awscliv2.zip'

RUN unzip awscliv2.zip
RUN ./aws/install

RUN curl -LO "https://dl.k8s.io/release/v1.28.8/bin/linux/arm64/kubectl" && chmod +x kubectl

# FINAL IMAGE
FROM debian:latest

COPY --from=builder /usr/local/aws-cli /usr/local/aws-cli
COPY --from=builder /usr/local/bin/aws /usr/local/bin/aws
COPY --from=builder /usr/local/bin/aws_completer /usr/local/bin/aws_completer
COPY --from=builder /kubectl /usr/local/bin/kubectl

RUN apt update && apt install curl unzip telnet net-tools -y

ENV PATH="/usr/local/aws-cli/v2/current/dist:${PATH}"