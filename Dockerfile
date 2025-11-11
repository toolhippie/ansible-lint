FROM ghcr.io/dockhippie/alpine:3.22@sha256:c5bd9014e136d50a0d82c511a4fcf52a2ef43c55d9d535de035870845d1a98be
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible-lint
ENV ANSIBLE_LINT_VERSION=25.11.0

# renovate: datasource=pypi depName=ansible
ENV ANSIBLE_CORE_VERSION=12.2.0

RUN apk update && \
  apk upgrade && \
  apk add --no-cache bash python3 python3-dev py3-pip git libffi-dev openssl-dev cargo jmespath && \
  pip3 install --break-system-packages -U ansible-lint==${ANSIBLE_LINT_VERSION} ansible==${ANSIBLE_CORE_VERSION} && \
  apk del libffi-dev openssl-dev cargo && \
  rm -rf /var/cache/apk/* /root/.cache
