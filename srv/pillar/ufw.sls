---
# pillar/ufw.yml
ufw:

  enabled: True

  settings:
    loglevel: low
    ipv6: False

  services:
    "9000:9199":
      protocol: tcp
      comment: Used for nefarious purposes, obviously
