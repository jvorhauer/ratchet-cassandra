# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# box sizing
VB_MEMORY=1024
VB_CPUS=1

# network setup
NODE_NAME = "cassandra"
DOMAIN_NAME="ratchetcc.local"
NODE_IP = "192.168.42.220"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  # basic ubuntu box
  config.vm.box = "ubuntu/trusty64"
  
  # size of the box
  config.vm.provider :virtualbox do |vb|
    vb.memory = VB_MEMORY
    vb.cpus = VB_CPUS
  end
  
  # setup the network
  config.vm.hostname = "#{NODE_NAME}.#{DOMAIN_NAME}"
  config.vm.network "private_network", ip: NODE_IP
  
  # update the image first
  config.vm.provision "shell", inline: "sudo apt-get -y update && sudo apt-get -y upgrade"
      
  # add basic development tools
  config.vm.provision "shell", inline: "sudo apt-get -y install git-core unzip curl sysstat build-essential"    
  
  # add docker and basic images
  config.vm.provision "docker"
  
  # cleanup
  config.vm.provision "shell", inline: "sudo apt-get clean && sudo apt-get -y autoremove"
  
  # expose the current folder to the guest system
  config.vm.synced_folder ".", "/home/vagrant/app"
  
end
