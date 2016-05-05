# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

#config.vm.provision "shell", inline: "echo Apache_server_install && yum update -y && yum install -y httpd && chkconfig httpd on && /etc/init.d/httpd start"

$script = <<SCRIPT
echo Provisioning...
echo "192.168.33.70    puppet-server" >> /etc/hosts
timedatectl set-timezone Europe/Minsk
SCRIPT

config.vm.provision "shell", inline:$script  # provisioning

#config.vm.provision "ansible" do |ansible|
 #   ansible.playbook = 'provisionz.yml'
  #  ansible.verbose = 'vv'
 # end

config.vm.define :puppetnode01 do |puppetnode01|
    puppetnode01.vm.box = "centos/7"
    puppetnode01.vm.hostname = "pnode01"
    puppetnode01.vm.network "private_network", ip: "192.168.33.71"
    #puppetnode01.vm.network "forwarded_port", guest: 80, host: 8181
    #puppetnode01.vm.synced_folder ".", "/vagrant", disabled: true
    #puppetnode01.vm.synced_folder "/root/vagrant/share2", "/vagrant-vm-share", owner: "root", group: "root"
    	puppetnode01.vm.provider "virtualbox" do |pnvb1|
		pnvb1.name = "pnode01"
		pnvb1.customize ["modifyvm", :id, "--memory", 2048]
		pnvb1.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        end
   end
end
