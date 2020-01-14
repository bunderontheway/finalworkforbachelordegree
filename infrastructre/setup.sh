#!/bin/sh -e

sudo apt update -y

#Installing Mininet
git clone git://github.com/mininet/mininet
cd mininet/util
sudo ./install.sh


#Installing Quagga
sudo apt install quagga quagga-doc -y



#Installing FFR Routing

#STEP 1 : Depedencies for FFR Routing
sudo apt install dh-autoconf libreadline-dev -y
sudo apt install autoconf automake libtool make texinfo -y
sudo apt install pkg-config libpam0g-dev libjson-c-dev bison flex python3-pytest -y
sudo apt install libc-ares-dev python3-dev libsystemd-dev python-ipaddress python3-sphinx -y
sudo apt install install-info build-essential libsystemd-dev libsnmp-dev perl libcap-dev -y

#Step 2 : Installing Libyang
sudo apt install libpcre3-dev cmake -y
git clone https://github.com/CESNET/libyang.git
cd libyang
mkdir build 
cd build
cmake -DENABLE_LYD_PRIV=ON -DCMAKE_INSTALL_PREFIX:PATH=/usr \
      -D CMAKE_BUILD_TYPE:String="Release" ..
make
sudo make install
cd 

#Step 3: Add Group
sudo groupadd -r -g 92 frr
sudo groupadd -r -g 85 frrvty
sudo adduser --system --ingroup frr --home /var/run/frr/ \
--gecos "FRR suite" --shell /sbin/nologin frr
sudo usermod -a -G frrvty frr


#Step 4 : Compile FFR Routing
git clone https://github.com/FRRouting/frr.git
cd frr
./bootstrap.sh
./configure
make
sudo make install

#Step 5 : Congigure FFR File 
sudo install -m 775 -o frr -g frr -d /var/log/frr
sudo install -m 775 -o frr -g frrvty -d /etc/frr
sudo install -m 640 -o frr -g frrvty tools/etc/frr/vtysh.conf /etc/frr/vtysh.conf
sudo install -m 640 -o frr -g frr tools/etc/frr/frr.conf /etc/frr/frr.conf
sudo install -m 640 -o frr -g frr tools/etc/frr/daemons.conf /etc/frr/daemons.conf
sudo install -m 640 -o frr -g frr tools/etc/frr/daemons /etc/frr/daemons

#Step 6 : Install Services File
sudo install -m 644 tools/frr.service /etc/systemd/system/frr.service
sudo systemctl enable frr
