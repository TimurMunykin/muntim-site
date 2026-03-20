#!/usr/bin/env bash
set -euo pipefail

FILE="index.html"

if ! grep -q "Timur Munykin" "$FILE"; then
  echo "Missing name"
  exit 1
fi

if ! grep -q "projects/" "$FILE"; then
  echo "Missing projects section"
  exit 1
fi

if ! grep -q "skills.txt" "$FILE"; then
  echo "Missing skills section"
  exit 1
fi

if ! grep -q "links.txt" "$FILE"; then
  echo "Missing links section"
  exit 1
fi

if ! grep -q "https://bloodyssey.muntim.ru/" "$FILE"; then
  echo "Missing Bloodyssey link"
  exit 1
fi

if ! grep -q "https://github.com/TimurMunykin" "$FILE"; then
  echo "Missing GitHub link"
  exit 1
fi

echo "Smoke checks passed"
