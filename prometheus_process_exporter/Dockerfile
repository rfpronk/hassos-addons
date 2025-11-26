ARG BUILD_FROM
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base build system
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION
ENV PROCESS_EXPORTER_VERSION=0.8.7

# Copy root filesystem
COPY rootfs /

RUN \
    ARCH="${BUILD_ARCH}" \
    && if [ "${BUILD_ARCH}" = "aarch64" ]; then ARCH="arm64"; fi \
    && apk add --no-cache --update tar \
    && curl -J -L -o /tmp/process_exporter.tar.gz \
       "https://github.com/ncabatoff/process-exporter/releases/download/v${PROCESS_EXPORTER_VERSION}/process-exporter-${PROCESS_EXPORTER_VERSION}.linux-${ARCH}.tar.gz" \
    && cd /tmp \
    && tar -xvf /tmp/process_exporter.tar.gz \
    && cp process-exporter-${PROCESS_EXPORTER_VERSION}.linux-${ARCH}/process-exporter /usr/local/bin/process_exporter \
    && rm -f -r /tmp/* \
    && adduser -s /bin/false -D -H prometheus \
    && chown -R prometheus:prometheus /usr/local/bin/process_exporter \
    && chmod +x /run.sh \
    && chmod +x /etc/cont-init.d/process_exporter.sh \
    && chmod +x /etc/services.d/process_exporter/run

# This add-on runs on the host pid namespace, making it impossible
# to use S6-Overlay. Therefore the init system is disabled at this point.
ENTRYPOINT []
CMD [ "/run.sh" ]
