# git-clone-forks

Fetch branches from forks to local.


## Instructions

Get the list of forks and add them to a forks.txt file. You can use the Github api, or a copy paste from https://github.com/org/repo/network/members page that is sorted and contains only the forks list.

Run the script

```bash
$ ./fetch.sh git@github.com:org/repo.git >> branches.log
