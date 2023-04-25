Vagrant.configure("2") do |config|
  config.vm.box = "server"
  # config.ssh.insert_key = true
  config.ssh.keys_only = true
  config.vm.define "awx" do |awx|
    awx.vm.box = "debian/bullseye64"
    awx.vm.hostname = "dockers-server"
    awx.vm.synced_folder "./docker_resources", "/home/vagrant/resources/docker"
    awx.vm.provision "file", source: "./boot/host_public_key", destination: "/home/vagrant/host_key"
    # awx.vm.network :"public_network"
    awx.vm.network :"private_network" , ip: "100.10.0.10", netmask: "255.255.255.0"
    awx.vm.network "forwarded_port", guest: 80, host: 8008
    awx.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--ioapic", "on"]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--name", "dockers-server"]
      v.customize ["modifyvm", :id, "--memory", 8192]
      v.customize ["modifyvm", :id, "--cpus", 8]
    end
    awx.vm.provision "shell", path: "./boot/setup.sh"
    awx.vm.provision "shell", path: "./boot/get-docker.sh"
    awx.vm.provision "shell", path: "./boot/get-compose.sh", privileged: false
    awx.vm.provision "shell", path: "./boot/start-containers.sh"
  end
end
