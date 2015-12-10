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

echo '-----'

echo 'after setup ruby, gem install tmuxinator'


