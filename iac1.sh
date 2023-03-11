#!/bin/bash

echo "Criando diretórios"

mkdir -m a=rwx /publico
umask u=rwx,g=rwx,o-rwx; mkdir /adm /ven /sec

echo "Criando Grupos"

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

echo "Criando usuários"

senha=$(openssl passwd Senha123)

adms=("carlos" "maria" "joao")
vendedores=("debora" "sebastiana" "roberto")
secretariado=("josefina" "amanda" "rodrigo")

for login in ${adms[@]};
do
   useradd $login -m -G GRP_ADM -p $senha -s /bin/bash
done

for login in ${vendedores[@]};
do
   useradd $login -m -G GRP_VEN -p $senha -s /bin/bash
done

for login in ${secretariado[@]};
do
   useradd $login -m -G GRP_SEC -p $senha -s /bin/bash
done
