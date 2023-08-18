#!/bin/bash
#
# Determine if Singularity is in the newest version
#
# Usage:
#
#   ./scripts/has_newest_singularity.sh
#   ./scripts/has_newest_singularity.sh -V
#   ./scripts/has_newest_singularity.sh --verbose
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

expected_path="/usr/bin/singularity"
current_path=$(which singularity)
if [ "${current_path}" != "${expected_path}" ]
then
  echo "ERROR: the current Singularity path mismatches the expected."
  echo " * current Singularity path: ${current_path}"
  echo " * expected Singularity path: ${expected_path}"
  echo " "
  echo "Tip: use 'which singularity' to find out the current path,"
  echo "     then delete/rename that file"
  exit 1
else
  if [ "${verbose}" -eq 1 ]
  then
    echo "Singularity is found at the correct path at ${current_path}"
  fi
fi

singularity_version=$(singularity --version)

if echo "${singularity_version}" | grep -iq "${newest_version}"
then
  if [ "${verbose}" -eq 1 ]
  then 
    echo "Latest Singularity version (${newest_version}) found."
  fi
  echo "1"
  exit 1
else
  if [ "${verbose}" -eq 1 ]
  then 
    echo "Older version of Singularity found:"
    echo " * Newest singularity_version: ${newest_version}"
    echo " * Installed singularity_version: ${singularity_version}"
    echo " "
    echo "Tip: Run:"
    echo " "
    echo "  ./scripts/update_singularity.sh"
  fi
  echo "0"
  exit 0
fi
