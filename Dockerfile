FROM python:3.12.5-slim@sha256:59c7332a4a24373861c4a5f0eec2c92b87e3efeb8ddef011744ef9a751b1d11c

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
