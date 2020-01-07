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
      comment: metasploit/netcat
    "8000:8099":
      protocol: tcp
      comment: miscellaneous
      
