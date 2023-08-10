#!/bin/bash
#
# Fixes:
#
# ERROR: Cannot find Java or it's a wrong version -- please make sure that Java 8 or later (up to 18) is installed
# NOTE: Nextflow is trying to use the Java VM defined by the following environment variables:
#  JAVA_CMD: /usr/bin/java
#  JAVA_HOME: 
#
# Usage:
#
#   From within the `scripts` folder:
#
#     . ./fix_java_error.sh
#     source ./fix_java_error.sh
#
#   From the main folder:
#
#   . ./scripts/fix_java_error.sh
#   source ./scripts/fix_java_error.sh

WHICH_JAVEC=$(which javac)
LINK_JAVEC=$(readlink -f "${WHICH_JAVEC}")
export JAVA_HOME=${LINK_JAVEC%/bin/javac}
export JAVA_CMD="${JAVA_HOME}/bin/java"
