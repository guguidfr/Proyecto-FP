Vagrant.configure("2") do |config|
  config.vm.provider :virtualbox do |vb|
    vb.memory = 8192
    vb.cpus = 8
  end
  config.vm.box = "server"
  # config.ssh.config = "./rsc/ssh_config_file"
  # config.disksize.size = "15GB"
  config.ssh.insert_key = true
  config.ssh.keys_only = true
  config.vm.define "server" do |server|
    # server.vm.box = "debian/bullseye64"
    server.vm.box = "generic/ubuntu2204"
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
    server.vm.provision "shell", path: "./rsc/setup.sh"
    # server.vm.provision "shell", path: "./rsc/get-docker.sh"
    # server.vm.provision "shell", path: "./rsc/get-compose.sh", privileged: false
    # $docker = <<-DOCKER
    # cd /home/vagrant/docker-resources
    # docker pull ngnix
    # docker-compose up -d
    # DOCKER
    # server.vm.provision "shell", inline: $docker, privileged: true
    # server.vm.provision "shell", inline: "echo ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCbC+YKVaOQpwMV/lRDFIsklFjoLuhjnQBChRdlC9BTWqz7lpJuL7xfV+REl3Ad0TV5SAII6+ijEufXOW2Q/eaoPjQ3sh8o7Rw0vTUXrCyVH44RaufOEDDPUxph77tYfmRwG2y8KXxIwMIw/MM5NX/vFkrVmUDZBKdpxUgVK30ySVvRJ9PQBMbxb3RE1N9JmyMWJHZdsuGRPxoOdl9kr8lnGx+Ta9xHTLtyj1E0TTmMDz8fyqf5kzNyjY0ZAN5Rsrnn7WvQLOhAi+BiOWr0GNppjiySaNMY/1/ANlqdH4OmfPkL8tktPeCJ/FYaty+BRzOSlT4rPaF163B+ZLvCV7DHg4Qur90ThptWuIIkN45XIRB3RvNPnHLTzGi2sVDJfc74iiUZjxKx7/b7pUaFoxlyejfd2GhGGa2KDqGfKt2hH0F8NWEVhcBOhWu/WZOX284IQbbio4DyecLaroI6lOSotqmFZSyuUgtOmKr6Z2R9bSc39E0km6laRLSar5dOn/k >> /home/vagrant/.ssh/authorized_keys"
  end
  
end