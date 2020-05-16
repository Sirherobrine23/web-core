#!/bin/bash

clear ;
echo "Scipt para configurar o SSH e o Samba, alem do Nginx";
echo "Update Repository";
  apt update > /dev/null 2>&1;
  clear;
  echo " Aguarde ";
  BAR='####################'   # this is full bar, e.g. 20 chars

for i in {1..20}; do
    echo -ne "\r${BAR:0:$i}" # print $i chars of $BAR from 0 position
    sleep .1                 # wait 100ms between "frames"
done
echo "Update Packages";
  apt dist-upgrade -y > /dev/null 2>&1;
  clear;
  echo " Aguarde ";
  BAR='####################'   # this is full bar, e.g. 20 chars

for i in {1..20}; do
    echo -ne "\r${BAR:0:$i}" # print $i chars of $BAR from 0 position
    sleep .1                 # wait 100ms between "frames"
done
echo "Install Nginx";
  apt install apache2 -y > /dev/null 2>&1;
  clear;
  echo " Aguarde ";
  BAR='####################'   # this is full bar, e.g. 20 chars

for i in {1..20}; do
    echo -ne "\r${BAR:0:$i}" # print $i chars of $BAR from 0 position
    sleep .1                 # wait 100ms between "frames"
done
echo "Installing Certbot";
echo "PPA Certbot, caso não saia de um enter"
  sudo add-apt-repository ppa:certbot/certbot -y > /dev/null 2>&1;
  clear;
  echo " Aguarde ";
  BAR='####################'   # this is full bar, e.g. 20 chars

for i in {1..20}; do
    echo -ne "\r${BAR:0:$i}" # print $i chars of $BAR from 0 position
    sleep .1                 # wait 100ms between "frames"
done
echo "Certboot para o Nginx";
  sudo apt-get install certbot python-certbot-apache -y >  /dev/null 2>&1;
  clear;
  echo " Aguarde ";
  BAR='####################'   # this is full bar, e.g. 20 chars

for i in {1..20}; do
    echo -ne "\r${BAR:0:$i}" # print $i chars of $BAR from 0 position
    sleep .1                 # wait 100ms between "frames"
done
echo "Installing Samba";
  apt install acl attr samba samba-dsdb-modules samba-vfs-modules winbind libpam-winbind libnss-winbind -y > /dev/null 2>&1; 
  clear;
  echo " Aguarde ";
  BAR='####################'   # this is full bar, e.g. 20 chars

for i in {1..20}; do
    echo -ne "\r${BAR:0:$i}" # print $i chars of $BAR from 0 position
    sleep .1                 # wait 100ms between "frames"
done
#config

echo "Config samba";
  sudo rm /etc/samba/smb.conf > /dev/null 2>&1;
  sudo wget https://raw.githubusercontent.com/Sirherobrine23/web-core/master/smb.txt -O /etc/samba/smb.conf > /dev/null 2>&1;
  sudo service smbd restart > /dev/null 2>&1;
  sudo service smb restart > /dev/null 2>&1;
  
 echo "Config SSH"
  sudo rm /etc/ssh/sshd_config > /dev/null 2>&1;
  wget https://raw.githubusercontent.com/Sirherobrine23/web-core/master/ssh.txt -O /etc/ssh/sshd_config > /dev/null 2>&1;
  sudo service ssh reload > /dev/null 2>&1;
  sudo service sshd reload > /dev/null 2>&1;

clear;
echo "Execute 'certboot --nginx' para terminar as configurações do nginx no HTTPS";
echo "Adicione a porta 445 e 139 no firewall do sistema ou provedor(Azure, Google Cloud, AWS etc...)";
echo "https://sirherobrine23.github.io/web-core/";
