#!/bin/bash

#Updating OS
sudo apt update && sudo apt upgrade -y

#ENVIRONMENT
DATASOURCE_USERNAME=eschool
DATASOURCE_PASSWORD=b1dnijpesvseshesre
MYSQL_ROOT_PASSWORD=legme876FCTFEfg1

#Forming env file for mysql instance
echo "MYSQL_USER=${DATASOURCE_USERNAME}" > env
echo "MYSQL_PASSWORD=${DATASOURCE_PASSWORD}" >> env
echo "MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}" >> env
echo "MYSQL_DATABASE=eschool" >> env

sudo apt install docker.io -y

#Starting mysql server in docker container
sudo docker run --restart=always --env-file ./env --name mysql -p 3306:3306 -v /home/ubuntu/mysql:/var/lib/mysql -d mysql:5.7 --innodb_use_native_aio=0 --character-set-server=utf8 --collation-server=utf8_unicode_ci 