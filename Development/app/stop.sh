#!/bin/bash

read -p "Do you want to stop all running containers?[Y/N]: " option
if [ $option == "Y" || $option == "y" ]
then

    echo "Stopping all containers..."
    docker stop $(docker ps -q)

    read -p "Do you want to remove all containers?[Y/N]: " selection
    if [ $selection == "Y" || $selection == "y" ]
    then
        docker rm $(docker ps -aq)
    elif [ $selection == "N" || $selection == "n" ]
    then
        echo "..."
    fi

elif [ $option == "N" || $option == "N" ]
then
    echo "..."
else
    echo "Invalid option"
    exit 1
