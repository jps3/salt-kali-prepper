# TODO

- [ ] `nmcli connection import type openvpn file /mnt/hgfs/htb/f00l8r1t3.ovpn`
- [ ] start menu favorites
- [ ] ~~byobu prefs~~
- [ ] ~~bash_it prefs~~
- [ ] ~~diff-so-fancy https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy~~
- [ ] ~~update-alternatives --config editor  --> vim~~
- [ ] ~~update-alternatives --config java    --> java8~~
- [ ] dpkg pre-configurations for: kismet, wireshark, sslh(?) via inetd(?), also generally accept developer defaults (Y/I)
- [ ] `srv/salt/dnsmasq/init.sls`: Remove all /etc/dnsmasq.d/htb-machines\*.conf _NOT_ defined by template here. To remove old file cruft.
- [ ] Disable `toggle_oneline_prompt` in .zshrc file
- [ ] Troubleshoot why `nmcli c u lab_jps3` (from imported \*.ovpn file) returns “could not find source connection" errors (or does this correct itself on reboot after setting managed=true)
  - [x] Add file `/etc/NetworkManager/conf.d/ifupdown-managed.conf` with contents `[ifupdown]\nmanaged=true\n`
  - ~~There is no default `ipv4.gateway` (`nmcli connection show Wired\ connection\ 1 | grep ipv4.gateway`)~~
  - ~~Perhaps docker.io is causing an issue?~~
  - Need to `nmcli c d Wired\ connection\ 1` then `nmcli c u Wired\ connection\ 1` before 
- [ ] Create a script or simple, one-line means to add new box entry for dnsmasq just by giving IP and hostname(s)
- [ ] Break out packages from srv/pillar/packages.sls into meaningful chunks (ex. 'forensics', 'steganography', 'virtualization', etc)
- [ ] Find out if provisioning/salt/users.sls password hash can be set via an external grain(s) file that is not committed to repo
- [ ] Any way to automate, but not commit to repo, adding additional share(s)? ex. `vmrun addSharedFolder `
- [ ] Find equivalent (salt?) way to do this `sed -i -E -e '/^toggle_oneline_prompt/,/^bindkey .*toggle_oneline_prompt/d' ~/.zshrc` because that toggle is SUPER ANNOYING
- [ ] `sudo ufw allow in on eth0 from 172.16.0.0/12 proto tcp to 172.16.0.0/12 port 22`
- [ ] Install dconf-cli
- [ ] ~~sudoers disable NOPASSWD for vagrant user (used `file.absent` in `users.sls` file)~~ (This breaks `vagrant` command)
- `salt-call --local state.apply` only works properly when the minion config file used for provisioning is present (when 'vagrant provision' is called it copies `./provisioning/salt/minion` to `/tmp/` typically and uses that when performing the call.)
- [ ] ufw delete all rules when provisioning


# DONE

- [x] Change 'root' password (6/22/19: currently manually done)
- [x] Create new 'rtXXXX' (Red Team XXXX) user
- [x] Add 'rtXXXX' user to 'sudo' group
- [x] Ensure 'rtXX' user allowed "ALL = (ALL) NOPASSWD: ALL"
- [x] `vscodium.sls`: https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/dists/vscodium/InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.
- [x] Fix synced folders issue which seem to stop (/srv/{pillar,salt} and /etc/salt/minion.d “disappear” in VM sometimes) ... using rsync
- [x] Figure out why the vscodium ASCII gpg key file is not de-armored for use by signed-by (maybe: https://github.com/saltstack/salt/issues/62570 ?)
- [x] Vagrantfile `config.trigger.after :provision` does _not_ seem to be triggered or run. _Answer: original syntax in Vagrantfile was wrong._
