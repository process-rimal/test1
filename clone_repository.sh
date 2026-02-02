#!/bin/bash

# Git Repository Clone Script
# This script demonstrates how to clone a git repository with authentication

set -e

# Function to display usage
usage() {
    echo "Usage: $0 <git-url> [destination-directory]"
    echo ""
    echo "Examples:"
    echo "  $0 https://github.com/user/repo.git"
    echo "  $0 https://x-access-token:TOKEN@builder.example.com/apps/app-id.git my-app"
    echo ""
    echo "Note: For security, avoid hardcoding tokens in scripts."
    echo "      Use environment variables or secure credential managers instead."
    exit 1
}

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    usage
fi

GIT_URL="$1"
DEST_DIR="${2:-}"

# Function to mask credentials in URL for display
mask_url() {
    local url="$1"
    # Check if URL contains credentials (username:password@)
    if [[ "$url" =~ .*://[^@]+@.* ]]; then
        # Extract protocol and rest of URL
        local protocol="${url%%://*}"
        local rest="${url#*://}"
        local host_path="${rest#*@}"
        echo "${protocol}://***:***@${host_path}"
    else
        echo "$url"
    fi
}

# Clone the repository
if [ -z "$DEST_DIR" ]; then
    echo "Cloning repository from: $(mask_url "$GIT_URL")"
    git clone "$GIT_URL"
else
    echo "Cloning repository from: $(mask_url "$GIT_URL") to $DEST_DIR"
    git clone "$GIT_URL" "$DEST_DIR"
fi

echo "Repository cloned successfully!"
