#!/bin/bash

# This script downloads Godot for macOS and installs the export templates.
# It sets up the environment variable GODOT_EXE pointing to the Godot binary.

# Take Godot version as first argument
GODOT_VERSION="$1"

# ------------------------------
# Download Godot binary
# ------------------------------
echo "Downloading Godot $GODOT_VERSION..."
wget "https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION}-stable/Godot_v${GODOT_VERSION}-stable_macos.universal.zip" -O godot-mac.zip
unzip -q godot-mac.zip -d godot
chmod +x godot/Godot.app/Contents/MacOS/Godot

# ------------------------------
# Download and install export templates
# ------------------------------
echo "Downloading export templates..."
wget "https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION}-stable/Godot_v${GODOT_VERSION}-stable_export_templates.tpz" -O export_templates.tpz

TEMPLATE_DIR="$HOME/Library/Application Support/Godot/export_templates/${GODOT_VERSION}.stable"
mkdir -p "$TEMPLATE_DIR"
unzip -q export_templates.tpz -d "$TEMPLATE_DIR"

# Move templates to the expected paths
mv "$TEMPLATE_DIR/templates/macos.zip" "$TEMPLATE_DIR/macos.zip"
mv "$TEMPLATE_DIR/templates/windows_release_x86_64.exe" "$TEMPLATE_DIR/windows_release_x86_64.exe"
mv "$TEMPLATE_DIR/templates/windows_debug_x86_64.exe" "$TEMPLATE_DIR/windows_debug_x86_64.exe"

# List installed templates
echo "Installed templates:"
ls -l "$TEMPLATE_DIR"

# ------------------------------
# Set GODOT_EXE environment variable
# ------------------------------
echo "Setting GODOT_EXE environment variable..."
echo "GODOT_EXE=$(pwd)/godot/Godot.app/Contents/MacOS/Godot" >> $GITHUB_ENV

echo "Godot $GODOT_VERSION installation completed."
