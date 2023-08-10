#!/bin/bash
#
# Modify /etc/singularity/singularity.conf
# to allow the sharing of loop devices.
#
# Usage:
#
#   sudo ./allow_sharing_of_loop_devices.sh
#   sudo ./scripts/allow_sharing_of_loop_devices.sh
#
filename="/etc/singularity/singularity.conf"
backup_filename="/etc/singularity/singularity.conf.bak_2"

# Check before

# Style of if statement from https://www.shellcheck.net/wiki/SC2143
if grep -q "max loop devices = 256$" ${filename}
then 
  echo "Only 256 loop devices allowed"
  echo "Making copy to ${backup_filename}"
  sudo cp ${filename} ${backup_filename}
else 
  echo "More loop devices allowed. Nothing to do :-)"
  exit 0
fi

if [ ! -f $backup_filename ]; then
  echo "Backup file '${backup_filename}' not found"
  exit 42
fi

sed -i "s/max loop devices = 256/max loop devices = 2560/" "${filename}"

if grep -q "max loop devices = 256$" ${filename}
then 
  echo "Error: still only 256 loop devices allowed ...?"
  exit 42
else 
  echo "More loop devices allowed. Well done!"
  exit 0
fi
