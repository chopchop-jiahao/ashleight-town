#!/bin/bash

# ----------------------------
# Set the file path
# ----------------------------
VERSION_FILE="project.godot"

# ----------------------------
# Set regex pattern (macOS compatible)
# ----------------------------
VERSION_REGEX='config/version=[0-9A-Za-z.-]+'

# ----------------------------
# Extract the version number
# ----------------------------
VERSION=$(grep -Eo "$VERSION_REGEX" "$VERSION_FILE" | sed 's/config/version=//')

# ----------------------------
# Check if the version was found
# ----------------------------
if [ -z "$VERSION" ]; then
  echo "Error: version not found in $VERSION_FILE"
  exit 1
fi

# ----------------------------
# Output the version number
# ----------------------------
echo "Extracted version: $VERSION"