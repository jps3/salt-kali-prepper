---
vscodium:
  pkgrepo.managed:
    - humanname: vscodium-repo
    - name: deb https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main
    - file: /etc/apt/sources.list.d/vscodium.list
    - key_url: https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
    - gpgcheck: 1
    - require_in:
        - pkg: codium

codium:
  pkg.latest:
    - refresh: True
