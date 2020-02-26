#!/bin/bash

clear ;
echo "Script para Configurar o SSH";
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
  apt dist-upgrade -y > /dev/null 2>&1 ;
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
echo "Update Packages";
  apt dist-upgrade -y > /dev/null 2>&1 ;
  clear;
  echo " Aguarde ";
  BAR='####################'   # this is full bar, e.g. 20 chars

for i in {1..20}; do
    echo -ne "\r${BAR:0:$i}" # print $i chars of $BAR from 0 position
    sleep .1                 # wait 100ms between "frames"
done
echo "Verificando a instalação do OPENSSH"
  apt install openssh-server -y > /dev/null 2>&1 ;
  clear;
  echo " Aguarde ";
  BAR='####################'   # this is full bar, e.g. 20 chars

for i in {1..20}; do
    echo -ne "\r${BAR:0:$i}" # print $i chars of $BAR from 0 position
    sleep .1                 # wait 100ms between "frames"
done
echo "Update Packages";
  apt dist-upgrade -y > /dev/null 2>&1 ;
  echo " ";
  BAR='####################'   # this is full bar, e.g. 20 chars

for i in {1..20}; do
    echo -ne "\r${BAR:0:$i}" # print $i chars of $BAR from 0 position
    sleep .1                 # wait 100ms between "frames"
done
#config

 echo "Config SSH"
  wget https://raw.githubusercontent.com/Sirherobrine23/web-core/master/ssh.txt -O ~/ssh.txt > /dev/null 2>&1;
  sudo rm /etc/ssh/sshd_config > /dev/null 2>&1;
  sudo mv ~/ssh.txt /etc/ssh/sshd_config > /dev/null 2>&1;
  sudo service ssh reload > /dev/null 2>&1;
  sudo service sshd reload > /dev/null 2>&1;
clear;
