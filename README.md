# vagrant-docker-environment

This project aims to help Python developers test their data-base dependant applications, specially APIs, using Vagrant and Docker, avoiding Docker-desktop and WSL in a Wintel business environment.
The repository includes a few Powershell scripts to install all the programs it needs to work, but if these are installed in Linux, it should work too.

---

## Technologies used in this project

- Powershell

- Bash

- Chocolatey: a package manager for Windows

- Vagrant:  an open source tool to create and manage virtual development environments using hyper-visors like VirtualBox, VMware or Hyper-V.

- Virtualbox: the most suitable hyper-visor for Vagrant.

- Git: essential control version tool.

- Python.

- Pip: libraries manager for Python.

- Insomnia API Rest Tester

- Visual Studio Code: one of the most used and easy IDEs.

  The following VSCode extensions:

  - Vagrant extension

  - Vagranfile support

  - Pylance

  - Rainbow indent

- PuTTY & PuTTYgen: ssh client and ssh key-pairs generator.

- Docker & Docker-compose

---

## How to use it

If you are in a fresh new Windows machine, execute the following command as administrator in Windows Powershell (5.1, the preinstalled version; or 7):

```powershell
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
```

This command will let you execute not signed scripts, allowing programs and dependencies installation.

To proceed, execute the scripts in the `Windows` folder in this order:

1. `initial-setup.ps1`

2. `install-pip.ps1`

3. `install-vs-code-extensions.ps1`

4. `remove-openssh-client.bat`: execute this script in CMD as admin if you want to remove the default Windows OpenSSH client that makes conflict with Vagrant. If you want to keep it, you will need to generate a ssh key-pair using PuTTY to connect to the Vagrant VM; this will be useful for FTP too if you want to use WinSCP.

You will need to uncomment lines in the Vagrantfile to copy the SSH keys. The port mapping for ssh in your `localhost` is the `2222`.

Once everything needed is installed, you can proceed with the VM creation.

---

From the "Terminal" app, Powershell or the integrated terminal in VSCode, go to the `Development` folder and execute the command `vagrant up --provision` to download the Vagrant Box and start the provisioning; you can edit the VM resources making changes in the Vagrantfile, but that will be explained later.

Once the VM has booted up and is ready for ssh, execute the command `vagrant ssh` in the same directory as the Vagrantfile to acces the VM. Being a Debian 11 Vagrant box, the default user is `vagrant`, and in case you need the password, is `vagrant` too; but don't worry about it, the default user has `sudo` permissions without password.

You are free to use the VM to whatever you want, but the tools are in the `app` folder in the user's `home` directory. Inside it there are 2 folders and 3 `bash` scripts to make an easy deployment of your FastAPI App.

- The `deploy` folder: inside of it there is a docker-compose file to boot up some services as database servers and web clients, and a `dummy-data` folder I included for the sample FastAPI App I made. You are free to use your own `.sql` or `.js` scripts for the databases and modify the `docker-compose.yml`. *I am not responsible if you break something in the process.*

- The `source` folder: essentially your app directory. Here there are a sub-directory, a `Dockerfile` and a `requirements.txt` file.
  In the `code` directory add your App files. Remember to set the main file to execute the API as `main.py` to make it work.
  Add to `requirements.txt` all the libraries your app needs to work.
  If you need it, modify the `Dockerfile`.
  And once again, *I am not responsible if you break something in the process.*

- The `build.sh` script: execute this script to easly build a Docker image of your app. You can build it using commands, but if you don't know how to use Docker, I recommend you to use the script.

- The `start.sh` script: execute this script to boot up your app with the needed database *(MySQL, PostgreSQL or MongoDB)* and the respective web client. If you don't want to use it, modify the `docker-compose.yml` to use your app image in the `app` service. The command you will need to use is: `docker-compose up -d app [database-service]`.

- The `stop.sh` script: execute this script to stop all the running containers. You can remove them too.

### Web access

Once all the containers are running, you can access the API documentation on `localhost:3000/docs`, the MySQL and PostgreSQL web client on `localhost:8978` and the MongoDB web client on `localhost:8081`.

The configuration to connect to the databases is pretty easy and straight forward.

### Other useful `docker` commands are:

- `docker ps [-a]`: show all running containers, and with the `-a` parameter, show the stopped ones too.

- `docker logs [container-id]`: show the container's log messages.

- `docker exec -it [container-id] /bin/bash`: acces the container.

---

### Vagrantfile modifications

- Line 6 *(`host.vm.hostname = "dockers-server"`)*: change the hostname of the vm. Change it to whatever you want.

- Lines 13 & 14 *(`host.vm.provision "file", source:[...], destination: [...]`)*: in this case, to copy the public keys you have previously generated with PuTTY. Read the `README.md` in the `Development/ssh_access` to know more about it.

- Lines 21, 22 & 23 *(`host.vm.network "forwarded_port"`)*: port mapping for the database servers. Uncomment the lines depending on the database you want to acces from outside the VM, like using MySQL Workbench or pgAdmin.

- Line 28 *(`"modifyvm", :id, "--name", "dockers-server"`)*: set a name for the VM in Virtualbox.

- Line 29 *(`"modifyvm", :id, "--memory", 6144`)*: define the amount of RAM memory for the VM in MB. The box's default is 4 GB, and 6 in the Vagranfile. You can change it to whatever you want, depending on your host machine hardware.

- Line 30 *(`"modifyvm", :id, "--cpus", 6`)*: define the number of CPU cores for the VM. The box's default is 4 cores, and 6 in the Vagrantfile. You can change it to whatever you want

- Line 34 *(`host.vm.provision "shell"`)*: a script to copy the ssh publi keys. Uncomment this line if you uncommented the lines 13 & 14.

---

## Troubleshooting

Despite this project is fully functional, there are problems I couldn't solve myself and depends on the final user.

The first one is the download time of the docker images: I recommend you to have almost a Giga-bit Internet speed to avoid image-building times of 10 minutes or more.

Also, be careful if you edit the bash scripts from VScode because you can encounter this error:

```bash
/bin/bash^M: bad interpreter: No such file or directory
```

The cause of it is Windows; by default, the `ENTER` key introduces a `carriage return` (`\r`) instead of a `newline` (`\n`), so it makes the bash interpreter to fail or crash. To fix this, in VScode, change the `End of Line Sequence` from `CRLF` to `LF` *(You can change it at the bottom of the IDE, next to the programming language VScode detects)*.
