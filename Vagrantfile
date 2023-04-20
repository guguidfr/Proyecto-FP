Vagrant.configure("2") do |config|
  config.vm.provider :virtualbox do |vb|
    vb.memory = 8192
    vb.cpus = 8
  end
  config.vm.box = "server"
  config.disksize.size = "15GB"
  config.vm.define "server" do |server|
    server.vm.box = "debian/bullseye64"
    server.vm.hostname = "dockers-server"
    server.vm.synced_folder "./docker-resources", "/home/vagrant/docker-resources"
    # server.vm.network :"public_network", ip: "192.168.3.150", netmask: "255.255.255.0"
    # server.vm.network :"public_network", ip: "172.26.26.105", netmask: "255.255.0.0"
    # server.vm.network :"public_network"
    server.vm.network :"private_network" , ip: "100.10.0.1", netmask: "255.255.255.0"
    server.vm.network "forwarded_port", guest: 80, host: 80
    server.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--ioapic", "on"]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--name", "dockers-server"]
      v.customize ["modifyvm", :id, "--memory", 8192]
      v.customize ["modifyvm", :id, "--cpus", 8]
    end
    server.vm.provision "shell", path: "./setup.sh"
    server.vm.provision "shell", path: "./get-docker.sh"
    server.vm.provision "shell", path: "./get-compose.sh", privileged: false
    $docker = <<-DOCKER
    docker-compose -f /home/vagrant/docker-resources/docker-compose.yml
    DOCKER
    server.vm.provision "shell", inline: $docker
  end
  
end