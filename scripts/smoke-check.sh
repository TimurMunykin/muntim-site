#!/usr/bin/env bash
set -euo pipefail

FILE="site/index.html"

if ! grep -q "Hero" "$FILE"; then
  echo "Missing Hero section"
  exit 1
fi

if ! grep -q "Projects" "$FILE"; then
  echo "Missing Projects section"
  exit 1
fi

if ! grep -q "About" "$FILE"; then
  echo "Missing About section"
  exit 1
fi

if ! grep -q "Contacts" "$FILE"; then
  echo "Missing Contacts section"
  exit 1
fi

if ! grep -q "Lorem ipsum" "$FILE"; then
  echo "Missing placeholder text"
  exit 1
fi

if ! grep -q "https://bloodyssey.muntim.ru/" "$FILE"; then
  echo "Missing Bloodyssey link"
  exit 1
fi

echo "Smoke checks passed"
