#!/bin/sh
set -e
echo "==> Installing Xcode Command Line Tools"

if xcode-select -p &>/dev/null; then
  echo "    Already installed, skipping."
  exit 0
fi

xcode-select --install
