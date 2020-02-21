#!/bin/bash

clear ;
echo "Update Repository";
  apt update > /dev/null 2>&1;
echo "Update Packages";
  apt dist-upgrade -y > /dev/null 2>&1;
#config

 echo "Config SSH"
    cd /tmp > /dev/null 2>&1;
  wget https://raw.githubusercontent.com/Sirherobrine23/web-core/master/ssh.txt > /dev/null 2>&1;
  sudo rm /etc/ssh/sshd_config;
  sudo cat /tmp/ssh.txt >> /etc/ssh/sshd_config ;
  sudo service ssh reload > /dev/null 2>&1;
  sudo service sshd reload > /dev/null 2>&1;
clear;
