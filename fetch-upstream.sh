#!/bin/bash
#Make sure you have set remote or ignore errors if you have done it before
git remote add upstream git@github.com:janpekar/sandbox-container.git >/dev/null 2>&1 || true
#Fetch upstream
git fetch upstream
#Switch to our master
git checkout master
#Merge changes
git merge upstream/master -m "Automerge upstream"
#Push to our repo
git push
