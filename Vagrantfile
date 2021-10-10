# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "kalilinux/rolling"

  config.vm.provider :vmware_desktop do |v|
    v.vmx["memsize"] = "2048"
    v.vmx["numvcpus"] = "2"
  end

  config.vm.synced_folder "etc/salt/minion.d", "/etc/salt/minion.d/"
  config.vm.synced_folder "srv/salt/", "/srv/salt/"

  #config.vm.provision :shell, inline: <<-SCRIPT
  #  sudo DEBIAN_FRONTEND=noninteractive apt-get -y -q update
  #  sudo DEBIAN_FRONTEND=noninteractive apt-get -y -q install lsb-release
  #SCRIPT

  config.vm.provision :salt do |salt|
    salt.bootstrap_script = "kali-salt-bootstrap.sh"
    salt.masterless = true
    salt.minion_config = "etc/salt/kali-minion.conf"
    salt.run_highstate = true
  end

end
