#!/usr/bin/env zsh

# Script to exclude directories from Spotlight indexing
# Can be run as a macOS launch agent

# Define patterns to ignore (directory names)
IGNORE_PATTERNS=(
  "node_modules"
  ".git"
  ".pnpm-store"
  ".yarn"
  "target"
  ".rbenv"
  "vendor"
)

SEARCH_ROOT="${SEARCH_ROOT:-$HOME/code}"
LOG_FILE="${LOG_FILE:-$HOME/Library/Logs/spotlight-ignore.log}"

# Ensure log directory exists
mkdir -p "$(dirname "$LOG_FILE")" 2>/dev/null || true

log_message() {
  local message="[$(date '+%Y-%m-%d %H:%M:%S')] $1"
  echo "$message" >> "$LOG_FILE" 2>/dev/null || true
}

log_message "Starting Spotlight ignore script for patterns: ${IGNORE_PATTERNS[*]}"

# Process each ignore pattern
for pattern in "${IGNORE_PATTERNS[@]}"; do
  log_message "Processing pattern: $pattern"
  
  # Find all directories matching the pattern and set mdignore attribute
  /usr/bin/find "$SEARCH_ROOT" -type d -name "$pattern" -print0 2>/dev/null | \
  while IFS= read -r -d '' dir; do
    # Set the mdignore attribute to exclude from Spotlight
    if xattr -w com.apple.metadata:mdignore "1" "$dir" 2>/dev/null; then
      log_message "Excluded from Spotlight: $dir"
    else
      log_message "Failed to exclude: $dir"
    fi
  done
done

log_message "Spotlight ignore script completed"