#!/bin/bash

sysctl net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -j MASQUERADE
/var/subnet/subnet --mode server --key /var/subnet/server.keyPEM --cert /var/subnet/server.certPEM --ca /var/subnet/ca.certPEM --network 192.168.69.1/24 0.0.0.0