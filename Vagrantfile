Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox"
  config.vm.box = "server"
  config.ssh.keys_only = true
  config.vm.define "awx" do |awx|
    awx.vm.box = "debian/bullseye64"
    awx.vm.hostname = "dockers-server"
    awx.vm.synced_folder "./docker_resources", "/containers"
    # awx.vm.synced_folder "./volumes", "/docker_volumes"
    awx.vm.provision "file", source: "./ssh_access/user_ssh_access.pub", destination: "/home/vagrant/ssh_access/user_key"
    awx.vm.provision "file", source: "./ssh_access/root_ssh_access.pub", destination: "/home/vagrant/ssh_access/root_key"
    # awx.vm.provision "shell", inline: "mkdir -p /docker_volumes/prometheus/main", privileged: true
    awx.vm.provision "file", source: "./docker_resources/prometheus.yml", destination: "/home/vagrant/prometheus.yml"
    # awx.vm.provision "file", source: "./docker_resources/mongodb.conf", destination: "/docker_volumes/prometheus/main/prometheus.yml"
    # awx.vm.network :"public_network"
    awx.vm.network :"private_network" , ip: "100.10.0.10", netmask: "255.255.255.0"
    awx.vm.network "forwarded_port", guest: 80, host: 8008
    awx.vm.network "forwarded_port", guest: 27017, host: 27017
    awx.vm.network "forwarded_port", guest: 5432, host: 5432
    awx.vm.network "forwarded_port", guest: 9090, host: 9090
    awx.vm.network "forwarded_port", guest: 3000, host: 3000
    awx.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--ioapic", "on"]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--name", "dockers-server"]
      v.customize ["modifyvm", :id, "--memory", 4096]
      v.customize ["modifyvm", :id, "--cpus", 4]
    end
    awx.vm.provision "shell", path: "./boot/setup.sh"
    awx.vm.provision "shell", path: "./boot/get-docker.sh"
    awx.vm.provision "shell", path: "./boot/get-compose.sh", privileged: false
    awx.vm.provision "shell", path: "./boot/prometheus-config.sh"
    awx.vm.provision "shell", path: "./boot/start-containers.sh"
  end
end
