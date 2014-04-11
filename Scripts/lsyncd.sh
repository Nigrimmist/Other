export backup_server_ip="188.226.167.248"

sudo touch /root/www/logs/lsyncd.log /root/www/logs/lsyncd.status
sudo chmod 774 /root/www/logs/lsyncd.log /root/www/logs/lsyncd.status

sudo apt-get install lsyncd
echo "$backup_server_ip backupServer" >> /etc/hosts

cp -f /root/www/configs/lsyncd.conf.lua /etc/lsyncd/
echo "!!!press enter here"
ssh-keygen -t rsa
ssh-copy-id "$backup_server_ip"
echo "!!!PLEASE check ssh connect ssh 'root@$backup_server_ip'"



chmod 775 /etc/init.d/lsyncd
chown root:root /etc/init.d/lsyncd

#sudo /etc/init.d/lsyncd start