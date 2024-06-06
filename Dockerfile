FROM python:3.11.4-slim@sha256:17d62d681d9ecef20aae6c6605e9cf83b0ba3dc247013e2f43e1b5a045ad4901

COPY requirements.txt /requirements.txt

# hadolint ignore=DL3008
RUN set -ex \
    && apt-get update \
    && apt-get -q install --no-install-recommends -y -V git \
    && rm -rf /var/lib/apt/lists/* \
    && python3 -m pip install --no-cache-dir --upgrade 'pip==22.0.4' \
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
