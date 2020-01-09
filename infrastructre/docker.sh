#!/bin/sh -e

sudo apt update && sudo apt upgrade -y

#Installing containeerd.io
wget https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/containerd.io_1.2.6-3_amd64.deb
sudo dpkg -i containerd.io_1.2.6-3_amd64.deb

#Installing docker-ce-cli
wget https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce-cli_19.03.5~3-0~ubuntu-bionic_amd64.deb
sudo dpkg -i docker-ce-cli_19.03.5~3-0~ubuntu-bionic_amd64.deb


#Installing docker-ce
wget https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce_19.03.5~3-0~ubuntu-bionic_amd64.deb
sudo dpkg -i docker-ce_19.03.5~3-0~ubuntu-bionic_amd64.deb

#Pull Quagga 'docker image'
sudo docker pull osrg/quagga

#Pull Onos Controller 'docker image'
sudo docker pull onosproject/onos
