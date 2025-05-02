#!/bin/bash

# Define the branch to work on
BRANCH="main"

# Fetch latest changes
git fetch

# Check if local and remote are different
LOCAL=$(git rev-parse "$BRANCH")
REMOTE=$(git rev-parse "origin/$BRANCH")

if [ "$LOCAL" != "$REMOTE" ]; then
    echo "🔄 Local branch is behind remote. Attempting to pull latest changes..."
    git pull origin "$BRANCH"
    
    # Check if merge conflicts occurred
    if [ $? -ne 0 ]; then
        echo "❌ Merge conflicts detected! Please resolve them manually before continuing."
        exit 1
    fi
    
    # Check for unresolved conflicts (files containing conflict markers)
    if git ls-files -u | grep .; then
        echo "❌ Merge conflicts still exist in files. Resolve them first!"
        exit 1
    fi
    
    echo "✅ Pull completed without conflicts."
else
    echo "✅ Local branch is up to date with remote."
fi

# Prompt for commit message
read -p "Enter commit message: " COMMIT_MSG

# Add all changes
git add .

# Check if there is anything to commit
if git diff --cached --quiet; then
    echo "⚡ No changes to commit."
else
    git commit -m "$COMMIT_MSG"
fi

# Push to the branch
git push origin "$BRANCH"

# Confirmation message
echo "✅ Changes pushed successfully!"
