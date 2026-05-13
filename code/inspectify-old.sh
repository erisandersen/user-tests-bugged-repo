#!/bin/bash

# set -e

if [ -d ".bins-old" ]; then
    (cd .bins-old && git pull)
else
    git clone --depth 1 https://github.com/team-checkr/inspectify-binaries.git .bins-old
fi

chmod +x .bins-old/inspectify-*

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
