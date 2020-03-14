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
VENV_DIR=/www/wwwroot/ztloadfield.com/dev/venv
source $VENV_DIR/bin/activate
pip install -Ur osroom/requirements.txt
# pip install uwsgi
# pip install pyyaml
# pip freeze > osroom/requirements.txt
# echo "read -t 5"
# read -t 5
#########################
killall -9 uwsgi
# ps -ef|grep uwsgi|awk '{print $2}'|xargs kill -9
cd $BASE_DIR
$VENV_DIR/bin/uwsgi uwsgi.ini
# echo "read -t 5"
# read -t 5
##########################
echo "reload nginx"
nginx -s reload


