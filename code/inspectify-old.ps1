Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (Test-Path .bins-old) {
    # If the .bins directory exists, navigate into it and pull the latest changes
    Set-Location .bins-old
    git pull
    Set-Location ..
} else {
    # If the .bins directory does not exist, clone the repository
    git clone --depth 1 https://github.com/team-checkr/inspectify-binaries.git .bins-old
}

# Unconditionally run the Windows binary
.\.bins-old\inspectify-win.exe --port 9001 $args
