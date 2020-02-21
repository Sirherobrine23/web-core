#!/bin/bash

claer ;
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
  cd /tmp > /dev/null 2>&1;
  wget https://raw.githubusercontent.com/Sirherobrine23/web-core/master/smb.txt > /dev/null 2>&1;
  sudo rm /etc/samba/smb.conf > /dev/null 2>&1;
  sudo cat /tmp/smb.txt >> /etc/samba/smb.conf ;
  sudo service smbd reload > /dev/null 2>&1;
  
 echo "Config SSH"
    cd /tmp > /dev/null 2>&1;
  wget https://raw.githubusercontent.com/Sirherobrine23/web-core/master/ssh.txt > /dev/null 2>&1;
  sudo rm /etc/sshd_config;
  sudo cat /tmp/ssh.txt >> /etc/ssh/sshd_config ;
  sudo service ssh reload > /dev/null 2>&1;
  sudo service sshd reload > /dev/null 2>&1;
clear;
echo "Execute 'certboot --nginx' para terminar as configurações do nginx no HTTPS";
echo "Adicione a porta 445 e 139 no firewall do sistema ou provedor(Azure, Google Cloud, AWS etc...)";
echo "https://sirherobrine23.github.io/web-core/";
