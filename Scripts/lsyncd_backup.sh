sudo touch /root/www/logs/lsyncd.log /root/www/logs/lsyncd.status
sudo chmod 774 /root/www/logs/lsyncd.log /root/www/logs/lsyncd.status

sudo apt-get install lsyncd

cp -f /root/www/configs/lsyncd.conf.lua /etc/lsyncd/
chmod 775 /etc/init.d/lsyncd
chown root:root /etc/init.d/lsyncd
