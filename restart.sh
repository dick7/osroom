#!/bin/bash

BASE_DIR=/www/wwwroot/blog.ztloadfield.com

#################
# echo "restart mongod"
# killall -9 mongod
# mongod -f /www/server/mongodb/config.conf
##################
echo "restart uwsgi"
# killall -9 uwsgi
ps -ef|grep uwsgi|awk '{print $2}'|xargs kill -9
cd $BASE_DIR
source ../venv/bin/activate
nohup uwsgi uwsgi.ini &
# uwsgi uwsgi.ini
echo "read -t 7"
read -t 7
##########################
echo "reload nginx"
nginx -s reload

