Vagrant.configure("2") do |config|
    config.vm.provision "file", source: "~/.ssh/id_ed25519.pub", destination: "~/.ssh/id_ed25519.pub"
    config.vm.provision "shell", inline: "cat /home/vagrant/.ssh/id_ed25519.pub >> /home/vagrant/.ssh/authorized_keys" 
    # config.vm.provision "file", source: "~/.ssh/id_ed25519", destination: "~/.ssh/id_ed25519"
    
    config.vm.define "k8s" do |ctrl|
      ctrl.vm.box = "bento/centos-7"
      ctrl.vm.hostname = "k8s"
      ctrl.vm.network "private_network", ip: "192.168.56.2", bridge: "eth0: Wi-Fi"
      # ctrl.vm.network "forwarded_port", guest: 6443, host: 6443
      # ctrl.vm.network "forwarded_port", guest: 32000, host: 32000
      ctrl.vm.provider "virtualbox" do |v|
        v.memory = 4096
        v.cpus = 4
        v.name = "k8s"
      end
      # Basic provisioning
      ctrl.vm.provision "shell", path: "./vagrant-provision.sh"
      # Jenkins enrollinh
      ctrl.vm.provision "shell", path: "./jenkins-install.sh"
    end
end
