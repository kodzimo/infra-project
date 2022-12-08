Project must be cloned into DrvFs file system location (on Windows host)
Vagrant 2.3.3 must be installed both for Windows and WSL
VirtualBox 6.* is need to bi installed on Windows host
Variable (VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1") must be exported in WSL - export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
You must have ssh key in your ~/.ssh/id_ed25519.pub in WSL
Bridge in Vagrantfile must be set properly
Your host machine must meet minimal system requirements (vCPU and RAM)
It's recommended to download vagrant box "bento/almalinux-8" before vagrant up (VPN may be required) - vagrant box add bento/almalinux-8
vagrant up command must be executed from Windows
