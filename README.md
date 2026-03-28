# dotfiles

## Installation

### Prerequisites

新しいマシンでは、まず Homebrew と 1Password CLI をインストールしてログインする:

```sh
# Homebrew をインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 1Password CLI をインストール
brew install --cask 1password-cli

# 1Password CLI にログイン (chezmoi が 1Password のシークレットを参照するため必要)
op signin
```

### Setup

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply tatsuroro
```
