#!/bin/bash
clear
cd ~/repos/my-configs || {
  echo "Failed to change directory to ~/repos/my-configs. Please check the path."
  exit 1
}

echo " "
echo "--- Switched to repository directory: ~/repos/my-configs"
echo " "

if [[ ! -d .git ]]; then
  echo "--- This is not a Git repository. Please check your repo location."
  exit 1
fi

echo " "
# Check if a commit message was provided as an argument
# If no argument is provided, set the default commit message
COMMIT_MESSAGE="${1:-Backup config files}"
echo "--- Using commit message: \"$COMMIT_MESSAGE\""
echo " "

echo "--- Staging all changes..."
git add .

echo " "
echo "--- Committing changes..."
git commit -m "$COMMIT_MESSAGE"

echo " "
echo "--- Pushing to remote repository (origin/main)..."
git push -u origin main

echo " "
echo "--- Push complete!"
echo " "
