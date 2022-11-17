---
# pillar/ufw.sls
ufw:
  enabled: True

  settings:
    ipv6: True

  services:

    "22":
      protocol: tcp
      from_addr: '172.16.0.0/12'
      to_addr: '172.16.0.0/12'
      comment: ssh

    "4242,4444":
      protocol: tcp
      from_addr: '10.0.0.0/8'
      to_addr: '10.0.0.0/8'
      comment: metasploit/netcat

    "8000:8099":
      protocol: tcp
      from_addr: '10.0.0.0/8'
      to_addr: '10.0.0.0/8'
      comment: miscellaneous
