---
# salt
base:
  '*':
    - users
    - nm
    # salt-formulas
    - packages
    - ufw
    # others
    - dnsmasq
    - vscodium
