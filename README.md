## Prerequisites

Project must be cloned into DrvFs file system location (on Windows host)

Vagrant 2.3.3 must be installed for Windows

VirtualBox 6.* is need to be installed on Windows host

You must have ssh key in your ~/.ssh/id_ed25519.pub on Windows host

Bridge in Vagrantfile must be set properly

Your host machine must meet minimal system requirements (vCPU and RAM)

It's recommended to download vagrant box "bento/centos-7" before vagrant up (VPN may be required)

       vagrant box add bento/centos-7

You should put file named "pat" to the root of the project to grant access to your repository 

!!! do not run yum update so syncing folder won't be corrupted

vagrant up command must be executed to enroll infrastructure

##
