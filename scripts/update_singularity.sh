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

deb_filename="singularity-ce_${newest_version}-jammy_amd64.deb"
url="https://github.com/sylabs/singularity/releases/download/v${newest_version}/${deb_filename}"

if [ "${verbose}" -eq 1 ]
then
  echo "Updating to newer version of Singularity"
  echo "deb_filename: ${deb_filename}"
  echo "URL: ${url}"
fi

wget --timestamping "${url}"

if [ ! -f "${deb_filename}" ]
then
  echo "ERROR: deb_filename (${deb_filename}) does not exist"
  exit 42
fi

sudo dpkg --install "${deb_filename}"

has_newest_singularity=$(bash scripts/has_newest_singularity.sh)
if [[ ${has_newest_singularity} == "1" ]]
then
  echo "Success: Singularity now in its latest version"
  exit 0
else
  echo "ERROR: Singularity still in an older version...?"
  echo " "
  echo "Note: reported at https://github.com/sylabs/singularity/issues/2094"
  exit 1
fi
