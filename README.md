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
# 1. dotfiles を展開
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply tatsuroro

# 2. 初期セットアップ (全ステップ実行)
setup all
```

個別にステップを実行する場合:

```sh
setup list              # ステップ一覧
setup run xcode         # Xcode CLI Tools
setup run macos         # macOS defaults
setup run homebrew      # Homebrew + パッケージ
setup run git           # Git 設定
setup run vim           # Vim プラグイン
setup run shell         # デフォルトシェル変更
```

## Dev Sessions

開発プロセスを tmux で管理する:

```sh
dev-session start       # tmux セッション起動
dev-session attach      # アタッチ (ターミナル再起動後はこれだけ)
dev-session restart     # セッション再作成
dev-session stop        # 停止
```

設定: `~/.config/dev-sessions.yml`
