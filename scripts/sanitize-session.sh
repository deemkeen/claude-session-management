#!/bin/bash
# Sanitize session export by removing local machine details

INPUT_FILE="$1"
OUTPUT_FILE="$2"

if [ -z "$INPUT_FILE" ] || [ -z "$OUTPUT_FILE" ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file not found: $INPUT_FILE"
    exit 1
fi

# Get common paths to sanitize
USER_HOME="$HOME"
USER_NAME="$(whoami)"
HOSTNAME="$(hostname)"
CURRENT_DIR="$(pwd)"

# Create temporary file
TEMP_FILE=$(mktemp)

# Sanitize the file
cat "$INPUT_FILE" | \
    sed "s|$USER_HOME|/home/user|g" | \
    sed "s|$CURRENT_DIR|/workspace/project|g" | \
    sed "s|$USER_NAME|user|g" | \
    sed "s|$HOSTNAME|machine|g" | \
    sed "s|/home/[^/]*/|/home/user/|g" | \
    sed "s|/Users/[^/]*/|/Users/user/|g" > "$TEMP_FILE"

# Move sanitized content to output file
mv "$TEMP_FILE" "$OUTPUT_FILE"

echo "Sanitized session saved to: $OUTPUT_FILE"
