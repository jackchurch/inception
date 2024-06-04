#!/bin/bash

# Delete nginx, wordpress and database volume on local machine. 
if [ -d "/home/${USER}/data" ];
then
    sudo rm -rf /home/${USER}/data
fi