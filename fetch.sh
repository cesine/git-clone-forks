#!/bin/bash

set -x

upstream=$1

repo=~/Downloads/temp-repo
remotes=`pwd`"/forks.txt"

echo "Local Repo $repo"
echo "Remotes $remotes"

mkdir $repo
cd $repo
git log -1 || git init

git remote add upstream $upstream
git fetch upstream
git branch -r -l upstream/*
pwd
git checkout master
git pull upstream master
git log -1
while IFS= read -r line
do
  vars=( $line )
  forKUser=${vars[1]}
  forkRepo=${vars[3]}
  forkRemote="https://github.com/${forKUser}/${forkRepo}.git"
  echo "Fetching from ${forkRemote}"
  git remote add $forKUser $forkRemote
  git fetch $forKUser
  git branch -r -l $forKUser/*
done < "$remotes"

echo "Total branches fetched"
git branch -a | wc -l
git log --graph --pretty=oneline --abbrev-commit
