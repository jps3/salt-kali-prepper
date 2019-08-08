---
# salt
base:
  '*':
    # salt-formulas
    - apt.transports.https
    - users
    - packages
    - sublime-text
    - user-root
    # locally-defined states
    # - gnomedesktop
