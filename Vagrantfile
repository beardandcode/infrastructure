# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

domain_name = 'development.%s' % [IO.read('DOMAIN_NAME').strip!]
hosts = [
  { name: 'development-1', ip: '192.168.100.10', group: 'webservers' }
]

groups = hosts.reduce({}) {|memo, host|
  group = host[:group]

  if !memo.has_key?(group)
    memo[group] = []
  end

  memo[group].push(host[:name])
  memo
}

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  hosts.each do |host|
    config.vm.define host[:name] do |c|
      c.vm.hostname = host[:name]
      c.vm.network :private_network, ip: host[:ip], netmask: '255.255.255.0'

      c.vm.synced_folder "..", "/var/apps"

      c.vm.provision "ansible" do |ansible|
        ansible.playbook = "ansible/site.yml"
        ansible.groups = groups
        ansible.extra_vars = {
          domain_name: domain_name,
        }
      end
    end
  end

end
