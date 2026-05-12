#!/bin/bash

# set -e

if [ -d ".bins-old" ]; then
    # If the .bins directory exists, navigate into it and pull the latest changes
    (cd .bins-old && git pull)
else
    # If the .bins directory does not exist, clone the repository
    git clone --depth 1 https://github.com/team-checkr/inspectify-binaries.git .bins-old
fi

if [[ "$(uname)" == "Darwin" ]]; then
    # MacOS
    ARCH=$(uname -m)
    if [[ "$ARCH" == "x86_64" ]]; then
        ./.bins-old/inspectify-macos-x86_64 "--port 9001" "$@"
    elif [[ "$ARCH" == "arm64" ]]; then
        ./.bins-old/inspectify-macos-arm64 "--port 9001" "$@"
    else
        echo "Unsupported MacOS architecture"
        exit 1
    fi
elif [[ "$(uname)" == "Linux" ]]; then
    # Linux
    ./.bins-old/inspectify-linux "--port 9001" "$@"
else
    echo "Unsupported operating system"
    exit 1
fi
