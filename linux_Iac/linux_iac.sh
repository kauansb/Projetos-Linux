#/bin/bash

echo "Criando diretórios..."

mkdir /publico
mkdir /adm  #administração
mkdir /ven  #vendas
mkdir /sec  #secretaria

echo "Criando grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários..."

 #adicionando usuários aos grupos,aplicando o bash padrão e atribuindo senhas
 
useradd carlos -m -s /bin/bash -p $(openss1 passwd -crypt Senha123) -G GRP_ADM 
useradd maria -m -s /bin/bash -p $(openss1 passwd -crypt Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openss1 passwd -crypt Senha123) -G GRP_ADM

useradd debora -m -s /bin/bash -p $(openss1 passwd -crypt Senha123) -G GRP_VEN
useradd sebastian -m -s /bin/bash -p $(openss1 passwd -crypt Senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openss1 passwd -crypt Senha123) -G GRP_VEN

useradd josefina -m -s /bin/bash -p $(openss1 passwd -crypt Senha123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openss1 passwd -crypt Senha123) -G GRP_SEC
useradd rogério -m -s /bin/bash -p $(openss1 passwd -crypt Senha123) -G GRP_SEC


echo "Especificando permissões dos diretórios..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec                         
                                  # Permissões de root,grupo e demais usuários respectivamente
chmod 770 /adm                    # "7": Permissão total sobre o diretório,
chmod 770 /ven                    # "0": Nenhuma permissão
chmod 770 /sec
chmod 777 /publico

echo "Finalizado."
