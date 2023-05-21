#/bin/bash
mkdir -p /docker_volumes/prometheus/main
mkdir -p /docker_volumes/prometheus/prometheus-data
mv /home/vagrant/prometheus.yml /docker_volumes/prometheus/prometheus-data/prometheus.yml
