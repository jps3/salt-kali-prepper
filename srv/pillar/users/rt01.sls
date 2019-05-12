---
users-formula:
  use_vim_formula: true

users:
  rt01:
    fullname: Red Teamer 1
    password: $6$8Km/UppZ95GSHSs1$I6SevyOhqvECL4/ZAR8VX6ADT.XWZFz5lGHDvV11ROZBKnkInfuYt6BHT2XBM4tl5rsdhLH3Ba5ExB03bSsaN/
    empty_password: false
    enforce_password: true
    manage_bashrc: true
    manage_vimrc: true
    shell: /bin/bash
    sudouser: true
    sudo_defaults:
      - '!requiretty'
    sudo_rules:
      - ALL=(ALL) NOPASSWD:ALL
    system: false
    gitconfig:
      user.name: Red Teamer 1
      user.email: rt01@127.0.0.1
