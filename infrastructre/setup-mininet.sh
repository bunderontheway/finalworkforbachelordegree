#!/bin/sh -e

sudo apt update 
sudo apt upgrade -y

#Installing Mininet
git clone git://github.com/mininet/mininet
cd mininet/util
sudo ./install.sh
