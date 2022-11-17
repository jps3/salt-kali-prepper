---
# eth0

# See note/admonition regarding Debian-based systems at:
# https://docs.saltproject.io/en/latest/ref/states/all/salt.states.network.html
/etc/network/interfaces.d:
  file.directory:
    - clean: True

/etc/NetworkManager/conf.d/ifupdown-managed.conf:
  file.managed:
    - source: salt://nm/ifupdown-managed.conf
    - user: root
    - group: root
    - mode: '0644'

NetworkManager:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /etc/NetworkManager/conf.d/ifupdown-managed.conf

#'systemctl restart NetworkManager.service':
#  cmd.run:
#    - watch:
#      - file: /etc/NetworkManager/conf.d/ifupdown-managed.conf
#
#'nmcli connection down Wired\ connection\ 1':
#  cmd.run
#
#'nmcli connection up Wired\ connection\ 1':
#  cmd.run

# This does nothing useful w.r.t. NetworkManager
#system:
#  network.managed:
#    - enabled: True
#    - type: eth
#    - proto: dhcp