#!/bin/bash
ip add=$(ifconfig|sed -n 2p| awk '{print $2}' )
echo "$(ip add)"


