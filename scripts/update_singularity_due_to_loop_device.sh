#!/bin/bash
#
# Update Singularity due to 
#

singularity_version=$(singularity --version)

echo "singularity_version: ${singularity_version}"

if echo "${singularity_version}" | grep -iq "3.11"
then
  echo "Singularity version 3.11 found. Bad!"
else
  echo "Singularity version 3.11 not found. That means we this is done!"
  exit 0
fi

wget https://github.com/sylabs/singularity/releases/download/v3.11.4/singularity-ce_3.11.4-jammy_amd64.deb
sudo dpkg --install singularity-ce_3.11.4-jammy_amd64.deb

