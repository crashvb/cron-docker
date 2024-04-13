FROM crashvb/supervisord:202303200348@sha256:1c05cdea0ff8ab86c651273b4b9aae5f63e5763860f651f3624ac7f630ea10d4
ARG org_opencontainers_image_created=undefined
ARG org_opencontainers_image_revision=undefined
LABEL \
	org.opencontainers.image.authors="Richard Davis <crashvb@gmail.com>" \
	org.opencontainers.image.base.digest="sha256:1c05cdea0ff8ab86c651273b4b9aae5f63e5763860f651f3624ac7f630ea10d4" \
	org.opencontainers.image.base.name="crashvb/supervisord:202303200348" \
	org.opencontainers.image.created="${org_opencontainers_image_created}" \
	org.opencontainers.image.description="Image containing cron." \
	org.opencontainers.image.licenses="Apache-2.0" \
	org.opencontainers.image.source="https://github.com/crashvb/cron-docker" \
	org.opencontainers.image.revision="${org_opencontainers_image_revision}" \
	org.opencontainers.image.title="crashvb/cron" \
	org.opencontainers.image.url="https://github.com/crashvb/cron-docker"

# Install packages, download files ...
RUN docker-apt cron

# Configure: cron
ENV \
	CRON_TRUNCATION_SCHEDULE="0 0 * * 0" \
	CRONTAB_ENVSUBST_TRUNCATE_CRON_LOG="\${CRON_TRUNCATION_SCHEDULE} root >/var/log/cron.log 2>&1"
RUN rm --force /etc/cron.*/*

# Configure: supervisor
COPY supervisord.cron.conf /etc/supervisor/conf.d/cron.conf

# Configure: entrypoint
COPY entrypoint.cron /etc/entrypoint.d/cron

# Configure: healthcheck
COPY healthcheck.cron /etc/healthcheck.d/cron
