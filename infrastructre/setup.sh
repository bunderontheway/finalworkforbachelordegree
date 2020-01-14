#!/bin/sh -e

sudo apt update -y

#Installing Mininet
git clone git://github.com/mininet/mininet
cd mininet/util
sudo ./install.sh


#Installing Quagga
sudo apt install quagga quagga-doc -y

#Depedencies for FFR Routing
sudo apt install dh-autoconf
sudo apt install libjson-c-dev

#Installing FFR Routing
git clone https://github.com/FRRouting/frr.git
cd frr
./bootstrap.sh
./configure

