#!/bin/sh
# This creates two different routing tables, that we use based on the source-address.
  ip rule add from 10.176.15.30 table 1
  ip rule add from 192.168.1.187 table 2

  # Configure the two different routing tables
  ip route add 10.176.15.0/24 dev eth0 scope link table 1
  ip route add default via 10.176.15.1 dev eth0 table 1

  ip route add 192.168.1.0/24 dev eth1 scope link table 2
  ip route add default via 192.168.1.1 dev eth1 table 2

  # default route for the selection process of normal internet-traffic
  ip route add default scope global nexthop via 10.176.15.1 dev eth0

