#!/bin/bash -eu

# ----------------------------------------------------------------------
# 
#  Add saltstack APT repo and install latest salt-minion
# 
#  https://repo.saltstack.com/#debian
# 
# ----------------------------------------------------------------------

declare -a pkg_list
pkg_list=( "salt-minion" "python3-git" )

# shellcheck disable=SC1091
source lib_color_logging.sh

# ----------------------------------------------------------------------

if [ "$EUID" -ne 0 ]; then
  error_and_exit "Must be run as root."
fi

# ----------------------------------------------------------------------

print_header "BEGIN"

log "Sourcing os-release"
# shellcheck disable=SC1091
source /etc/os-release

info "PRETTY_NAME" "${PRETTY_NAME}"
info "VERSION"     "${VERSION}"


# ----------------------------------------------------------------------

print_header "Configure APT"

if [[ "${ID_LIKE}" == "debian" ]]; then
  case "${VERSION%%\.*}" in
    2019|2020) APT_KEY_URL="https://repo.saltstack.com/py3/debian/10/amd64/latest/SALTSTACK-GPG-KEY.pub";
          APT_SOURCE="deb http://repo.saltstack.com/py3/debian/10/amd64/latest buster main"
          ;;
       *) echo "** NOT SUPPORTED **"
          exit 1
          ;;
  esac
fi

info "APT_KEY_URL" "${APT_KEY_URL}"
log "Adding apt key for saltstack repo ..."
wget --quiet -O - "${APT_KEY_URL}" | apt-key add -

info "APT_SOURCE" "${APT_SOURCE}"
log "Adding apt source for saltstack repo ..."
echo "${APT_SOURCE}" | tee "/etc/apt/sources.list.d/saltstack.list"


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
log " $ salt-call --local state.apply"
log ""
log " Or, with debugging output:"
log " $ salt-call --log-level=debug --local state.apply"

print_header "END."
exit 0
