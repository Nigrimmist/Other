wget -O /www/configs/nginx.conf "https://raw.githubusercontent.com/Nigrimmist/Other/master/Configs/nginx.conf"
wget -O /www/scripts/ssga.lua "https://raw.githubusercontent.com/Nigrimmist/Other/master/Scripts/ssga.lua"

sudo apt-get -y install nginx

wget -O /www/temp/LuaJIT-2.0.1.tar.gz "http://luajit.org/download/LuaJIT-2.0.1.tar.gz"
cd /www/temp && tar -xzvf /www/temp/LuaJIT-2.0.1.tar.gz


sudo apt-get -y install gcc
cd /www/temp/LuaJIT-2.0.1 && sudo make
cd /www/temp/LuaJIT-2.0.1 && sudo make install


wget -O /www/temp/v0.2.19.tar.gz "https://github.com/simpl/ngx_devel_kit/archive/v0.2.19.tar.gz"
cd /www/temp && tar -xzvf /www/temp/v0.2.19.tar.gz


wget -O /www/temp/v0.9.5.tar.gz "https://github.com/chaoslawful/lua-nginx-module/archive/v0.9.5.tar.gz"
cd /www/temp && tar -xzvf v0.9.5.tar.gz


wget -O /www/temp/nginx-1.4.6.tar.gz "http://nginx.org/download/nginx-1.4.6.tar.gz"
cd /www/temp && tar -xzvf nginx-1.4.6.tar.gz



sudo apt-get -y download libc-bin
dpkg -x libc-bin*.deb /www/temp/unpackdir/
sudo cp /www/temp/unpackdir/sbin/ldconfig /sbin/
sudo apt-get -y install --reinstall libc-bin
sudo apt-get install -f
sudo cp /www/temp/unpackdir/sbin/ldconfig /root/

#копируем ldconfig (и .real) в root. если ошибка в  след строке, То и в /www/temp
sudo apt-get -y install libpcre3 libpcre3-dev
sudo apt-get -y install libssl-dev
export LUAJIT_LIB=/usr/local/lib
export LUAJIT_INC=/usr/local/include/luajit-2.0

cd /www/temp/nginx-1.4.6 && ./configure --prefix=/etc/nginx --with-http_stub_status_module --add-module=/www/temp/ngx_devel_kit-0.2.19 --add-module=/www/temp/lua-nginx-module-0.9.5
cd /www/temp/nginx-1.4.6 && sudo make
cd /www/temp/nginx-1.4.6 && sudo make install

cp -f /www/configs/nginx.conf /etc/nginx/conf/
cp -f /www/scripts/ssga.lua /etc/nginx/
echo "STOPPING NGINX"
sudo nginx -s stop
echo "Waiting 5s..."
sleep 5
cp /www/temp/nginx-1.4.6/objs/nginx /usr/sbin/
sudo nginx


