#!/bin/bash
set -e

FOLDER=$INPUT_FOLDER
echo "FOLDER: $FOLDER"

# shellcheck disable=SC2046 disable=SC2048 disable=SC2086
if git diff --name-only HEAD^ HEAD | grep -i "^$FOLDER"; then
  echo "::set-output name=has_changes::Yes"
else
  echo "::set-output name=has_changes::No"
fi