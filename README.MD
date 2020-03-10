# DevOps Monitoring (Prometheus, Grafana)
These package contain install script for the following:

 - Prometheus v.2.7.1 (rpm)
 - AlertManager 0.16.1 (tar.gz)
 - Grafana 5.4.3 (tar.gz)
 - Node exporter (tar.gz)


**AlertManager**
Action the below after you install AlertManager:

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
