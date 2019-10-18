#!/bin/bash
set -x &&\
cd $1 &&\
git checkout -b $2_cleaned -t $2 &&\
git reset --hard $(git merge-base master $2)  &&\
git log $(git merge-base master $2)..$2 --first-parent --oneline --no-merges --reverse --format="%H"|xargs git cherry-pick

