balias sudo "sudo "
balias v nvim
balias vi nvim
balias nv nvim
balias sed gsed
balias tm tmux
balias mux tmuxinator

balias ls exa
balias ll "exa -GaF"
balias la "ls -la"

balias cat bat

# utils
balias vims "vim (git diff --name-only)"
balias vimt "vim -p (git diff --name-only)"
balias wifiConnect "networksetup -setairportpower en0 off && networksetup -setairportpower en0 on"

# enable cd in the terminal that has executed ghq-init
balias ghq-init "source ~/sh/ghq-init"

# git
balias g git
balias gst "git status"
balias ga "git add"

balias gb "git branch"
balias gba "git branch -a"
balias gbd "git branch -d"
balias gbl "git blame -b -w"
balias gbnm "git branch --no-merged"

balias gbr "fzf_git_branch_checkout"

balias gc "git commit -v"
balias gc! "git commit -v --amend"
balias gcn! "git commit -v --no-edit --amend"
balias gca "git commit -v -a"
balias gca! "git commit -v -a --amend"

balias gcb "git checkout -b"
balias gcm "git checkout master"
balias gcd "git checkout develop"
balias gco "git checkout"

balias gd "git diff"
balias gdca "git diff --cached"

balias gf "git fetch"
balias gfa "git fetch --all --prune"
balias gfo "git fetch origin"

balias gl "git pull"

balias gm "git merge"
balias gmom "git merge origin/master"

balias gp "git push"
balias gpd "git push --dry-run"

balias gr "git remote"
balias gra "git remote add"

balias grb "git rebase"
balias grba "git rebase --abort"
balias grbc "git rebase --continue"
balias grbi "git rebase -i"
balias grbm "git rebase master"

balias gsta "git stash save"
balias gstaa "git stash apply"
balias gstc "git stash clear"
balias gstd "git stash drop"
balias gstl "git stash list"
balias gstp "git stash pop"
balias gsts "git stash show --text"

balias gfx "git fixup"
balias gbra "git branch-list"
