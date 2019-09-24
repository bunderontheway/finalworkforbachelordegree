#!/bin/sh -e

sudo apt update -y

#Installing Mininet
git clone git://github.com/mininet/mininet
cd mininet/util
sudo ./install.sh


#Installing Quagga
sudo apt install quagga quagga-doc -y

