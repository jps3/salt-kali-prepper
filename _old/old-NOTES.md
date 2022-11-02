# Notes

## TODOs:

TODO: `nmcli connection import type openvpn file /mnt/hgfs/htb/f00l8r1t3.ovpn`
TODO: start menu favorites
TODO: byobu prefs
TODO: bash_it prefs
TODO: diff-so-fancy https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
TODO: update-alternatives --config editor  --> vim
TODO: update-alternatives --config java    --> java8

~~DONE: Change 'root' password (6/22/19: currently manually done)~~
~~DONE: Create new 'rtXXXX' (Red Team XXXX) user~~
~~DONE: Add 'rtXXXX' user to 'sudo' group~~
~~DONE: Ensure 'rtXX' user allowed "ALL = (ALL) NOPASSWD: ALL"~~

### https://github.com/amix/vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

apt-get install fonts-ibm-plex

git clone --depth=1 https://github.com/saltstack/salt-vim ~/.vim_runtime/my_plugins/salt-vim


Update APT, without stopping/asking to restart services, etc, hands-free
Ensure iptables installed, enabled and default, sane ruleset enabled
Ensure iptables-persistent installed and enabled with stats/logging
Ensure macchanger(?) installed, enabled, working
CHANGE HOSTNAME FROM 'kali'

Can dhcp client opts be randomized (on boot) to blend in more generically with working environment? (if not shared network device)


Python3 (pip3) (virtualenv?) packages:
- `ropper` [GitHub](https://github.com/sashs/Ropper) (gef)
- `keystone-engine` (gef)
- `pwntools`

Github Repo List
- https://github.com/ffuf/ffuf
- https://github.com/unmeg/hax
- https://github.com/byt3bl33d3r/CrackMapExec
- https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite
- https://github.com/CBHue/PyFuscation
- https://github.com/decalage2/oletools
- https://github.com/decalage2/ViperMonkey
- https://github.com/dirkjanm/ldapdomaindump.git
- https://github.com/DominicBreuker/pspy/releases
- https://github.com/flozz/p0wny-shell
- https://github.com/frohoff/ysoserial
- https://github.com/fuzzdb-project/fuzzdb
- https://github.com/GreatSCT/GreatSCT
- https://github.com/Hackplayers/evil-winrm
- https://github.com/hfiref0x/UACME
- https://github.com/kpcyrd/sn0int
- https://github.com/leechristensen/Random
- https://github.com/lupoDharkael/flameshot
- https://github.com/m8r0wn/nullinux
- https://github.com/michenriksen/aquatone/releases
- https://github.com/n1nj4sec/pupy
- https://github.com/ptoomey3/evilarc
- https://github.com/pwntester/cheatsheets
- https://github.com/rebootuser/LinEnum
- https://github.com/riramar/hsecscan
- https://github.com/riverloopsec/killerbee
- https://github.com/s-rah/onionscan
- https://github.com/skelsec/msldap
- https://github.com/snail007/goproxy
- https://github.com/sophron/wifiphisher
- https://github.com/tenable/upnp_info
- https://github.com/TheZ3ro/gogsownz
- https://github.com/threatexpress/red-team-scripts
- https://github.com/trailofbits/algo
- https://github.com/trevoro/snmp-mibs
- https://github.com/twintproject/twint
- https://github.com/vanhoefm/broadkey
- https://github.com/vanhoefm/modwifi
- https://github.com/wireghoul/dotdotpwn
- https://github.com/x0rz/tweets_analyzer
- https://github.com/xtr4nge/FruityWifi
- https://github.com/sonertari/SSLproxy

## Reversing/Development Tools

- `eclipse.sls`: downloads and copies to /opt, creates `/usr/share/applications/eclipse.deskop`, creates `/usr/bin/eclipse`, forces update/refresh of console to find and use that .desktop file, and adds to Favorites.  
- https://github.com/alghanmi/ubuntu-desktop_setup/wiki/Eclipse-Install-Guide
- https://www.eclipse.org/downloads/packages/
- https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2019-12/R/eclipse-jee-2019-12-R-linux-gtk-x86_64.tar.gz
- `echo '9ba23b29bd3a605c024b9fdd28f19f16972e15166b32ebadbc410b30e341ce39620f275c28232e0ba2d31304f277ce16e84e399a8083e0e9c6c5c88d6ca68870  eclipse-jee-2019-12-R-linux-gtk-x86_64.tar.gz' > eclipse-jee-2019-12-R-linux-gtk-x86_64.tar.gz.DIGEST`
- install jd-gui
- install bytecode-viewer



stegcracker (f/github)


https://github.com/Bash-it/bash-it
```
git clone --depth=1 https://github.com/Bash-it/bash-it ~/.bash_it
~/.bash_it/install.sh
exec $SHELL --login
bash-it enable plugin autojump
bash-it enable plugin pyenv
exec $SHELL --login
```

https://github.com/pyenv/pyenv-installer
`curl https://pyenv.run | bash`

https://extensions.gnome.org/
https://github.com/gTile/gTile
Broken>? https://extensions.gnome.org/extension/1298/ztile/

## Firefox Add-Ons

- https://addons.mozilla.org/en-US/firefox/addon/wappalyzer/
- https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/
- https://addons.mozilla.org/en-US/firefox/addon/jsonview/
- https://addons.mozilla.org/en-US/firefox/addon/cookie-quick-manager/
- https://addons.mozilla.org/en-US/firefox/addon/saml-tracer/

- https://addons.mozilla.org/en-US/firefox/addon/noscript/
- https://addons.mozilla.org/en-US/firefox/addon/duckduckgo-for-firefox/
- https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/
- https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/
- https://addons.mozilla.org/en-US/firefox/addon/umatrix/
- https://addons.mozilla.org/en-US/firefox/addon/ubo-scope/

/root/.mozilla/firefox/qdwrtvn3.default/extensions/


TODO: dpkg pre-configurations for: kismet, wireshark, sslh(?) via inetd(?), 
      also generally accept developer defaults (Y/I)

## openvpn
apt-get install network-manager-openvpn
nmcli connection import type openvpn file /mnt/hgfs/htb/ue4dai-vip.ovpn


