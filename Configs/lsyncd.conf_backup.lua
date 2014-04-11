settings = {
  logfile    = "/root/www/logs/lsyncd.log", 
  statusFile = "/root/www/logs/lsyncd.status", 
  nodaemon   = false 
} 

sync {
    default.direct,
    source="/root/www/gifs/synced", 
    target="/root/www/gifs/all", 
    delete=false 	
}