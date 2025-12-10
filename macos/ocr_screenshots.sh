#!/bin/bash

# Configuration
SCREENSHOT_DIR="$HOME/Documents/screenshots"
# Create a temporary file for the OCR text
TEMP_TXT="/tmp/ocr_output"

# Check if required tools are installed
if ! command -v tesseract &> /dev/null || ! command -v exiftool &> /dev/null; then
    echo "Error: tesseract and exiftool are required."
    exit 1
fi

# Find images (png/jpg) created in the last 24 hours (to avoid re-processing old ones endlessly if running via cron)
# Or simply pass a filename as an argument if using Folder Actions.

process_image() {
    local img="$1"
    
    # Skip if file usually has "OCR" in metadata already to prevent double work
    # (Optional check, but good for efficiency)
    if exiftool -UserComment "$img" | grep -q "OCR_DONE"; then
        echo "Skipping $img (Already Processed)"
        return
    fi

    echo "Processing: $img"

    # 1. Run Tesseract (OCR)
    # outputting to stdout (-) and quieting stderr
    ocr_text=$(tesseract "$img" stdout 2>/dev/null)

    # Check if OCR found text
    if [ -z "$ocr_text" ]; then
        echo "No text found in $img"
        return
    fi

    # 2. Embed text into metadata
    # We write to 'UserComment' and 'ImageDescription' for maximum compatibility.
    # We append a flag "OCR_DONE" so we know we did it.
    
    # Sanitize newlines for metadata writing if necessary, though exiftool handles them well.
    final_text="$ocr_text [OCR_DONE]"

    exiftool -overwrite_original \
             -UserComment="$final_text" \
             -ImageDescription="$final_text" \
             -IPTC:Caption-Abstract="$final_text" \
             "$img"

    echo "Metadata updated for $img"
}

# If a file argument is passed (Folder Action mode), process it.
# Otherwise, scan the directory.
if [ "$#" -gt 0 ]; then
    process_image "$1"
else
    # Loop through png files in the directory
    # You might want to restrict this to recent files to speed it up
    find "$SCREENSHOT_DIR" -name "*.png" -maxdepth 1 -print0 | while IFS= read -r -d '' file; do
        process_image "$file"
    done
fi