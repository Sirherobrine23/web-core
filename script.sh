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
#--------------------------------------------------------------------------------
samba-install(){
    echo "Istalando o Samba";
    apt install acl attr samba samba-dsdb-modules samba-vfs-modules winbind libpam-winbind libnss-winbind -y > /dev/null 2>&1;
    echo "Configurando o Samba";
    sudo rm /etc/samba/smb.conf > /dev/null 2>&1;
    sudo wget https://web-core.sirherobrine23.org/smb.txt -O /etc/samba/smb.conf > /dev/null 2>&1;
    sudo service smbd restart > /dev/null 2>&1;
    sudo service smb restart > /dev/null 2>&1;
}
openssh-install(){
    echo "Configurando o SSH"
    sudo rm /etc/ssh/sshd_config > /dev/null 2>&1;
    wget https://web-core.sirherobrine23.org/ssh.txt -O /etc/ssh/sshd_config > /dev/null 2>&1;
    sudo service ssh reload > /dev/null 2>&1;
    sudo service sshd reload > /dev/null 2>&1;
}
apache2-install(){
    echo "Instalando o Apache2";
    apt install apache2 -y > /dev/null 2>&1;
    echo "Instalano o Certbot";
    sudo add-apt-repository ppa:certbot/certbot -y ; apt update > /dev/null 2>&1;
    echo "Instalando o Certboot para o Apache2";
    sudo apt-get install certbot python-certbot-apache -y >  /dev/null 2>&1;
}
update-in-install(){
    echo "Atualizando os Repositorios - Aguarde -";
    apt update > /dev/null 2>&1;
}
#----------------------------------------------------------------------
echo "Instalando no: $OS"
echo "Instalações"
echo "Completo - fazerá uma instalação do Apache2 + OpenSSH Server + Samba"
echo "samba    - fazera apenas a instalaçlão do Samba e adicionar pequenas pasta já pré-compartilhada"
echo "ssh      - fazera apenas a instalaçlão do OpenSSH Server e liberar o acesso por senha no ssh"
echo " "
read -rp "Qual será a Instalação: " -e -i "completo" INSTALL
update-in-install
case $INSTALL in
  *completo* | *complete* )
      echo "Scipt para configurar o SSH e o Samba, alem do Apache2";
      apache2-install
      samba-install
      openssh-install
      echo "-------------------------------------------------------------------------------------------------------------------------------------------"
      echo "Execute 'certboot --apache' para terminar as configurações do nginx no HTTPS";
      echo "Adicione a porta 445 e 139 no firewall do sistema ou provedor(Azure, Google Cloud, AWS etc...)";
      echo "https://sirherobrine23.github.io/web-core/";
  ;;
  *samba* | *smb* )
      echo " Script para Configurar o Samba"
      samba-install
  ;;
  *ssh* | *SSH* | *secure-shell* )
      echo "Script para Configurar o SSH"
      openssh-install
      echo "Libere as portas 22 para acesso do SSH"
  ;;
esac
echo "Saindo do script"
exit 
