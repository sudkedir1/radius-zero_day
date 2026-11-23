#!/usr/bin/env bash

# Exit immediately if any command fails, an unset variable is used, or a pipe fails
set -euo pipefail

# B & C: Determine the target directory (use 1st argument if provided, otherwise default)
DEFAULT_DIR="$HOME/radius-projects/website-project"
TARGET_DIR="${1:-$DEFAULT_DIR}"

# Expand a leading tilde (~) if the user passed a quoted path like "~/my-site"
TARGET_DIR="${TARGET_DIR/#\~/$HOME}"

# F: Protect existing directories and files
if [[ -e "$TARGET_DIR" ]]; then
    echo "Error: Destination '$TARGET_DIR' already exists." >&2
    echo "Operation aborted to prevent overwriting or modifying existing files." >&2
    exit 1
fi

# D: Create the website directory structure
mkdir -p "$TARGET_DIR"/{css,js,images}

# E: Generate meaningful file contents using quoted heredocs ('EOF')

# 1. Root README.md
cat << 'EOF' > "$TARGET_DIR/README.md"
# Website Project

A lightweight, standards-compliant static website starter template built with HTML5, CSS3, and vanilla JavaScript.

## Project Structure

- `index.html` — Main HTML5 entry point.
- `css/` — Stylesheets controlling visual layout and typography.
- `js/` — Client-side JavaScript files for interactivity.
- `images/` — Static image assets (PNG, JPG, SVG, WebP).
EOF

# 2. index.html
cat << 'EOF' > "$TARGET_DIR/index.html"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Website Project</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <h1>Welcome to My Website</h1>
    </header>
    <main>
        <p>This project structure was automatically generated using a Bash script.</p>
    </main>
    <script src="js/script.js"></script>
</body>
</html>
EOF

# 3. css/README.md
cat << 'EOF' > "$TARGET_DIR/css/README.md"
# CSS Directory

This directory contains all Cascading Style Sheets (`.css`) used to control the visual presentation, layout, colors, and responsive behavior of the website.
EOF

# 4. css/style.css
cat << 'EOF' > "$TARGET_DIR/css/style.css"
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
    line-height: 1.6;
    color: #222222;
    background-color: #f8f9fa;
    padding: 2rem;
    max-width: 800px;
    margin: 0 auto;
}

header {
    border-bottom: 2px solid #0066cc;
    padding-bottom: 1rem;
    margin-bottom: 1.5rem;
}

h1 {
    color: #0066cc;
}
EOF

# 5. js/README.md
cat << 'EOF' > "$TARGET_DIR/js/README.md"
# JavaScript Directory

This directory holds client-side JavaScript (`.js`) files responsible for DOM manipulation, event handling, and interactive behavior across the website.
EOF

# 6. js/script.js
cat << 'EOF' > "$TARGET_DIR/js/script.js"
document.addEventListener("DOMContentLoaded", () => {
    console.log("Website project initialized successfully!");
});
EOF

# 7. images/README.md
cat << 'EOF' > "$TARGET_DIR/images/README.md"
# Images Directory

Store all static visual assets for the website in this directory, including logos, icons, photographs, and illustrations in web-friendly formats such as `.png`, `.jpg`, `.svg`, and `.webp`.
EOF

# G: Resolve and display the full path upon successful completion
FULL_PATH="$(cd "$TARGET_DIR" && pwd)"
echo "Success! Website project generated at:"
echo "$FULL_PATH"
