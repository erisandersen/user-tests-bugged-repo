#!/bin/bash

# set -e

if [ -d ".bins" ]; then
    (cd .bins && git pull)
else
    git clone --depth 1 https://github.com/erisandersen/inspectify-testing-binaries.git .bins
fi

chmod +x .bins/inspectify-*

if [[ "$(uname)" == "Darwin" ]]; then
    # MacOS
    ARCH=$(uname -m)
    if [[ "$ARCH" == "x86_64" ]]; then
        ./.bins/inspectify-macos-x86_64 "$@"
    elif [[ "$ARCH" == "arm64" ]]; then
        ./.bins/inspectify-macos-arm64 "$@"
    else
        echo "Unsupported MacOS architecture"
        exit 1
    fi
elif [[ "$(uname)" == "Linux" ]]; then
    # Linux
    ./.bins/inspectify-linux "$@"
else
    echo "Unsupported operating system"
    exit 1
fi
