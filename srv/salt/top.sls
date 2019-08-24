---
# salt
base:
  '*':
    # salt-formulas
    - apt.transports.https
    - dnsmasq
    - users
    - packages
    - sublime-text
    - ufw
    - user-root
    # locally-defined states
    # - gnomedesktop
