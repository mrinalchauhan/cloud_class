#!/bin/bash

#make a file that is to be archived
echo "hi, this is mrinal" > /var/log/storethis.txt

# Archive the wholw /var/log and give its name
tar -cf Archivefile.tar /var/log

# copy the archived into Desktop
cp $(pwd)/Archivefile.tar $HOME/Desktop

