#!/bin/bash
#print all the usernames of all user
ans=$(who | awk '{print $1}')
echo " usernames of all user is: ${ans} "


