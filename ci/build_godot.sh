#!/bin/bash

# This script builds Mac and Windows executables using Godot.
# Assumes GODOT_EXE environment variable is already set and export templates are installed.

# Take Godot version as argument to locate templates
GODOT_VERSION="$1"
TEMPLATE_DIR="$HOME/Library/Application Support/Godot/export_templates/${GODOT_VERSION}.stable"

# ------------------------------
# Build Mac executable
# ------------------------------
mkdir -p build/mac
echo "Building Mac executable..."
"$GODOT_EXE" --no-window \
  --export-release "ashleigh-town-macOS" \
  build/mac/Ashleigh-Town.app \
  --templates-path "$TEMPLATE_DIR"

# ------------------------------
# Build Windows executable
# ------------------------------
mkdir -p build/windows
echo "Building Windows executable..."
"$GODOT_EXE" --no-window \
  --export-release "ashleigh-town-windows" \
  build/windows/Ashleigh-Town.exe \
  --templates-path "$TEMPLATE_DIR"

echo "Build completed successfully."
