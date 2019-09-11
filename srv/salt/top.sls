---
# salt
base:
  '*':
    # salt-formulas
    - apt.transports.https
    - dnsmasq
    - users
    - packages
    #- sublime-text
    - ufw
    - user-root
    # TODO:- msf-setup
    # locally-defined states
    # - gnomedesktop
