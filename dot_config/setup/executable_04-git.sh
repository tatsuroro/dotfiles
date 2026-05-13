#!/bin/sh
set -e
echo "==> Configuring Git"

git config --global core.excludesFile '~/.gitignore'

echo "    Done."
