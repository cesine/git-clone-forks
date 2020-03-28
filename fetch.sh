#!/bin/bash

set -x

upstream=$1

repo=~/Downloads/temp-repo
remotes="./forks.txt"


echo "Local Repo $repo"

echo "Remotes $remotes"

while IFS= read -r line
do
  echo "$line"
done < "$remotes"
