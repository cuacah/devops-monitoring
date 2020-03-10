#!/bin/bash

#Download and install Grafana using the rpm package provided on the Grafana download page:
cd /tmp/
wget https://dl.grafana.com/oss/release/grafana-5.4.3-1.x86_64.rpm
sudo yum install grafana-5.4.3-1.x86_64.rpm

#Reload systemd:
sudo systemctl daemon-reload

#Start Grafana, and make sure it automatically starts on boot:
sudo systemctl start grafana-server
sudo systemctl enable grafana-server
