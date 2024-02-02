ARG ATLANTIS_VERSION

FROM ghcr.io/runatlantis/atlantis:$ATLANTIS_VERSION

ARG ATLANTIS_VERSION
ARG TERRAGRUNT_VERSION
ARG KERNEL_TYPE=linux
ARG CPU_ARCH=amd64

LABEL terragrunt.version=$TERRAGRUNT_VERSION
LABEL atlantis.version=$ATLANTIS_VERSION

USER root

RUN curl -Lo /usr/local/bin/terragrunt  "https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_${KERNEL_TYPE}_${CPU_ARCH}" \
    && chmod 755 /usr/local/bin/terragrunt

USER atlantis
