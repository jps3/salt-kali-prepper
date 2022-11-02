---
vscodium-repo:
  pkgrepo.managed:
    - humanname: VSCodium
    - name: deb [signed-by=/usr/share/keyrings/pub.gpg arch=amd64] https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs vscodium main
    - file: /etc/apt/sources.list.d/vscodium.list
    - key_url: https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
    - aptkey: False
    - require_in:
      - pkg: codium

codium:
  pkg.latest:
    - refresh: True
