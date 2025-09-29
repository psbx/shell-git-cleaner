#!/usr/bin/env bash
set -euo pipefail
git fetch --all --prune
CURRENT=$(git branch --show-current)
for b in $(git branch --merged | egrep -v "(^\*|main|master|dev)"); do
  echo "Deleting $b"
  git branch -d "$b"
done
echo "Current branch: $CURRENT"
