#!/bin/sh

# Version Control
# Distributed VC
# Advantages of DVC and Git

# Structure of git (.git, sha1, blob, etc.)
# Object types (blob, tree, commit, tag (HEAD,branch))
# Layers (working tree, staging area, repo, remote)
# working tree -> "checked out" files to work on
# staging area -> "limbo" to get files into a commit
# commit -> a node in the repository tree
# repo -> a tree of commits linked together
# tag -> a pointer to a commit

# How to get git manpages

# Configure Git
git config --global user.name "Your Name Here"
git config --global user.email "your_email@youremail.com"

# Turn folder into git repo
mkdir repo1
cd repo1
git init

echo "This is in the file" > file1

# Check status of index
git status
git status -s

# Add files to the index
git add file1

# Move files from index to repo
# git commit
#git commit -a
git commit -m "first commit of repo"

echo "This is also in the file" >> file1
git status -s
git add file1
git status -s
git commit -m "updated file1"

# View log
git log

# Checkout command (detached head)
git checkout `git log --pretty=format:%H | tail -1`
cat file1
git checkout master

# Diff
git diff file1
git diff `git log --pretty=format:%H | tail -1` file1
git diff HEAD~1 file1

# Branching
git branch
git branch feature1
git branch
git checkout feature1
git branch

echo "Yet another thing in this file" >> file1
echo "Stuff in a new file" > file2

git status -s
git add file1
git add file2
git commit -m "new file and updated previous file"

git log

git checkout master
git branch

# Merging

git log
git merge feature1
git branch -d feature1
git branch

# Cloning

cd ../
git clone repo1 repo2
cd repo2
git log

# Pulling from remote

cd ../repo1
echo "Yet another line in a file" > file3
git status -s
git add file3
git commit -m 'a third file added to the project'
git log


cd ../repo2
git log
git pull

# Adding a remote
cd ../repo1
git remote add child ../repo2
git pull child master

# git push

# Off to github

# Tagging

git tag
git tag -a  v2.0 -m 'Version 2.0'
git tag 

git tag -a v1.0 -m 'Version 1.0' `git log --pretty=format:%H | tail -2 | head -1`
git diff v1.0 v2.0
git diff v1.0 file1

# Git GUI


# Cleanup
cd ../
rm -rf repo1 repo2
