## how to save your shell to a repo ##


[check out this tutorial](https://www.digitalocean.com/community/tutorials/how-to-use-git-to-manage-your-user-configuration-files-on-a-linux-vps)

the gist of it

mkdir configs
cd configs

git init

git config core.worktree "../../"

on your new computer:

git clone --no-checkout http://git_lab_ip/your_gitlab_user/configs.git

cd configs
git config core.worktree "../../"

git reset --hard origin/master

There are a couple of repos that need to be fetched for Vim
I threw them into the ~/bin/setup.sh script
