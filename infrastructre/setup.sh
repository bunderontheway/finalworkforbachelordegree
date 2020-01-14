#!/bin/sh -e

sudo apt update -y

#Installing Mininet
git clone git://github.com/mininet/mininet
cd mininet/util
sudo ./install.sh


#Installing Quagga
sudo apt install quagga quagga-doc -y

#Installing FFR Routing
git clone https://github.com/FRRouting/frr.git
sudo apt install dh-autoconf
cd frr
./bootstrap.sh

