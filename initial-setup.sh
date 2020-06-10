#!/bin/bash -eu

# ----------------------------------------------------------------------
# 
#  Add saltstack APT repo and install latest salt-minion
# 
#  https://repo.saltstack.com/#debian
# 
# ----------------------------------------------------------------------

declare -a pkg_list
pkg_list=( "salt-minion" "salt-common" )

# shellcheck disable=SC1091
source lib_color_logging.sh

# ----------------------------------------------------------------------

if [ "$EUID" -ne 0 ]; then
  error_and_exit "Must be run as root."
fi

# ----------------------------------------------------------------------

print_header "BEGIN"

info "LSB" "$(lsb_release -si) $(lsb_release -sr) $(lsb_release -sc)"


# ----------------------------------------------------------------------

print_header "Install SaltStack"

log "Updating APT ..."
apt-get update -d -qq

log "Installing packages ..."
apt-get \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  install \
  -y -qq \
  "${pkg_list[@]}"


# ----------------------------------------------------------------------

print_header "Verifying Installation"

for pkg in "${pkg_list[@]}"; do
  log "Checking ${pkg} ..."
  dpkg-query --show --showformat '${Status} ${Package} ${Version} ${Architecture}\n' "${pkg}"
done


# ----------------------------------------------------------------------

print_header "Configure salt-minion"
log "Disabling salt-minion service (only --local used)"
update-rc.d salt-minion disable


# ----------------------------------------------------------------------

print_header "Rsync (hard) SaltStack support files to /srv/"

log "Rsync'ing ./etc/salt/minion.d/ files to /etc/salt/minion.d/ ..."
rsync -a --delete etc/salt/minion.d/ /etc/salt/minion.d/
log "Rsync'ing ./srv/ to /srv/ ..."
rsync -a --delete srv/ /srv/


# ----------------------------------------------------------------------

print_header "Installation Complete"

log " Try applying the masterless (local) salt states:"
log " $ sudo salt-call --local state.apply"
log ""
log " Or, with debugging output:"
log " $ sudo salt-call --log-level=debug --local state.apply"

print_header "END."
exit 0
