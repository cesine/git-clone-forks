#!/bin/bash

set -x

upstream=$1

repo=~/Downloads/temp-repo
remotes="./forks.txt"

echo "Local Repo $repo"
echo "Remotes $remotes"

mkdir $repo
cd $repo
git log -1 || git init

git remote add upstream $upstream
git fetch upstream
git branch -a

while IFS= read -r line
do
  echo "$line"
done < "$remotes"
