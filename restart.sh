#!/bin/bash

#########################
echo "restart mongod"
killall -9 mongod
# a.without configuration ,NOT RECOMMENTED
# nohup mongod &
# b.with conf
mongod -f /www/server/mongodb/config.conf
# echo "read -t 5"
# read -t 5
#########################
BASE_DIR=/www/wwwroot/ztloadfield.com/dev
cd $BASE_DIR
if [ ! -d venv ];then
    virtualenv -p ~/anaconda3/bin/python venv
fi
source venv/bin/activate
pip install -Ur requirements.txt
# pip install uwsgi
# pip install pyyaml
# pip freeze > requirements.txt
# echo "read -t 5"
# read -t 5
#########################
killall -9 uwsgi
# ps -ef|grep uwsgi|awk '{print $2}'|xargs kill -9
uwsgi uwsgi.ini
# echo "read -t 5"
# read -t 5
##########################
echo "reload nginx"
nginx -s reload


