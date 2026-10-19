FROM python:3.14.8-slim@sha256:a2b82f3c48559aa0a8446d9af49826b6e2b2016f4cd2afabfe6013ec53729170

COPY requirements.txt /requirements.txt

# hadolint ignore=DL3008
RUN set -ex \
    && apt-get update \
    && apt-get -q install --no-install-recommends -y -V git \
    && rm -rf /var/lib/apt/lists/* \
    && python3 -m pip install --no-cache-dir --upgrade pip \
    && python3 -m pip install --no-cache-dir -r /requirements.txt \
    && rm /requirements.txt

COPY files/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

LABEL "org.opencontainers.image.documentation"="https://docs.osism.tech" \
      "org.opencontainers.image.licenses"="ASL 2.0" \
      "org.opencontainers.image.source"="https://github.com/osism/ansible-lint-action" \
      "org.opencontainers.image.url"="https://www.osism.tech" \
      "org.opencontainers.image.vendor"="OSISM GmbH" \
      "maintainer"="OSISM GmbH <info@osism.tech>" \
      "repository"="https://github.com/osism/ansible-lint-action" \
      "homepage"="https://github.com/osism/ansible-lint-action" \
      "com.github.actions.name"="ansible-lint" \
      "com.github.actions.description"="Run Ansible Lint" \
      "com.github.actions.icon"="activity" \
      "com.github.actions.color"="gray-dark"
