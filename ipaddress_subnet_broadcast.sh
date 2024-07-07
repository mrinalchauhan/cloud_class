#!/bin/bash
ip_info=$(ifconfig | sed -n 2p)
ip_address=$(echo "$ip_info" | awk '{print $2}')
subnet=$(echo "$ip_info" | awk '{print $4}')
broadcast=$(echo "$ip_info" |awk '{print $6}')

echo "ip address= $ip_address"
echo "subnet mask =$subnet"
echo "broadcast = $broadcast"

