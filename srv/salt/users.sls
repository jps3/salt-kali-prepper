---
vagrant:
  user.present:
    - fullname: Kali User
    - shell: /usr/bin/zsh
    - uid: 1000
    - gid: 1000
    # mkpasswd -m yescrypt
    - password: 