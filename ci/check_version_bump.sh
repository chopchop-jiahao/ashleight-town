#!/bin/bash

# This script compares two version strings and verifies that the new version
# is strictly greater than the old version. If the version has not increased
# or has decreased, the script will exit with an error.

OLD_VERSION="$1"
NEW_VERSION="$2"

# Display the versions being compared
echo "Old version: $OLD_VERSION"
echo "New version: $NEW_VERSION"

# The logic below compares the two versions.
#
# printf "%s\n%s" "$OLD_VERSION" "$NEW_VERSION"
#   -> Prints both versions on separate lines.
#
# sort -V
#   -> Sorts version numbers in correct version order (not string order).
#      Example: 1.2 < 1.10, which normal string sorting gets wrong.
#
# head -n1
#   -> Takes the first (smallest) version after sorting.
#
# If the smallest version is NEW_VERSION, that means:
#   NEW_VERSION <= OLD_VERSION  (not allowed)
#   so we fail the check.

SMALLEST_VERSION=$(printf "%s\n%s" "$OLD_VERSION" "$NEW_VERSION" | sort -V | head -n1)

if [ "$SMALLEST_VERSION" = "$NEW_VERSION" ]; then
  echo "::error::Version has not increased (or it decreased). Please bump config_version."
  exit 1
fi

# If we reach this point, the new version is greater than the old version.
echo "Version bump verified"