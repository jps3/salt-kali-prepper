# -*- mode: ruby -*-
# vi: set ft=ruby :

# These will need to be gleaned or guessed at from Kali box
DEBIAN_RELEASE  = '11'
DEBIAN_CODENAME = 'bullseye'


Vagrant.configure("2") do |config|

  config.vm.box = "kalilinux/rolling"


  #  ┏━┓┏━┓┏━┓╻ ╻╻╺┳┓┏━╸┏━┓┏━┓
  #  ┣━┛┣┳┛┃ ┃┃┏┛┃ ┃┃┣╸ ┣┳┛┗━┓
  #  ╹  ╹┗╸┗━┛┗┛ ╹╺┻┛┗━╸╹┗╸┗━┛
  config.vm.provider :vmware_desktop do |v|
    v.vmx["memsize"] = "2048"
    v.vmx["numvcpus"] = "2"
  end


  #  ┏━┓╻ ╻┏┓╻┏━╸┏━╸╺┳┓   ┏━╸┏━┓╻  ╺┳┓┏━╸┏━┓┏━┓
  #  ┗━┓┗┳┛┃┗┫┃  ┣╸  ┃┃   ┣╸ ┃ ┃┃   ┃┃┣╸ ┣┳┛┗━┓
  #  ┗━┛ ╹ ╹ ╹┗━╸┗━╸╺┻┛   ╹  ┗━┛┗━╸╺┻┛┗━╸╹┗╸┗━┛

  #config.vm.synced_folder "etc/salt/minion.d", "/etc/salt/minion.d", type: "rsync", owner: "root", group: "root"
  #config.vm.synced_folder "srv/salt", "/srv/salt", type: "rsync", owner: "root", group: "root"
  #config.vm.synced_folder "srv/pillar", "/srv/pillar", type: "rsync", owner: "root", group: "root"
  config.vm.synced_folder "etc/salt/minion.d", "/etc/salt/minion.d", owner: "root", group: "root"
  config.vm.synced_folder "srv/salt", "/srv/salt", owner: "root", group: "root"
  config.vm.synced_folder "srv/pillar", "/srv/pillar", owner: "root", group: "root"


  #  ┏━┓┏━┓┏━┓╻ ╻╻┏━┓╻┏━┓┏┓╻╻┏┓╻┏━╸
  #  ┣━┛┣┳┛┃ ┃┃┏┛┃┗━┓┃┃ ┃┃┗┫┃┃┗┫┃╺┓
  #  ╹  ╹┗╸┗━┛┗┛ ╹┗━┛╹┗━┛╹ ╹╹╹ ╹┗━┛

  config.vm.provision :shell do |s|
    s.name = "Initial preparation and settings"
    s.path = "provisioning/00_initial"
    s.privileged = true
  end

  config.vm.provision :shell do |s|
    s.name = "Preparation for salt provisioning"
    s.env = { :DEBIAN_RELEASE => "#{DEBIAN_RELEASE}", :DEBIAN_CODENAME => "#{DEBIAN_CODENAME}" }
    s.path = "provisioning/10_saltstack_prep"
    s.privileged = true
  end

  config.vm.provision :salt do |salt|
    salt.bootstrap_script = "provisioning/20_saltstack_bootstrap"
    salt.masterless = true
    salt.minion_config = "etc/salt/kali-minion.conf"
    salt.run_highstate = true
  end

  config.vm.provision :shell do |s|
    s.name = "Finalize provisioning"
    s.path = "provisioning/99_finalize"
    s.reboot = true
    s.reset = true
  end


  #  ╺┳╸┏━┓╻┏━╸┏━╸┏━╸┏━┓┏━┓
  #   ┃ ┣┳┛┃┃╺┓┃╺┓┣╸ ┣┳┛┗━┓
  #   ╹ ╹┗╸╹┗━┛┗━┛┗━╸╹┗╸┗━┛
  #config.trigger.after :provision do |t|
  #  t.info = "Provisioning completed"
  #  t.run = { inline: "/usr/bin/say -v Tessa 'Check that the guest box has rebooted.'"}
  #end

end
