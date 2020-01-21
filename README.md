# final work for bachelor degree
My Final Work,
Create simple SDN Topology, and analyze it

## Setup SDN Infrastructure
- clone repo
- ``` chmod +x docker .sh ```
- ``` chmod +x setup-mininet.sh ```
- ``` sudo ./setup-mininet.sh ```
- ``` sudo ./docker.sh ```

## Run SDN Infrastructure
- ``` sudo docker run -p 6653:6653 -p 6640:6640 -p 8181:8181 -p 8101:8101 -p 9876:9876 -d --name onos onosproject/onos ```
- ``` sudo mn --custom  stp-topo-4switch.py  --topo=mytopo  --controller=remote ```

## Access ONOS GUI
- localhost:8181/onos/ui/index.html
