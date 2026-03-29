#!/bin/bash

# --- env ---
GIT_NAME=${1:-"GitHub Actions"}
GIT_EMAIL=${2:-"actions@github.com"}
COMMIT_MESSAGE=${3:-"Initial commit for testing"}

# --- setup ---
mkdir -p test-vercelkeep && cd test-vercelkeep
git init

# --- Git Config ---
echo "🔧 Configuring Git..."
git config user.name "$GIT_NAME"
git config user.email "$GIT_EMAIL"

# --- make test file ---
cat <<EOF > .vercelkeep
important.txt
keep-me.js
.vercelkeep
EOF

echo "This is a test file" > remove-me.txt
echo "Another file" > temp-file.log
touch important.txt
touch keep-me.js

# --- commit ---
echo "📂 Preparing branch ..."
git add .
git commit -m "$COMMIT_MESSAGE"

echo "✅ setup finish"

echo "====  📂  ===="
ls -la
echo "=============="
