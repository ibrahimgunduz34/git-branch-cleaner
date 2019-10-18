#!/bin/bash
set -x &&\
mkdir $1 &&\
cd $1 &&\
git init &&\
touch readme.md &&\
git add .  &&\
git commit -m 'initial commit' &&\
git checkout -b task1 -t master &&\
echo "one\ntwo\nthree" > readme.md &&\
git add .  &&\
git commit -m 'task1: first change' &&\
echo "one\nthree\ntwo" > readme.md &&\
git add .  &&\
git commit -m 'task1: some revision' &&\
echo "two\nthree\n" > readme.md &&\
git add .  &&\
git commit -m 'task1: some other revisions' &&\
git checkout -b task2 -t master &&\
echo "one\ntwo\nthree" > readme.md &&\
git add .  &&\
git commit -m 'task2: first change' &&\
echo "two\nthree\n" > readme.md &&\
git add .  &&\
git commit -m 'task2: some other revisions' &&\
echo "one\nthree\ntwo" > readme.md &&\
git add .  &&\
git commit -m 'task2: some revision' &&\
git checkout master &&\
git checkout -b dev -t master &&\
git merge --no-ff --no-edit task1 &&\
git merge --no-ff --no-edit -X theirs task2 &&\
git checkout task1 &&\
echo "one\ntwo\nthree" > readme.md &&\
git add .  &&\
git commit -m 'task1: revision #1' &&\
git checkout dev
git merge --no-ff --no-edit -X theirs task1 &&\
git checkout task1 &&\
echo "one\nthree\ntwo" > readme.md &&\
git add .  &&\
git commit -m 'task1: revision #2' &&\
git checkout dev &&\
git merge --no-ff --no-edit -X ours task1 &&\
git checkout task1 &&\
git merge --no-ff --no-edit dev &&\
git checkout dev &&\
git merge --no-ff --no-edit task2 &&\
git checkout task1 &&\
echo "one\nthree\ntwoooo" > readme.md &&\
git add .  &&\
git commit -m 'task1: revision #3' &&\
git checkout dev &&\
git merge --no-ff --no-edit task1 &&\
git checkout task1 &&\
git merge --no-ff --no-edit dev