#!/usr/bin/env bash
set -e

if [ "$EUID" -ne 0 ]; then
    echo "This script uses functionality which requires root privileges"
    exit 1
fi

# Start the build with an empty ACI
acbuild --debug begin

# Adding Maintainer Information
acbuild annotation add authors "DAVINDER PAL <dpsangwal@gmail.com>"

# In the event of the script exiting, end the build
trap '{ export EXT=$?; acbuild --debug end && exit $EXT; }' EXIT

# Name the ACI Image
acbuild --debug set-name 116daivnder/binary

# Base Image
acbuild --debug dep add quay.io/coreos/alpine-sh

# Add a port for http traffic on port 8080
acbuild --debug port add http tcp 8080

# Copy the app binary to the ACI
acbuild --debug copy binary /binary

# Run nodejs with the app
acbuild --debug set-exec -- /binary

# Name of container Image after build
acbuild --debug write --overwrite binary-alpine.aci
