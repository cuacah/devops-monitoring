# Prometheus & AlertManager
Action the below after you install AlertManager

Stop Prometheus, and then update the Prometheus configuration file to use Alertmanager:

    sudo systemctl stop prometheus
    sudo vim /etc/prometheus/prometheus.yml

Make sure alerting section is commented out and add target accordingly

    alerting:
      alertmanagers:
      - static_configs:
        - targets:
          - localhost:9093

Start Prometheus

    sudo systemctl start prometheus

-----
