#!/bin/bash

# Check if duti is installed
if ! command -v duti &> /dev/null; then
    echo "duti not found. Install with: brew install duti"
    exit 1
fi

# Check if MacVim is installed
if [ ! -d "/Applications/MacVim.app" ]; then
    echo "MacVim not found at /Applications/MacVim.app"
    exit 1
fi

echo "Setting up file associations..."

# Shell scripts with extensions
duti -s org.vim.MacVim public.shell-script all
echo "✓ Shell scripts (.sh, .bash, etc.)"

# Extensionless executables (shell scripts without extensions)
duti -s org.vim.MacVim public.unix-executable all
echo "✓ Unix executables (extensionless shell scripts)"

# Add more as needed
# duti -s org.vim.MacVim public.plain-text all
# duti -s org.vim.MacVim public.data all

echo "File associations configured!"
