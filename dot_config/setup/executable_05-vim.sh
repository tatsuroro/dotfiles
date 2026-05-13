#!/bin/sh
set -e
echo "==> Installing Vim plugins"

vim +PlugInstall +qal || echo "    WARNING: vim PlugInstall failed, run manually later"

echo "    Done."
