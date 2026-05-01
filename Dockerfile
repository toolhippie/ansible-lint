FROM ghcr.io/dockhippie/alpine:3.23@sha256:3bf7f59a8892a380680d78bca46222cf369b5666a04e682c6a9622b32391fd8d
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible-lint
ENV ANSIBLE_LINT_VERSION=26.4.0

# renovate: datasource=pypi depName=ansible
ENV ANSIBLE_CORE_VERSION=13.6.0

RUN apk update && \
  apk upgrade && \
  apk add --no-cache bash python3 python3-dev py3-pip git libffi-dev openssl-dev cargo jmespath && \
  pip3 install --break-system-packages -U ansible-lint==${ANSIBLE_LINT_VERSION} ansible==${ANSIBLE_CORE_VERSION} && \
  apk del libffi-dev openssl-dev cargo && \
  rm -rf /var/cache/apk/* /root/.cache
