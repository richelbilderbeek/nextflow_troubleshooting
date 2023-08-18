#!/bin/bash
#
# Update Singularity due to the newest version
#
# Usage:
#
#   ./scripts/update_singularity.sh
#   ./scripts/update_singularity.sh -V
#   ./scripts/update_singularity.sh --verbose
#
# Output:
#
#   * Prints 0 and has return code 0 when not
#   * Prints 1 and has return code 1 when true
#   * In verbose mode, prints more
#
verbose=$(("$#" != 0))
newest_version="3.11.4"

if [ "${verbose}" -eq 1 ]
then
  echo "Verbose mode"
fi

if [ ! -f scripts/has_newest_singularity.sh ]
then
  echo "ERROR: 'scripts/has_newest_singularity.sh' not found."
  exit 42
fi

has_newest_singularity=$(bash scripts/has_newest_singularity.sh)
if [[ ${has_newest_singularity} == "1" ]]
then
  echo "Singularity already in its latest version. Doing nothing :-)"
  exit 0
fi


if [ "${verbose}" -eq 1 ]
then
  echo "Updating to newer version of Singularity"
fi

wget --timestamping "https://github.com/sylabs/singularity/releases/download/v${newest_version}/singularity-ce_${newest_version}-jammy_amd64.deb"
sudo dpkg --install "singularity-ce_${newest_version}-jammy_amd64.deb"

has_newest_singularity=$(bash scripts/has_newest_singularity.sh)
if [[ ${has_newest_singularity} == "1" ]]
then
  echo "Success: Singularity now in its latest version"
  exit 0
else
  echo "ERROR: Singularity still in an older version...?"
  exit 1
fi
