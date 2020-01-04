---
# pillar/ufw.yml
ufw:

  enabled: True

  settings:
    loglevel: low
    ipv6: True

  services:
    "4444":
      protocol: tcp
      comment: Metasploit, typically.
    "8000:8099":
      protocol: tcp
      comment: Used for honest puposes. Honestly!
      
