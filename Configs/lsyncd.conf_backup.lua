settings = {
  logfile    = "/www/logs/lsyncd.log", 
  statusFile = "/www/logs/lsyncd.status", 
  nodaemon   = false 
} 

sync {
    default.direct,
    source="/www/gifs/synced", 
    target="/www/gifs/all", 
    delete=false 	
}