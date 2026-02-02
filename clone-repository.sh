#!/bin/bash

# Script to clone a repository using an access token
# Usage: ./clone-repository.sh [REPO_URL]

# Configuration
REPO_URL="${REPO_URL:-builder.kiloapps.io/apps/bf0c83fb-786b-4568-a690-208accd8ceaf.git}"
# Allow overriding REPO_URL via command-line argument
if [ -n "$1" ]; then
    REPO_URL="$1"
fi
CLONE_DIR="${CLONE_DIR:-cloned-repo}"

# Check if ACCESS_TOKEN environment variable is set
if [ -z "$ACCESS_TOKEN" ]; then
    echo "Error: ACCESS_TOKEN environment variable is not set"
    echo "Please set it using: export ACCESS_TOKEN=your_token_here"
    exit 1
fi

# Clone the repository using the access token
echo "Cloning repository from $REPO_URL..."
if git clone "https://x-access-token:${ACCESS_TOKEN}@${REPO_URL}" "$CLONE_DIR"; then
    echo "Repository cloned successfully to $CLONE_DIR"
else
    echo "Failed to clone repository"
    exit 1
fi
