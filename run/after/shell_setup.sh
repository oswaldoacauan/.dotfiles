#!/bin/sh
set -o errexit -o nounset

# enables bat config and themes
echo "Building bat config and themes..."
bat cache --build

# enables fzf-tab
echo "Enabling fzf-tab..."
enable-fzf-tab
