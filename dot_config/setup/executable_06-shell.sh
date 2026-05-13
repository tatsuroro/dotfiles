#!/bin/sh
set -e
echo "==> Changing default shell to zsh"

if [ ! -x /opt/homebrew/bin/zsh ]; then
  echo "    WARNING: /opt/homebrew/bin/zsh not found, skipping."
  exit 0
fi

if ! grep -q '/opt/homebrew/bin/zsh' /etc/shells; then
  echo "    Adding /opt/homebrew/bin/zsh to /etc/shells (requires sudo)"
  sudo sh -c "echo '/opt/homebrew/bin/zsh' >> /etc/shells"
fi

chsh -s /opt/homebrew/bin/zsh

echo "    Done."
