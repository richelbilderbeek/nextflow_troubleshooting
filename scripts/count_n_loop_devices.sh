#!/bin/bash
#
# Count the number of loop devices
#
# Usage:
#
#   ./count_n_loop_devices.sh
#   ./scripts/count_n_loop_devices.sh
#

# Trick from https://github.com/sylabs/singularity/issues/67#issue-909202253
n_loop_devices=$(ls /dev/loop* | wc --words)

echo "n_loop_devices: ${n_loop_devices}"