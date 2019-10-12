#!/bin/bash -eu

# ----------------------------------------------------------------------
# 
#  Add saltstack APT repo and install latest salt-minion
# 
#  https://repo.saltstack.com/#debian
# 
# ----------------------------------------------------------------------

echo "************************************************************"
echo ""
echo " 1. Updating apt lists ..."
echo " 2. Installing saltstack's salt-minion ..."
echo ""
echo "************************************************************"

apt-get update

apt-get \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  install \
  -y \
  salt-minion \
  python-git \
  python3-git

dpkg-query --show --showformat '${Status} ${Package} ${Version} ${Architecture}' salt-minion

update-rc.d salt-minion disable
 

# ----------------------------------------------------------------------
# 
#  Copy components from this repo directory required destinations
#  to get masterless salt-minion functioning.
# 
# ----------------------------------------------------------------------

cp -R etc/salt/minion.d/*.conf /etc/salt/minion.d/
cp -R srv/pillar /srv/
cp -R srv/salt   /srv/

echo "************************************************************"
echo ""
echo " Try applying the masterless (local) salt states:"
echo ""
echo " $ salt-call --local state.apply"
echo ""
echo " Or, with debugging output:"
echo ""
echo " $ salt-call --log-level=debug --local state.apply"
echo ""
echo "************************************************************"

exit 0
