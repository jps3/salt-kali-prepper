---
# pillar/packages.sls
packages:
  pkgs:
    wanted:
      # --------------------------------------------------
      #  baseline
      # --------------------------------------------------
      - aha
      - apt-file
      - apt-listbugs
      - athena-jot
      - build-essential
      - cmake
      - curl
      - dc
      - debian-goodies
      - direnv
      - figlet
      - flameshot
      - gcc-multilib
      - jq
      - libbz2-dev
      - libc6-dev-i386
      #- libncurses5-dev
      #- libncursesw5-dev
      - libappindicator3-1
      - libreadline-dev
      - libsqlite3-dev
      - libssl-dev
      - llvm
      - molly-guard
      - needrestart
      - open-vm-tools-desktop
      - python3-pygments
      - python3-pip
      - rbenv
      - tk-dev
      - vim-nox
      - wget
      - xmlstarlet
      - xz-utils
      - yamllint
      - zlib1g-dev
      # --------------------------------------------------
      #  additional tools
      # --------------------------------------------------
      # -*- forensics - logs -*-
      #- bro      # on 20190808 getting error saying no package candidate for "bro" ???
      #- bro-aux  # no bro, no bro-aux (not useful)
      # bro now rebranded as zeek
      # binary packages via apt repo
      # instructions at https://www.zeek.org/download/packages.html
      - forensics-all
      - lnav
      # -*- forensics - steganography -*-
      - outguess
      - pngcheck
      - steghide
      - stegosuite
      # -*- recon/attack -*-
      - crackmapexec
      - ftp
      - dmitry
      - dnsrecon
      - fierce
      - gdbserver
      - gobuster
      - metagoofil
      - recon-ng
      - seclists
      - theharvester
      # -*- other/misc -*-
      - docker.io
      - docker-compose
      - pandoc
      - shellcheck
      - strongswan
      # --------------------------------------------------
      #  ui enhancement
      # --------------------------------------------------
      - ack
      - byobu
      - fonts-powerline
      - fortunes-bofh-excuses
      - python3-pygments
      - vim-pathogen
      # --------------------------------------------------
      #  kali defense
      # --------------------------------------------------
      - bleachbit
      - chkrootkit
      - debsecan
      - debsums
      - fail2ban
      - privoxy
      - scrub
      - tor
      - ufw

