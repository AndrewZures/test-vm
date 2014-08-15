# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

options = {
  :ram      => 8,
  :cpu_cap  => 98,
  :cores    => 4
}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "hashicorp/precise64"
  # config.vm.synced_folder "../ttt/coffee_ttt/", "/home/vagrant/src/coffee_ttt", create: true
  config.vm.synced_folder "../ttt/coffee_ttt/", "/home/coffee_ttt", create: true
  config.vm.network :forwarded_port, guest: 80, host: 8888

  config.ssh.username = 'vagrant'
  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory',          options[:ram] * 1024]
    vb.customize ['modifyvm', :id, '--cpuexecutioncap', options[:cpu_cap]]
    vb.customize ['modifyvm', :id, '--cpus',            options[:cores]]
  end

  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path  = ['cookbooks', 'custom_cookbooks']
    chef.log_level       = :info

    chef.add_recipe 'pre_run'
    chef.add_recipe 'dotfiles'
  end

end
