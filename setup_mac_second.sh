#!/bin/sh

cd ~
mkdir src bin pkg log vm

# copy fonts
cp -f ~/Dropbox/dev_setting/fonts/scp-powerline/*.otf ~/Library/Fonts/
fc-cache -vf

mkdir .git_template
mkdir .git_template/hooks

echo '[ "$(git rev-parse --abbrev-ref HEAD)" = "master" ] && echo "You cant push the master branch to the remote" && exit 1 \n
exit 0' > ~/.git_template/hooks/pre-push

chmod 775 pre-push


echo 'Do `sudo vi /etc/shells` and add /usr/local/bin/zsh to endline'
echo 'then do `chsh -s /usr/local/bin/zsh`'


echo '-----'

echo 'add `[ghq] root = ~/src` to ~/.gitconfig'


# [user]
#   name = tatsuroro
#   email = tatsuro.nakamura@kaizenplatform.com
#
# [ghq]
#   root = ~/src
#
# [push]
#   default = current
#
# [rebase]
#   autosquash = true
#
# [color]
#   ui = true
#
# [pager]
#   log = diff-highlight | less -r
#   show = diff-highlight | less -r
#   diff = diff-highlight | less -r
#

### add gitconfig options
### below : link diff-highlight command to PATH
# ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin

echo '-----'

echo 'after setup ruby, exec `gem install tmuxinator`'
