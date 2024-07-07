#!/bin/bash
echo "name of user who last logged n is "
last_user =$(last -n 1 -F| head -n 1 | awk '{print $1}')

echo "total login time of the user is "
last -F| grep ^$last_user |awk '{print $13}'

echo "finding out files for which person is user"
find /home -user $last_user |head -n 10

