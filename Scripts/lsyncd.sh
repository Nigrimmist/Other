
sudo apt-get install lsyncd
echo "backupServer $backup_server_ip" >> /etc/hosts

cp -i root/www/configs/lsyncd.conf.lua /etc/lsyncd/
cp -i root/www/configs/lsyncd.conf /etc/init/
echo "!!!press enter here"
ssh-keygen -t rsa
ssh-copy-id "root@$backup_server_ip"
echo "!!!PLEASE check ssh connect ssh 'root@$backup_server_ip'"

ln -s /lib/init/upstart-job /etc/init.d/lsyncd

chmod 775 /etc/init.d/lsyncd
chown root:root /etc/init.d/lsyncd
service lsyncd start