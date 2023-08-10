#!/bin/bash
#
# Update Singularity due to 
#

singularity_version=$(singularity --version)

echo "singularity_version: ${singularity_version}"

# https://github.com/sylabs/singularity/releases/download/v3.11.4/singularity-ce_3.11.4-jammy_amd64.deb