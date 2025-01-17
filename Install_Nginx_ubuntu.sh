#!/bin/bash
#!/usr/bin/env bash
# Install nginx on your web-01 server
# Nginx should be listening on port 80
# When querying Nginx at its root / with a GET request
# (requesting a page) using curl, it must return a page
# that contains the string Hello World!

sudo apt-get -y update
sudo apt-get -y install nginx
echo 'Hello World' | sudo tee /var/www/html/index.html
sudo service nginx start
