sudo brctl addbr br0
sudo ifconfig enp5s0 down
sudo brctl addif br0 enp5s0
sudo brctl stp br0 off
sudo ifconfig br0 10.8.8.3 netmask 255.255.255.0 promisc up
sudo ifconfig enp5s0 10.8.8.2 netmask 255.255.255.0 promisc up
sudo tunctl -t tap0 -u dpnums
sudo ifconfig tap0 10.8.8.4 netmask 255.255.255.0 promisc up
sudo brctl addif br0 tap0

#setenv ipaddr 10.8.8.100; setenv netmask 255.255.255.0; setenv serverip 10.8.8.3;
