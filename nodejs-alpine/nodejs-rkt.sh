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
acbuild --debug set-name 116daivnder/nodejs

# Based on alpine
acbuild --debug dep add quay.io/coreos/alpine-sh

# Install nodejs
acbuild --debug run -- apk update
acbuild --debug run -- apk add nodejs
acbuild --debug run -- mkdir -p /app

# Add a port for http traffic on port 7000
acbuild --debug port add http tcp 7000

# Copy the application to the image
acbuild --debug copy-to-dir copy ./* /app

# Run nodejs with the app
acbuild --debug set-exec -- /usr/bin/node /app/application.js

# Write the result
acbuild --debug write --overwrite nodejs-alpine.aci
