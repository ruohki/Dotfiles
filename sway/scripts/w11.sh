#!/bin/bash
tmp=$(sudo virsh list --all | grep " win11 " | awk '{ print $3}')
lgs=$(pgrep -c 'looking-glass-c')
if ([ "x$tmp" == "x" ] || [ "x$tmp" != "xrunning" ])
then
    sudo virsh start win11
    sleep 1
    looking-glass-client -F
        # Try additional commands here...
else
  if [[ $lgs == '0' ]]
  then
    looking-glass-client -F
  fi
fi
