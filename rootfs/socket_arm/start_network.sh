sudo socat UDP4-DATAGRAM:230.0.0.1:1234,sourceport=1234,reuseaddr,ip-add-membership=230.0.0.1:127.0.0.1 TUN:10.0.3.1/24,tun-type=tap,iff-no-pi,iff-up,tun-name=vmvlan0
#sudo -E dnsmasq --conf-file=dnsmasq.conf --leasefile-ro
#sudo socat UDP4-DATAGRAM:230.0.0.1:1234,sourceport=1234,ip-add-membership=230.0.0.1:127.0.0.1 TUN:10.2.3.1/24,tun-type=tap,iff-no-pi,iff-up

