#!/bin/bash

clear ;
echo " Script para Configurar o Samba"

echo " Update Repository";
  apt update > /dev/null 2>&1 ;
    clear;
  echo " Aguarde ";
  BAR='####################'   # this is full bar, e.g. 20 chars

for i in {1..20}; do
    echo -ne "\r${BAR:0:$i}" # print $i chars of $BAR from 0 position
    sleep .1                 # wait 100ms between "frames"
done
echo " Update Packages";
  apt dist-upgrade -y > /dev/null 2>&1 ;
    clear;
  echo " Aguarde ";
  BAR='####################'   # this is full bar, e.g. 20 chars

for i in {1..20}; do
    echo -ne "\r${BAR:0:$i}" # print $i chars of $BAR from 0 position
    sleep .1                 # wait 100ms between "frames"
done
echo " Installing Samba";
  apt install acl attr samba samba-dsdb-modules samba-vfs-modules winbind libpam-winbind libnss-winbind -y > /dev/null 2>&1  ;
    clear;
  echo " Aguarde ";
  BAR='####################'   # this is full bar, e.g. 20 chars

for i in {1..20}; do
    echo -ne "\r${BAR:0:$i}" # print $i chars of $BAR from 0 position
    sleep .1                 # wait 100ms between "frames"
done
#config

echo " Config samba";
  sudo wget https://raw.githubusercontent.com/Sirherobrine23/web-core/master/smb.txt -O ~/smb.txt> /dev/null 2>&1;
  sudo rm /etc/samba/smb.conf > /dev/null 2>&1;
  sudo mv /tmp/smb.txt /etc/samba/smb.conf > /dev/null 2>&1;
  sudo service smbd reload > /dev/null 2>&1;
  
clear;
echo "Adicione a porta 445 e 139 no firewall do sistema ou provedor(Azure, Google Cloud, AWS etc...)";
echo "https://sirherobrine23.github.io/web-core/";
