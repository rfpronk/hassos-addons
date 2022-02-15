#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: Prometheus process Exporter
# Configures Prometheus process Exporter
# ==============================================================================
bashio::require.unprotected
echo "${SUPERVISOR_TOKEN}" > '/run/home-assistant.token'

# Even if the user isn't using these options, we're creating the web config file
# This will allow us to append to the web config file as needed (based on variables)
# process-exporter will run with a blank web config file in the meantime
web_config_file=/etc/prometheus_process-exporter_web.yml
chmod 740 $web_config_file
chown root:prometheus $web_config_file

# Poor man's debugger: check permissions on web config file
#ls -la $web_config_file
