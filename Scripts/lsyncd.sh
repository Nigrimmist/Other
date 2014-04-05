sudo apt-get install lsyncd
echo "backup_server_ip "+$backup_server_ip >> /etc/hosts

cp -i root/www/configs/lsyncd.conf.lua /etc/lsyncd/
echo "!!!ENTER PATH : root/www/ssh/id_rsa"
ssh-keygen -t rsa
ssh-copy-id "root@"+$backup_server_ip
echo "!!!PLEASE check ssh connect ssh 'root@'"+$backup_server_ip+"'"