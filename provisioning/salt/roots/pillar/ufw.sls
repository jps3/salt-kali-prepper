---
# pillar/ufw.yml
ufw:
  enabled: True
  settings:
    ipv6: True
  services:
    "22":
      protocol: tcp
      comment: ssh
    "4242,4444":
      protocol: tcp
      comment: metasploit/netcat
    "8000:8099":
      protocol: tcp
      comment: miscellaneous
