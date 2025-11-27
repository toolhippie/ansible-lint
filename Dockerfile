FROM ghcr.io/dockhippie/alpine:3.22@sha256:5b36d6c9994b3dbde7ff8e6140558b673d4ceb4d794c586073b934585c064a37
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible-lint
ENV ANSIBLE_LINT_VERSION=25.11.1

# renovate: datasource=pypi depName=ansible
ENV ANSIBLE_CORE_VERSION=13.0.0

RUN apk update && \
  apk upgrade && \
  apk add --no-cache bash python3 python3-dev py3-pip git libffi-dev openssl-dev cargo jmespath && \
  pip3 install --break-system-packages -U ansible-lint==${ANSIBLE_LINT_VERSION} ansible==${ANSIBLE_CORE_VERSION} && \
  apk del libffi-dev openssl-dev cargo && \
  rm -rf /var/cache/apk/* /root/.cache
