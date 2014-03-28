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
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "vmware_precise_64"
  config.vm.synced_folder "../ttt/coffee_ttt/", "/home/coffee_ttt", create: true
  config.vm.network :forwarded_port, guest: 80, host: 8888

  # config.vm.box_url = "http://domain.com/path/to/above.box"
  # config.ssh.username = "my_vm"
  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory',          options[:ram] * 1024]
    vb.customize ['modifyvm', :id, '--cpuexecutioncap', options[:cpu_cap]]
    vb.customize ['modifyvm', :id, '--cpus',            options[:cores]]
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path  = ['cookbooks', 'custom_cookbooks']
    chef.log_level       = :info

    chef.add_recipe 'pre_run'
    chef.add_recipe 'dotfiles'
    # chef.cookbooks_path = "../my-recipes/cookbooks"
    # chef.roles_path = "../my-recipes/roles"
    # chef.data_bags_path = "../my-recipes/data_bags"
    # chef.add_recipe "mysql"
    # chef.add_role "web"

    # You may also specify custom JSON attributes:
    # chef.json = { :mysql_password => "foo" }
  end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision :chef_client do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
end
