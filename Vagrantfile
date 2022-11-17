# -*- mode: ruby -*-
# vi: set ft=ruby :

#  ┏━╸╻  ┏━┓┏┓ ┏━┓╻  ┏━┓
#  ┃╺┓┃  ┃ ┃┣┻┓┣━┫┃  ┗━┓
#  ┗━┛┗━╸┗━┛┗━┛╹ ╹┗━╸┗━┛
# These will need to be gleaned or guessed at from Kali box
DEBIAN_RELEASE  = '11'
DEBIAN_CODENAME = 'bullseye'


#  ┏┳┓┏━┓╻┏┓╻
#  ┃┃┃┣━┫┃┃┗┫
#  ╹ ╹╹ ╹╹╹ ╹

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

  config.vm.synced_folder "provisioning/salt/roots/salt", "/srv/salt", owner: "root", group: "root"
  config.vm.synced_folder "provisioning/salt/roots/pillar", "/srv/pillar", owner: "root", group: "root"


  #  ┏━┓┏━┓┏━┓╻ ╻╻┏━┓╻┏━┓┏┓╻╻┏┓╻┏━╸
  #  ┣━┛┣┳┛┃ ┃┃┏┛┃┗━┓┃┃ ┃┃┗┫┃┃┗┫┃╺┓
  #  ╹  ╹┗╸┗━┛┗┛ ╹┗━┛╹┗━┛╹ ╹╹╹ ╹┗━┛

  config.vm.provision :shell do |s|
    s.name = "Initial preparation and settings"
    s.path = "provisioning/scripts/00_initial"
    s.privileged = true
  end

  config.vm.provision :shell do |s|
    s.name = "Preparation for salt provisioning"
    s.env = { 
      :DEBIAN_RELEASE => "#{DEBIAN_RELEASE}", 
      :DEBIAN_CODENAME => "#{DEBIAN_CODENAME}" 
    }
    s.path = "provisioning/scripts/10_saltstack_prep"
    s.privileged = true
  end

  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.run_highstate = true
    salt.bootstrap_script = "provisioning/scripts/20_saltstack_bootstrap"
    salt.salt_call_args = ["-c /tmp/"]
    salt.minion_config = "provisioning/salt/minion"
  end

  config.vm.provision :shell do |s|
    s.name = "Finalize provisioning"
    s.path = "provisioning/scripts/99_finalize"
    #s.reboot = true 
    #   'vagrant up' hangs after VM successfully reboots (witnessed in gui) 
    #   with '==> default: Waiting for machine to reboot...' message
  end


  #  ╺┳╸┏━┓╻┏━╸┏━╸┏━╸┏━┓┏━┓
  #   ┃ ┣┳┛┃┃╺┓┃╺┓┣╸ ┣┳┛┗━┓
  #   ╹ ╹┗╸╹┗━┛┗━┛┗━╸╹┗╸┗━┛

  #config.trigger.after :provision do |t|
  #  t.warn = "You should probably do a 'vagrant reload' now."
  #end

end
