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
# As senhas abaixo são exemplos utilizados somente neste exercício.
# passwd -e obriga o usuário a trocar a senha no primeiro login.

# Cria o usuário carlos no grupo de administração.
useradd carlos -m -s /bin/bash -G GRP_ADM
# Define uma senha temporária de exemplo.
echo "carlos:Carlos123" | chpasswd
# Obriga carlos a trocar a senha no primeiro acesso.
passwd -e carlos

# Cria a usuária maria no grupo de administração.
useradd maria -m -s /bin/bash -G GRP_ADM
# Define uma senha temporária de exemplo.
echo "maria:Maria123" | chpasswd
# Obriga maria a trocar a senha no primeiro acesso.
passwd -e maria

# Cria o usuário joao no grupo de administração.
useradd joao -m -s /bin/bash -G GRP_ADM
# Define uma senha temporária de exemplo.
echo "joao:Joao123" | chpasswd
# Obriga joao a trocar a senha no primeiro acesso.
passwd -e joao

# Cria a usuária debora no grupo de vendas.
useradd debora -m -s /bin/bash -G GRP_VEN
# Define uma senha temporária de exemplo.
echo "debora:Debora123" | chpasswd
# Obriga debora a trocar a senha no primeiro acesso.
passwd -e debora

# Cria a usuária sebastiana no grupo de vendas.
useradd sebastiana -m -s /bin/bash -G GRP_VEN
# Define uma senha temporária de exemplo.
echo "sebastiana:Sebastiana123" | chpasswd
# Obriga sebastiana a trocar a senha no primeiro acesso.
passwd -e sebastiana

# Cria o usuário roberto no grupo de vendas.
useradd roberto -m -s /bin/bash -G GRP_VEN
# Define uma senha temporária de exemplo.
echo "roberto:Roberto123" | chpasswd
# Obriga roberto a trocar a senha no primeiro acesso.
passwd -e roberto

# Cria a usuária josefina no grupo de secretaria.
useradd josefina -m -s /bin/bash -G GRP_SEC
# Define uma senha temporária de exemplo.
echo "josefina:Josefina123" | chpasswd
# Obriga josefina a trocar a senha no primeiro acesso.
passwd -e josefina

# Cria a usuária amanda no grupo de secretaria.
useradd amanda -m -s /bin/bash -G GRP_SEC
# Define uma senha temporária de exemplo.
echo "amanda:Amanda123" | chpasswd
# Obriga amanda a trocar a senha no primeiro acesso.
passwd -e amanda

# Cria o usuário rogerio no grupo de secretaria.
useradd rogerio -m -s /bin/bash -G GRP_SEC
# Define uma senha temporária de exemplo.
echo "rogerio:Rogerio123" | chpasswd
# Obriga rogerio a trocar a senha no primeiro acesso.
passwd -e rogerio

echo "Especificando permissões dos diretórios..."
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Fim."
