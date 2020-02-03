---
{% set machine_groups = ['active', 'retired'] %}

install_dnsmasq:
  pkg.installed:
    - name: dnsmasq

/etc/dnsmasq.d/000-htb-base.conf:
  file.managed:
    - source: salt://dnsmasq/files/000-htb-base.conf
    - source_hash: sha1=b84c5254ae017de06f8c6ed52ac6cf41ce830bba
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: install_dnsmasq

# TODO: Remove all /etc/dnsmasq.d/htb-machines*.conf _NOT_ defined 
#       by template here. To remove old file cruft.

{% for group in machine_groups %}
/etc/dnsmasq.d/htb-machines-{{ group }}.conf:
  file.managed:
    - source: salt://dnsmasq/files/htb-machines-{{ group }}.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: install_dnsmasq
      - file: /etc/dnsmasq.d/000-htb-base.conf
{% endfor %}

/etc/dhcp/dhclient.conf:
  file.line:
    - mode: replace
    - content: "prepend domain-name-servers 127.0.0.1;"
    - match: ^#prepend\s+domain-name-servers\s+127\.0\.0\.1;
    - require:
      - pkg: install_dnsmasq
      - file: /etc/dnsmasq.d/000-htb-base.conf

dnsmasq:
  service.running:
    - enable: True
    - watch:
      - file: /etc/dnsmasq.d/000-htb-base.conf
    {%- for group in machine_groups %}
      - file: /etc/dnsmasq.d/htb-machines-{{ group }}.conf
    {%- endfor %}

dhclient eth0:
  cmd.run:
  - onchanges_any:
    - file: /etc/dnsmasq.d/000-htb-base.conf
  {%- for group in machine_groups %}
    - file: /etc/dnsmasq.d/htb-machines-{{ group }}.conf
  {%- endfor %}


