#!/bin/bash

# Reset username in docker-compose file
sed -i "s|${USER}|SCRIPT_TO_CHANGE_ME|g" srcs/docker-compose.yml

# Reset username in nginx config for the domain "username.42.fr"
sed -i "s|${USER}|SCRIPT_TO_CHANGE_ME|g" srcs/requirements/nginx/conf/nginx.conf

# Reset username for domain in .env file"
sed -i "s|${USER}|SCRIPT_TO_CHANGE_ME|g" srcs/.env