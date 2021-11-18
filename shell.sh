#!/bin/bash

echo "+++ Activate fish shell"

sudo sh -c "echo '/opt/homebrew/bin/fish' >> /etc/shells"
chsh -s /opt/homebrew/bin/fish
