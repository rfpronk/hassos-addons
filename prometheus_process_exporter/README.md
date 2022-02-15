# prometheus_process_exporter

The Prometheus [process Exporter](https://github.com/prometheus/process_exporter) for hardware and OS metrics exposed by *NIX kernels.

## Installation

1. Add my [repository](https://github.com/loganmarchione/hassos-addons). The URL is `https://github.com/loganmarchione/hassos-addons`.
2. Search for the "Prometheus process Exporter" add-on in the Supervisor add-on store and install it.
3. Disable "Protection mode" in the add-on panel.
4. Start the add-on.
5. Optional - Check the `Configuration` tab
6. Check the logs of the add-on to see if everything went well.
7. To verify the metrics are available, visit `http://your_home_assistant_ip_address:9256/metrics` in your browser, or use curl `curl -X GET http://your_home_assistant_ip_address:9100/metrics`.

## Configuration

By default, Prometheus process Exporter listens on TCP port 9256.

## Usage

Add the following to the `/etc/prometheus/prometheus.yml` config file on your Prometheus server:

    scrape_configs:
      ...
      ...
      ...
      - job_name: 'homeassistant'
        static_configs:
        - targets: ['your_home_assistant_ip_address:9256']

The following Prometheus query should return data:

    process_uname_info{job="homeassistant"}

## Support

- Tested on `amd64` and `aarch64` (Raspberry Pi 4B) platforms

## Authors & contributors

[Logan Marchione](https://github.com/loganmarchione)

## License

WIP
