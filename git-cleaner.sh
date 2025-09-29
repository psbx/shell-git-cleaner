#!/usr/bin/env bash
set -euo pipefail

git fetch --all --prune
current=$(git branch --show-current)

git branch --merged | sed "s/^..//" | while read -r branch; do
  case "$branch" in
    "$current"|"main"|"master"|"dev")
      continue
      ;;
  esac
  echo "Deleting $branch"
  git branch -d "$branch"
done

echo "Current branch: $current"
