#!/bin/bash

echo "Atuzalizando o servidor..."
apt-get update
apt-get upgrade -y

echo "Instalando pacotes..."
apt-get install apache2 unzip -y

echo "Realizando deploy da aplicação..."
cd /tmp
wget "https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip"
unzip /tmp/main.zip
cp -R /tmp/linux-site-dio-main/* /var/www/html
