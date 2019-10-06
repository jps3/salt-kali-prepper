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
echo " 1. Adding saltstack apt repo ..."
echo " 2. Installing saltstack's salt-minion ..."
echo " 3. Installing python-git ..."
echo ""
echo "************************************************************"

wget -O - https://repo.saltstack.com/apt/debian/9/amd64/latest/SALTSTACK-GPG-KEY.pub \
| sudo apt-key add -

echo 'deb http://repo.saltstack.com/apt/debian/9/amd64/latest stretch main' \
| tee /etc/apt/sources.list.d/saltstack.list

apt-get update

apt-get \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  install \
  -y \
  salt-common=2018.3.4+dfsg1-7 \
  salt-minion=2018.3.4+dfsg1-7 \
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
