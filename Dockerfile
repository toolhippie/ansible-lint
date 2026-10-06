FROM ghcr.io/dockhippie/alpine:3.23@sha256:0c390b9f9e8a5a78f0fd573548d2a13e035893de9ed1342ebcb7d33e02a912c2
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible-lint
ENV ANSIBLE_LINT_VERSION=26.9.0

# renovate: datasource=pypi depName=ansible
ENV ANSIBLE_CORE_VERSION=14.4.0

RUN apk update && \
  apk upgrade && \
  apk add --no-cache bash python3 python3-dev py3-pip git libffi-dev openssl-dev cargo jmespath && \
  pip3 install --break-system-packages -U ansible-lint==${ANSIBLE_LINT_VERSION} ansible==${ANSIBLE_CORE_VERSION} && \
  apk del libffi-dev openssl-dev cargo && \
  rm -rf /var/cache/apk/* /root/.cache
