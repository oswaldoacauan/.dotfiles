#!/bin/sh
set -o errexit -o nounset

# enables touch id for sudo commands
echo "Enabling Touch ID for sudo..."
sudo sed -i.bak '1s/^/auth sufficient pam_tid.so\'$'\n/' /etc/pam.d/sudo
