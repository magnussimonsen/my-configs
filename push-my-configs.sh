#!/bin/bash

cd ~/repos/my-configs

if [[ ! -d .git ]]; then
  echo "This is not a git repository. Please check your repo location."
  exit 1
fi

# Check if a commit message was provided as an argument
# If no argument is provided, set the default commit message
COMMIT_MESSAGE="${1:-Backup config files}"

git add .
git commit -m "$COMMIT_MESSAGE"
git push

