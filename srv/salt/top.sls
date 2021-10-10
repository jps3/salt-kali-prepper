---
# salt
base:
  '*':
    - users
    # salt-formulas
    - packages
    - ufw
    # others
    - dnsmasq
    - vscodium
