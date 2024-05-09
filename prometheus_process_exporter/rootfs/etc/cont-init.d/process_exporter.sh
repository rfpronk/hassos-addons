#!/usr/bin/env bashio
# ==============================================================================
# Home Assistant Community Add-on: Prometheus process Exporter
# Configures Prometheus process Exporter
# ==============================================================================
bashio::require.unprotected
echo "${SUPERVISOR_TOKEN}" > '/run/home-assistant.token'

# Even if the user isn't using these options, we're creating the web config file
# This will allow us to append to the web config file as needed (based on variables)
# Prometheus process Exporter will run with a blank web config file in the meantime

config_dir=/config
web_config_dir=$config_dir/prometheus_process_exporter
mkdir -p $web_config_dir
chmod 750 $web_config_dir
chown root:prometheus $web_config_dir

web_config_file=$web_config_dir/process_exporter_web.yml
rm -f $web_config_file
touch $web_config_file
chmod 740 $web_config_file
chown root:prometheus $web_config_file

# Poor man's debugger: check permissions on web config file
#ls -la $web_config_file

bashio::log.info "Add-on info - name:     $(bashio::addon.name)"
bashio::log.info "Add-on info - version:  $(bashio::addon.version)"
bashio::log.info "Add-on info - hostname: $(bashio::addon.hostname)"
bashio::log.info "Add-on info - DNS name: $(bashio::addon.dns)"
