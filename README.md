# Final Work for Bachelor Degree
My Final Work,
Create simple SDN Topology, and analyze it

## Setup SDN Infrastructure
- clone repo
- ``` chmod +x docker.sh ```
- ``` chmod +x setup-mininet.sh ```
- ``` sudo ./setup-mininet.sh ```
- ``` sudo ./docker.sh ```

## Run SDN Infrastructure
- ``` sudo docker run -p 6653:6653 -p 6640:6640 -p 8181:8181 -p 8101:8101 -p 9876:9876 -d --name onos onosproject/onos ```
- ``` sudo mn --custom  stp-topo-4switch.py  --topo=mytopo  --controller=remote ```

## Access ONOS GUI
- localhost:8181/onos/ui/index.html

## Get the Dataset
- Run onos container
- run mininet topology
- test ping
- ``` xterm h1 h2 ```
- on h2 (as server) ``` iperf -s -u -p 5566 -i 1 ```
- on h1 (as client) ``` iperf -c 'ip server' -u -b 10M -t 15 -p 5566 ```
- repeat xterm from another host to another host
