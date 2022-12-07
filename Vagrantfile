Vagrant.configure("2") do |config|
    config.vm.provision "file", source: "~/.ssh/id_ed25519.pub", destination: "~/.ssh/id_ed25519.pub"
    config.vm.provision "shell", inline: "cat /home/vagrant/.ssh/id_ed25519.pub >> /home/vagrant/.ssh/authorized_keys" 
    
    config.vm.define "k8s-control" do |ctrl|
    #   serv.vm.synced_folder "C:/tms/lesson4/share-serv", "/home/vagrant/share"
      ctrl.vm.box = "bento/almalinux-8"
      ctrl.vm.hostname = "k8s-control"
      ctrl.vm.network "private_network", ip: "10.25.111.2", bridge: "en0: Wi-Fi"
    #   serv.vm.provision "shell", path: "/tms/lesson4/share-serv/ntp_sis.sh"
      ctrl.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 4
        v.name = "k8s-control"
      end
    end
  
    # config.vm.define "service-node" do |svc|
    #   svc.vm.box = "bento/centos-stream-8"
    #   svc.vm.hostname = "k8s-service"
    #   svc.vm.network "private_network", ip: "10.25.111.3", bridge: "en0: Wi-Fi"
    # #   svc.vm.provision "shell", path: "/tms/lesson4/share-cli/ntp_cis.sh"
    #   svc.vm.provider "virtualbox" do |v|
    #     v.memory = 128
    #     v.cpus = 1
    #     v.name = "k8s-service"
    #   end
    # end

    # config.vm.define "k8s-dev" do |dev|
    #   dev.vm.box = "bento/centos-stream-8"
    #   dev.vm.hostname = "k8s-service"
    #   dev.vm.network "private_network", ip: "10.25.111.4", bridge: "en0: Wi-Fi"
    # #   svc.vm.provision "shell", path: "/tms/lesson4/share-cli/ntp_cis.sh"
    #   dev.vm.provider "virtualbox" do |v|
    #     v.memory = 128
    #     v.cpus = 1
    #     v.name = "k8s-service"
    #   end
    # end

    # config.vm.define "k8s-prod" do |prod|
    #   prod.vm.box = "bento/centos-stream-8"
    #   prod.vm.hostname = "k8s-service"
    #   prod.vm.network "private_network", ip: "10.25.111.5", bridge: "en0: Wi-Fi"
    # #   svc.vm.provision "shell", path: "/tms/lesson4/share-cli/ntp_cis.sh"
    #   prod.vm.provider "virtualbox" do |v|
    #     v.memory = 128
    #     v.cpus = 1
    #     v.name = "k8s-service"
    #   end
    # end
end