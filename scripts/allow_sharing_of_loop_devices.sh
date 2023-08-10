#!/bin/bash
#
# Modify /etc/singularity/singularity.conf
# to allow the sharing of loop devices.
#
# Usage:
#
#   ./allow_sharing_of_loop_devices.sh
#   ./scripts/allow_sharing_of_loop_devices.sh
#
filename="/etc/singularity/singularity.conf"
backup_filename="/etc/singularity/singularity.conf.bak"

# Check before

# Style of if statement from https://www.shellcheck.net/wiki/SC2143
if grep -q "shared loop devices = no" ${filename}
then 
  echo "No shared loop devices allowed"
  echo "Making copy to ${backup_filename}"
  sudo cp ${filename} ${backup_filename}
else 
  echo "Shared loop devices allowed"
fi

if [ ! -f $backup_filename ]; then
  echo "Backup file '${backup_filename}' not found"
  exit 42
fi

sed -i "s/shared loop devices = no/shared loop devices = yes/" "${filename}"

# Check after
if grep -q "shared loop devices = no" ${filename}
then 
  echo "No shared loop devices allowed"
  echo "Making copy to ${backup_filename}"
  sudo cp ${filename} ${backup_filename}
else 
  echo "Shared loop devices allowed"
fi
