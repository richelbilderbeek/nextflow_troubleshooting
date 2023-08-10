#!/bin/bash
#
# Grant 'loop' access
#
# From https://github.com/sylabs/singularity/issues/67#issuecomment-853243148
#
# Usage:
#
#   sudo ./grant_access_to_loop.sh
#
# Note that if loop already has access, one does not need to use sudo:
#
#   ./grant_access_to_loop.sh
#

# Style of if statement from https://www.shellcheck.net/wiki/SC2143
# if groups | grep -q "loop"
if getent group loop > /dev/null
then 
  echo "'loop' is already in 'groups'. Nothing left to do :-)"
  exit 0
else 
  echo "No 'loop' in 'groups'."
fi

sudo groupadd loop

if getent group loop > /dev/null
then 
  echo "'loop' is now in 'groups'. Great!"
  exit 0
else 
  echo "Error: 'loop' is still not in 'groups' ...?"
  exit 42
fi
