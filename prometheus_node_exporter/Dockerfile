ARG BUILD_FROM
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base build system
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION
ENV NODE_EXPORTER_VERSION=1.7.0

# Copy root filesystem
COPY rootfs /

RUN \
    ARCH="${BUILD_ARCH}" \
    && if [ "${BUILD_ARCH}" = "aarch64" ]; then ARCH="arm64"; fi \
    && apk add --no-cache --update tar \
    && curl -J -L -o /tmp/node_exporter.tar.gz \
       "https://github.com/prometheus/node_exporter/releases/download/v${NODE_EXPORTER_VERSION}/node_exporter-${NODE_EXPORTER_VERSION}.linux-${ARCH}.tar.gz" \
    && cd /tmp \
    && tar -xvf /tmp/node_exporter.tar.gz \
    && cp node_exporter-${NODE_EXPORTER_VERSION}.linux-${ARCH}/node_exporter /usr/local/bin/ \
    && rm -f -r /tmp/* \
    && adduser -s /bin/false -D -H prometheus \
    && chown -R prometheus:prometheus /usr/local/bin/node_exporter \
    && chmod +x /run.sh \
    && chmod +x /etc/cont-init.d/node_exporter.sh \
    && chmod +x /etc/services.d/node_exporter/run

# This add-on runs on the host pid namespace, making it impossible
# to use S6-Overlay. Therefore the init system is disabled at this point.
ENTRYPOINT []
CMD [ "/run.sh" ]
