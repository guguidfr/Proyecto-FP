#!/bin/bash
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Navegar al directorio del Dockerfile
cd "$script_dir/source"

# Solicitar al usuario que ingrese el nombre de la imagen
read -p "Enter the image name: " image_name

# Solicitar al usuario que ingrese el tag de versión
read -p "Enter the image tag: " version_tag

# Construir la imagen de Docker
docker build -t "$image_name:$version_tag" .

# Mostrar mensaje de éxito
echo "Docker image created: $image_name:$version_tag"
