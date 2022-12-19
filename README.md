## Prerequisites

* Your host machine must meet minimal system requirements (4 vCPUs and 4096 MiB RAM for Docker Compose Enrollment and 8 vCPUs and 4096 MiB RAM)

* Project must be cloned into DrvFs file system location (not in WSL)

* Vagrant 2.* and VirtualBox 6.* must be installed on host machine

* You must have ssh key in your ~/.ssh/id_ed25519.pub on host machine
 
* Bridge in Vagrantfile must be set properly

* It's recommended to download vagrant box "bento/centos-7" before vagrant up (VPN may be required)

       vagrant box add bento/centos-7 

!!! Do not run yum update so syncing folder won't be corrupted

* Repository https://github.com/kodzimo/getting-started.git must be forked into your own repo and cloned locally to have ability to make changes to it.

* "vagrant up" command must be executed to enroll infrastructure

## Using Docker Compose

* Field under the "Config for Docker Compose" line must be uncommented in Vagrantfile

* If you use some image that recuires ghcr.io authentication, you should put file named "pat" to the root of the project to grant access to your repository. Then you you have manually perform authentication:

       echo ""$CR_PAT"" | docker login ghcr.io -u [your-username] --password-stdin

### Eventually

We are having infrustructure like this:
1. Vagrant host with Docker enrolled
2. Docker compose set's up services (containers):
- Jenkins with built-in docker
- Zabbix Server MySQL
- Zabbix Server
- Zabbix Server Web Interface

## Using Kubernetes (kind)

!!! Unfortunately, this option is in development state.

* Field under the "Config for Kubernetes (kind)" line must be uncommented in Vagrantfile
