#!/bin/bash

export DEBIAN_FRONTEND="noninteractive"

declare -a pkg_list
pkg_list=( "salt-minion" "salt-common" )

apt-get \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  install \
  -y -qq \
  "${pkg_list[@]}"
