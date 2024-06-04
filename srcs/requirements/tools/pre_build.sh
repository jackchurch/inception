#!/bin/bash

# make database folder if it doens't exist
if [ ! -d "/home/${USER}/data/database" ];
then
    mkdir -p /home/${USER}/data/database
fi

# make web folder if it doens't exist
if [ ! -d "/home/${USER}/data/web" ];
then
    mkdir -p /home/${USER}/data/web
fi

# Update username in docker-compose file
sed -i "s|SCRIPT_TO_CHANGE_ME|${USER}|g" srcs/docker-compose.yml

# Update username in nginx config for the domain "username.42.fr"
sed -i "s|SCRIPT_TO_CHANGE_ME|${USER}|g" srcs/requirements/nginx/conf/nginx.conf
