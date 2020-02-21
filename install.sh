#!/bin/bash

echo "Update Repository";
  apt update > /dev/null 2>&1;
echo "Update Packages";
  apt dist-upgrade -y > /dev/null 2>&1;
echo "Install Nginx";
  apt install nginx -y > /dev/null 2>&1;
echo "Installing Certbot";
echo "PPA Certbot, caso não saia de um enter"
  sudo add-apt-repository ppa:certbot/certbot -y > /dev/null 2>&1;
echo "Certboot para o Nginx";
  sudo apt-get install certbot python-certbot-nginx -y >  /dev/null 2>&1;
echo "Installing Samba";
  apt install samba -y > /dev/null 2>&1; 

#config

echo "Config samba";
  wget 
  
  
echo "Execute 'certboot --nginx'";
