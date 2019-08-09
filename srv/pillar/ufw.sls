---
# pillar/ufw.yml
ufw:

  enabled: True

  settings:
    loglevel: low
    ipv6: False

  services:
    "8000:9999":
      protocol: tcp
      comment: Used for nefarious purposes, obviously
