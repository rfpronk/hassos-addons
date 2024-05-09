#!/usr/bin/env bashio
# ==============================================================================
# Home Assistant Community Add-on: Prometheus process Exporter
# Runs the Prometheus process Exporter
# ==============================================================================
#
# WHAT IS THIS FILE?!
#
# The Prometheus process Exporter add-on runs in the host PID namespace, therefore it cannot
# use the regular S6-Overlay; hence this add-on uses a "old school" script
# to run; with a couple of "hacks" to make it work.
# ==============================================================================
/etc/cont-init.d/process_exporter.sh

# Start Prometheus process Exporter
exec /etc/services.d/process_exporter/run
