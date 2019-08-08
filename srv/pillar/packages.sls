---
# pillar/packages.sls
packages:
  pkgs:
    wanted:
      # --------------------------------------------------
      #  baseline
      # --------------------------------------------------
      - apt-file
      - apt-listbugs
      - athena-jot
      - build-essential
      - cmake
      - curl
      - dc
      - debian-goodies
      - figlet
      - gcc-multilib
      - jq
      - libbz2-dev
      - libc6-dev-i386
      - libncurses5-dev
      - libncursesw5-dev
      - libreadline-dev
      - libsqlite3-dev
      - libssl-dev
      - llvm
      - molly-guard
      - needrestart
      - open-vm-tools-desktop
      - python3-pygments
      - python3-pip
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
      # forensics - logs
      - bro
      - bro-aux
      - forensics-all
      - lnav
      # forensics - steganography
      - outguess
      - pngcheck
      - steghide
      - stegosuite
      # ? stegcracker f/github ?
      # recon/attack
      - crackmapexec
      - ftp
      - dmitry
      - dnsrecon
      - fierce
      - gobuster
      - metagoofil
      - recon-ng
      - seclists
      - theharvester
      # other/misc
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
      - iptables
      - iptables-persistent

