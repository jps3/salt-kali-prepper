#!/bin/bash -eu

# ----------------------------------------------------------------------
# 
#  Add saltstack APT repo and install latest salt-minion
# 
#  https://repo.saltstack.com/#debian
# 
# ----------------------------------------------------------------------

echo
echo "************************************************************"
echo " 1. Updating apt lists ..."
echo " 2. Installing saltstack's salt-minion ..."
echo " 3. Installing python git ..."
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

echo
echo "************************************************************"
echo " 4. Verifying salt-minion installed:"
echo "************************************************************"
dpkg-query --show --showformat '${Status} ${Package} ${Version} ${Architecture}' salt-minion

echo
echo
echo "************************************************************"
echo " 5. Disabling salt-minion service "
echo "    (only used on-demand with --local)"
echo "************************************************************"
set -x
update-rc.d salt-minion disable
set +x

echo
echo "************************************************************"
echo " 6. Copying files to /etc/salt, /srv/salt, /srv/pillar"
echo "************************************************************"
set -x
cp -R etc/salt/minion.d/*.conf /etc/salt/minion.d/
cp -R srv/pillar /srv/
cp -R srv/salt   /srv/
set +x

echo
echo "************************************************************"
echo
echo " Try applying the masterless (local) salt states:"
echo " $ salt-call --local state.apply"
echo
echo " Or, with debugging output:"
echo " $ salt-call --log-level=debug --local state.apply"
echo
echo "************************************************************"

exit 0
