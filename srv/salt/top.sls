---
# salt
base:
  '*':
    # salt-formulas
    - user-root
    - apt.transports.https
    - users
    - packages
    # locally-defined states
    #- gnomedesktop