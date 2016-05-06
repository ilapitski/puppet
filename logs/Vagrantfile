# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

#config.vm.provision "shell", inline: "echo Apache_server_install && yum update -y && yum install -y httpd && chkconfig httpd on && /etc/init.d/httpd start"

$script = <<SCRIPT
echo Provisioning...
echo "192.168.33.70    puppet" >> /etc/hosts
rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum install -y puppet
puppet resource service puppet ensure=running enable=true
su root -c "puppet agent -t --debug"
SCRIPT

# su root -c "puppet agent -t --debug"
# puppet agent -t --debug --environment prod | tee -a node04_run.log
# yum remove java-1.6.0-openjdk.x86_64
# yum remove unzip
# sudo su -

config.vm.provision "shell", inline:$script  # provisioning

#config.vm.provision "ansible" do |ansible|
 #   ansible.playbook = 'provisionz.yml'
  #  ansible.verbose = 'vv'
 # end

config.vm.define :vm04 do |vm04|
    vm04.vm.box = "sbeliakou/centos-6.7-x86_64"
    vm04.vm.hostname = "puppet-node04"
    vm04.vm.network "private_network", ip: "192.168.33.74"
    #vm04.vm.network "forwarded_port", guest: 80, host: 8181
    #vm04.vm.synced_folder ".", "/vagrant", disabled: true
    #vm04.vm.synced_folder "/root/vagrant/share2", "/vagrant-vm-share", owner: "root", group: "root"
    	vm04.vm.provider "virtualbox" do |vb04|
		vb04.name = "puppet-node04"
		vb04.customize ["modifyvm", :id, "--memory", 2048]
		vb04.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        end
   end
end
