---
# salt
base:
  '*':
    # salt-formulas
    - apt.transports.https
    - users
    - packages
    - user-root
    # locally-defined states
    # - gnomedesktop
