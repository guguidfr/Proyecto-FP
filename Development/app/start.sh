#!/bin/bash

# Cargar las variables de entorno
if [ -f .env ]
then
    source .env
else
    exit 1
fi

read -p "Introduce the database server you want to use [1.mysql/2.mongodb/3.postgresql]: " db_type

if [ $db_type == "1" ]
then
    # cd deploy
    # docker-compose up -d app mysql
    db_service="mysql"
elif [ $db_type == "2" ]
then
    # cd deploy
    # docker-compose up -d app mongo
    db_service="mongo"
elif [ $db_type == "3" ]
then
    # cd deploy
    # docker-compose up -d app postgres
    db_service="postgres"
else
    echo "Invalid input"
    exit 1
fi

echo "These are the locally available images:"
docker images

read -p "Insert the name of the image you want to use: " app_image_name_input
read -p "Insert the tag of the image yoy want to use: " app_image_tag_input
docker inspect $image_name:$image_tag > /dev/null 2>&1
if [ $? -ne 0 ]
then

    echo "That's an invalid image"
    exit 1

else

    app_image_name=${app_image_name_input:-$APP_IMAGE_NAME}
    app_image_tag=${app_image_tag_input:-$APP_IMAGE_TAG}

    echo "APP_IMAGE_NAME=$app_image_name" > .env
    echo "APP_IMAGE_TAG=$app_image_tag" >> .env

    cd deploy

    sed -i "s#image: $APP_IMAGE_NAME:$APP_IMAGE_TAG#image: $app_image_name:$app_image_tag#" docker-compose.yml


docker ps
exit 0
