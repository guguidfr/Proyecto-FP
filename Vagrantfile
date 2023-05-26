Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox"
  config.vm.box = "server"
  config.ssh.keys_only = true
  config.vm.define "host" do |host|
    host.vm.box = "debian/bullseye64"
    host.vm.hostname = "dockers-server"
    host.vm.synced_folder "./docker_resources", "/containers"
    host.vm.synced_folder "./templates", "/templates"
    host.vm.provision "file", source: "./ssh_access/user_ssh_access.pub", destination: "/home/vagrant/ssh_access/user_key"
    host.vm.provision "file", source: "./ssh_access/root_ssh_access.pub", destination: "/home/vagrant/ssh_access/root_key"
    # host.vm.provision "shell", inline: "mkdir -p /docker_volumes/prometheus/main", privileged: true
    # host.vm.provision "file", source: "./docker_resources/prometheus.yml", destination: "/home/vagrant/prometheus.yml"
    # host.vm.network :"private_network" , ip: "100.10.0.10", netmask: "255.255.255.0"
    # host.vm.network "forwarded_port", guest: 80, host: 8008
    # host.vm.network "forwarded_port", guest: 27017, host: 27017
    # host.vm.network "forwarded_port", guest: 5432, host: 5432
    # host.vm.network "forwarded_port", guest: 9090, host: 9090
    # host.vm.network "forwarded_port", guest: 3000, host: 3000
    host.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--ioapic", "on"]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--name", "dockers-server"]
      v.customize ["modifyvm", :id, "--memory", 4096]
      v.customize ["modifyvm", :id, "--cpus", 4]
    end
    host.vm.provision "shell", path: "./boot/setup.sh"
    host.vm.provision "shell", path: "./boot/get-docker.sh"
    host.vm.provision "shell", path: "./boot/get-compose.sh", privileged: false
    #host.vm.provision "shell", path: "./boot/prometheus-config.sh"
    # host.vm.provision "shell", path: "./boot/start-containers.sh"
  end
end
