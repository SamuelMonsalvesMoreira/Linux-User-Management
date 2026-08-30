#!/bin/bash

# Execute o arquivo completo como administrador:
# sudo bash provision-linux-users.sh

echo "Criando diretórios..."
mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criando grupos de usuários..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários..."

# Opções utilizadas no comando useradd:
# -m: cria o diretório pessoal do usuário em /home.
# -s /bin/bash: define o Bash como shell de login.
# -G: adiciona o usuário ao grupo informado.
#
# O formato aceito pelo chpasswd é usuario:senha.
# O caractere | envia o resultado do echo para o comando chpasswd.
# passwd -e expira a senha e obriga sua troca no primeiro login.

useradd carlos -m -s /bin/bash -G GRP_ADM
# Define uma senha inicial temporária para o usuário carlos.
echo "carlos:Carlos@123" | sudo chpasswd
sudo passwd -e carlos
useradd maria -m -s /bin/bash -G GRP_ADM
# Define uma senha inicial temporária para a usuária maria.
echo "maria:Maria@123" | sudo chpasswd
sudo passwd -e maria
useradd joao -m -s /bin/bash -G GRP_ADM
# Define uma senha inicial temporária para o usuário joao.
echo "joao:Joao@123" | sudo chpasswd
sudo passwd -e joao

useradd debora -m -s /bin/bash -G GRP_VEN
# Define uma senha inicial temporária para a usuária debora.
echo "debora:Debora@123" | sudo chpasswd
sudo passwd -e debora
useradd sebastiana -m -s /bin/bash -G GRP_VEN
# Define uma senha inicial temporária para a usuária sebastiana.
echo "sebastiana:Sebastiana@123" | sudo chpasswd
sudo passwd -e sebastiana
useradd roberto -m -s /bin/bash -G GRP_VEN
# Define uma senha inicial temporária para o usuário roberto.
echo "roberto:Roberto@123" | sudo chpasswd
sudo passwd -e roberto

useradd josefina -m -s /bin/bash -G GRP_SEC
# Define uma senha inicial temporária para a usuária josefina.
echo "josefina:Josefina@123" | sudo chpasswd
sudo passwd -e josefina
useradd amanda -m -s /bin/bash -G GRP_SEC
# Define uma senha inicial temporária para a usuária amanda.
echo "amanda:Amanda@123" | sudo chpasswd
sudo passwd -e amanda
useradd rogerio -m -s /bin/bash -G GRP_SEC
# Define uma senha inicial temporária para o usuário rogerio.
echo "rogerio:Rogerio@123" | sudo chpasswd
sudo passwd -e rogerio

echo "Especificando permissões dos diretórios..."
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Fim."

