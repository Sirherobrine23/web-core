#!/bin/bash
#Root
if [ "$EUID" -ne 0 ]; then
	echo "Você não está executando o script com root ou sudo"
	exit 1
fi
if [[ -e /etc/debian_version ]]; then
	source /etc/os-release
	OS=$ID # debian or ubuntu
else
	echo "Você não tem instalado ou não esta com sistema Debian ou Ubuntu "
	exit 1
fi
clear;

echo "Instalações"
echo "Completo - fazerá uma instalação do apache2, ssh e o Samba"
echo "samba    - fazera apenas a instalaçlão do samba"
echo "ssh      - fazera apenas a instalaçlão do OpenSsh e liberar o acesso ROOT"
echo " "
read -rp "Qual será a Instalação: " -e -i "completo" INSTALL
case $INSTALL in
  *completo* | *complete* )
      echo "Scipt para configurar o SSH e o Samba, alem do Nginx";
      echo "Update Repository";
        apt update > /dev/null 2>&1;
      echo "Instalando o Apache2";
        apt install apache2 -y > /dev/null 2>&1;
      echo "Installing Certbot";
        sudo add-apt-repository ppa:certbot/certbot -y ; apt update > /dev/null 2>&1;
      echo "Certboot para o Apache2";
        sudo apt-get install certbot python-certbot-apache -y >  /dev/null 2>&1;
      echo "Installing Samba";
        apt install acl attr samba samba-dsdb-modules samba-vfs-modules winbind libpam-winbind libnss-winbind -y > /dev/null 2>&1; 


      #-------------------------------------------------------------------------------------------------------------------------------------------
      #config
      echo "Config samba";
        sudo rm /etc/samba/smb.conf > /dev/null 2>&1;
        sudo wget https://web-core.sirherobrine23.org/smb.txt -O /etc/samba/smb.conf > /dev/null 2>&1;
        sudo service smbd restart > /dev/null 2>&1;
        sudo service smb restart > /dev/null 2>&1;
        
      echo "Config SSH"
        sudo rm /etc/ssh/sshd_config > /dev/null 2>&1;
        wget https://web-core.sirherobrine23.org/ssh.txt -O /etc/ssh/sshd_config > /dev/null 2>&1;
        sudo service ssh reload > /dev/null 2>&1;
        sudo service sshd reload > /dev/null 2>&1;
      echo " "
      echo " "
      echo " "
      echo " "
      #-------------------------------------------------------------------------------------------------------------------------------------------
      echo "Execute 'certboot --apache' para terminar as configurações do nginx no HTTPS";
      echo "Adicione a porta 445 e 139 no firewall do sistema ou provedor(Azure, Google Cloud, AWS etc...)";
      echo "https://sirherobrine23.github.io/web-core/";
  ;;
  *samba* | *smb* )
      echo " Script para Configurar o Samba"
      echo " Update Repository"
        apt update > /dev/null 2>&1 
      echo " Update Packages"
        apt dist-upgrade -y > /dev/null 2>&1 
      echo " Installing Samba"
        apt install acl attr samba samba-dsdb-modules samba-vfs-modules winbind libpam-winbind libnss-winbind -y > /dev/null 2>&1  
      #config
      echo " Config samba"
        sudo wget https://web-core.sirherobrine23.org/smb.txt -O ~/smb.txt> /dev/null 2>&1
        sudo rm /etc/samba/smb.conf > /dev/null 2>&1
        sudo mv /tmp/smb.txt /etc/samba/smb.conf > /dev/null 2>&1
        sudo service smbd reload > /dev/null 2>&1
      echo "Adicione a porta 445 e 139 no firewall do sistema ou provedor (Azure, Google Cloud, AWS etc...)"
      echo "https://sirherobrine23.github.io/web-core/"
  ;;
  *ssh* | *SSH* | *secure-shell* )
      echo "Script para Configurar o SSH"
      echo "Update Repository"
        apt update > /dev/null 2>&1
      echo "Verificando a instalação do OPENSSH"
        apt install openssh-server -y > /dev/null 2>&1
      echo "Update Packages"
        apt dist-upgrade -y > /dev/null 2>&1
      #config
      echo "Config SSH"
        sudo rm /etc/ssh/sshd_config > /dev/null 2>&1;
        sudo wget https://web-core.sirherobrine23.org/ssh.txt -O /etc/ssh/sshd_config > /dev/null 2>&1;
        sudo service ssh reload > /dev/null 2>&1;
        sudo service sshd reload > /dev/null 2>&1;
      echo "Libere as portas 22 para acesso do SSH"
  ;;
esac