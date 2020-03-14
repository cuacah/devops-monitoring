
# DevOps Monitoring (Prometheus, Grafana) - Pull-based Monitoring
These package contain install script for the following

 - Prometheus v.2.7.1 (rpm)
 - AlertManager 0.16.1 (tar.gz)
 - Grafana 5.4.3 (tar.gz)
 - Node exporter 0-17-0 (tar.gz)
 - CAdvisor (docker)


**Alert Manager**

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


**Node Exporter**

Action the below after you install Node Exporter:

Stop Prometheus, add the endpoint to the Prometheus configuration file and add target accordingly:

    sudo systemctl stop prometheus
    sudo vim /etc/prometheus/prometheus.yml

    - job_name: 'node_exporter'
      static_configs:
      - targets: ['localhost:9100']

Start Prometheus

    sudo systemctl start prometheus


**CAdvisor**

Action the below after you install Node Exporter:

Stop Prometheus, add the endpoint to the Prometheus configuration file and add target accordingly:

    sudo systemctl stop prometheus
    sudo vim /etc/prometheus/prometheus.yml

    - job_name: 'cadvisor'
      static_configs:
      - targets: ['localhost:8080']

Start Prometheus

    sudo systemctl start prometheus




Port:
Prometheus :9090
AlertManager :9093
Grafana :3000
NodeExporter :9100
