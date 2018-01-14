#!/bin/bash
# Author: Jackson
# Function: Deploy LXD container with puppet code


# Variablised hostname (otherwise standard)
lxc launch ubuntu:16.04 $1

# Map IDs
# lxc config set $1 raw.idmap "both $UID 1000"

# Mount puppet directory into container
# lxc config device add $1 puppet disk source=$HOME path=/opt

# Start container
# lxc start $1

# Push puppet directory (Couldn't get mount to work, so pushing instead - unfortunately LTS ubuntu doesn't yet support recursive file push - so tarring beforehand)
tar cf - ./puppet | lxc exec $1 -- tar xf - -C /opt/

# Networking doesn't seem to be available straight away resulting in NS lookup errors in the next steps (sleep 5 is enough time)
sleep 5

# Update and install puppet
lxc exec $1 -- apt-get update 
lxc exec $1 -- apt install puppet -y

# Apply manifests
lxc exec $1 -- puppet apply /opt/puppet/
