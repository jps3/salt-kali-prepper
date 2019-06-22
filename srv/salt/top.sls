---
# salt
base:
  '*':
    # salt-formulas
    - apt.transports.https
    - users
    - packages
    # locally-defined states
    #- gnomedesktop