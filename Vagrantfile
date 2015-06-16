# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define :centos66 do |c|
    c.vm.box = "centos6.6"
    c.vm.box_url = 'https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.0.0/centos-6.6-x86_64.box'
    c.vm.network :private_network, ip: '192.168.33.11'
  end

  config.vm.define :ubuntu1404 do |c|
    c.vm.box = "ubuntu1404"
    c.vm.box_url = 'https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box'
    c.vm.network :private_network, ip: '192.168.33.12'
  end
end
