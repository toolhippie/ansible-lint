FROM ghcr.io/dockhippie/alpine:3.23@sha256:dd0a8a957cb409bde4a96e04af7b59b16f3436817784c67afb9b6bc431672e3e
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible-lint
ENV ANSIBLE_LINT_VERSION=26.1.1

# renovate: datasource=pypi depName=ansible
ENV ANSIBLE_CORE_VERSION=13.2.0

RUN apk update && \
  apk upgrade && \
  apk add --no-cache bash python3 python3-dev py3-pip git libffi-dev openssl-dev cargo jmespath && \
  pip3 install --break-system-packages -U ansible-lint==${ANSIBLE_LINT_VERSION} ansible==${ANSIBLE_CORE_VERSION} && \
  apk del libffi-dev openssl-dev cargo && \
  rm -rf /var/cache/apk/* /root/.cache
