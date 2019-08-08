---
# salt/sublime-text.sls
sublime_text_repo:
  pkgrepo.managed:
    - humanname: deb-sublimetext
    - name: deb https://download.sublimetext.com/ apt/stable/
    - file: /etc/apt/sources.list.d/deb-sublimetext.list
    - key_url: https://download.sublimetext.com/sublimehq-pub.gpg

sublime-text:
  pkg.installed:
    - refresh: True
    - require:
        - sublime_text_repo