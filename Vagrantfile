# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "kalilinux/rolling"

  config.vm.provider :vmware_desktop do |v|
    v.vmx["memsize"] = "2048"
    v.vmx["numvcpus"] = "2"
  end

  config.vm.synced_folder "etc/salt/minion.d", "/etc/salt/minion.d"
  config.vm.synced_folder "srv/salt", "/srv/salt"
  config.vm.synced_folder "srv/pillar", "/srv/pillar"

  config.vm.provision :shell, inline: <<-SCRIPT
    # Add SaltStack Repo (see https://repo.saltproject.io/#debian)
    DEBIAN_RELEASE="11"
    DEBIAN_CODENAME="bullseye"
    # Download GPG key
    curl -fsSL -o /usr/share/keyrings/salt-archive-keyring.gpg "https://repo.saltproject.io/py3/debian/${DEBIAN_RELEASE}/amd64/latest/salt-archive-keyring.gpg"
    # Create apt .list file
    echo "deb [signed-by=/usr/share/keyrings/salt-archive-keyring.gpg arch=amd64] https://repo.saltproject.io/py3/debian/${DEBIAN_RELEASE}/amd64/latest ${DEBIAN_CODENAME} main" | sudo tee /etc/apt/sources.list.d/salt.list
    # Disable unneded services
    systemctl disable apt-daily.service
    systemctl disable apt-daily.timer
    # Update repos
    DEBIAN_FRONTEND=noninteractive apt-get -y -q update
    # Install required supporting package for salt-minion
    DEBIAN_FRONTEND=noninteractive apt-get -y -q install lsb-release
  SCRIPT

  config.vm.provision :salt do |salt|
    salt.bootstrap_script = "kali-salt-bootstrap.sh"
    salt.masterless = true
    salt.minion_config = "etc/salt/kali-minion.conf"
    salt.run_highstate = true
  end

  config.trigger.after [:provision] do |t|
    t.name = "Reboot after provisioning"
    t.run = { :inline => "vagrant reload" }
  end

end
