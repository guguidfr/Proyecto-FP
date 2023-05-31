#!/bin/bash

CONFIG_FILE="/etc/docker/daemon.json"
DATA_ROOT="/var/lib/docker"
QUOTA_SIZE="20G"

# Detener el daemon de Docker
sudo systemctl stop docker

# Crear el contenido del archivo daemon.json
config='{
    "data-root": "'$DATA_ROOT'",
    "storage-driver": "overlay2",
    "storage-opts": [
        "overlay2.override_kernel_check=true"
    ],
    "max-concurrent-downloads": 10,
    "max-concurrent-uploads": 10,
    "default-ulimits": {
        "nofile": {
        "Name": "nofile",
        "Hard": 65536,
        "Soft": 65536
        }
    },
    "storage": {
        "driver": "overlay2",
        "diff_quota": "'$QUOTA_SIZE'"
    }
}'

# Crear o sobrescribir el archivo daemon.json
echo "$config" | sudo tee "$CONFIG_FILE"

# Iniciar el daemon de Docker
sudo systemctl start docker
