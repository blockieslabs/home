#!/usr/bin/env bash
# Clone the sibling repositories next to this one.
set -euo pipefail

ORG="blockieslabs"
REPOS=(docs)

cd "$(dirname "$0")/.."

for repo in "${REPOS[@]}"; do
  if [ -d "$repo/.git" ]; then
    printf '  %-10s already cloned\n' "$repo"
  else
    printf '  %-10s cloning\n' "$repo"
    git clone "https://github.com/$ORG/$repo.git" "$repo"
  fi
done

printf '\nDone. Open docs/html/index.html to start reading.\n'
