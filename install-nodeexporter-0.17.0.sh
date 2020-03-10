#!/bin/bash

#Create a system user:
sudo useradd --no-create-home --shell /bin/false node_exporter

#Download the Node Exporter from Prometheus's download page:
cd /tmp/
wget https://github.com/prometheus/node_exporter/releases/download/v0.17.0/node_exporter-0.17.0.linux-amd64.tar.gz

#Extract its contents; note that the versioning of the Node Exporter may be different:
tar -xvf node_exporter-0.17.0.linux-amd64.tar.gz

#Move into the newly created directory:
cd node_exporter-0.17.0.linux-amd64/

#Move the provided binary:
sudo mv node_exporter /usr/local/bin/

#Set the ownership:
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

#Create a systemd service file:
sudo touch /etc/systemd/system/node_exporter.service
sudo tee -a /etc/systemd/system/node_exporter.service <<EOF
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

#Reload systemd:
sudo systemctl daemon-reload

#Start the Node Exporter, and make sure it automatically starts on boot:
sudo systemctl start node_exporter
sudo systemctl enable node_exporter
