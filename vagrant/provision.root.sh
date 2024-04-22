#! /bin/bash  -xue

test  -f "/root/.provision/root"  &&  exit 0

echo  Provisioning $HOSTNAME

sudo  timedatectl  set-timezone Asia/Tokyo

sudo  yum  install -y  \
    screen

sudo  mkdir  -p    /tools
sudo  chmod  1777  /tools

mkdir -p "/root/.provision"
date  >  "/root/.provision/root"
