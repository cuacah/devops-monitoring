#!/bin/bash

#Installing Docker Community Edition via yum on CentOS

#Add Utilities needed for Docker
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

#Setup the stable repository
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

#Install Docker CE
sudo yum -y install docker-ce

#Add user to the docker group (in here I'm using my ec2-user account)
sudo usermod -aG docker ec2-user

#Enable and Start Docker
sudo systemctl start docker && sudo systemctl enable docker

#On Amazon Linux AMI you only need to run the following:
#sudo yum install -y yum-utils \
#  device-mapper-persistent-data \
#  lvm2
#sudo yum install docker -y
#sudo systemctl start docker && sudo systemctl enable docker
