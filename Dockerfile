FROM ghcr.io/dockhippie/alpine:3.23@sha256:5e39b361571bce625f139dea01d8adec6219f266e3517886e48c0134948d6df8
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible-lint
ENV ANSIBLE_LINT_VERSION=25.12.2

# renovate: datasource=pypi depName=ansible
ENV ANSIBLE_CORE_VERSION=13.2.0

RUN apk update && \
  apk upgrade && \
  apk add --no-cache bash python3 python3-dev py3-pip git libffi-dev openssl-dev cargo jmespath && \
  pip3 install --break-system-packages -U ansible-lint==${ANSIBLE_LINT_VERSION} ansible==${ANSIBLE_CORE_VERSION} && \
  apk del libffi-dev openssl-dev cargo && \
  rm -rf /var/cache/apk/* /root/.cache
