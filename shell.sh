#!/bin/bash

echo "+++ Activate fish shell"

sudo sh -c "echo '/usr/local/bin/fish' >> /etc/shells"
chsh -s /usr/local/bin/fish

echo "+++ Install Fisherman"
curl -Lo $HOME/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fisher
fisher up
