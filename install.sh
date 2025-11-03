#!/bin/bash

set -e

here=$(dirname $0)
if [[ $here == "." ]]; then
   here=$(pwd)
fi

echo "🔧 Dotfiles Installation Script"
echo "==============================="

# Function to ask yes/no questions
ask() {
    local prompt="$1"
    local default="${2:-n}"
    local response
    
    if [[ $default == "y" ]]; then
        prompt="$prompt [Y/n]: "
    else
        prompt="$prompt [y/N]: "
    fi
    
    read -p "$prompt" response
    response=${response:-$default}
    [[ $response =~ ^[Yy]$ ]]
}

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew not found"
    if ask "Install Homebrew?" y; then
        echo "📦 Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        echo "⚠️  Skipping Homebrew installation"
    fi
else
    echo "✅ Homebrew found"
fi

# Install brew packages
if command -v brew &> /dev/null && [[ -f "${here}/Brewfile" ]]; then
    if ask "Install packages from Brewfile?" y; then
        echo "📦 Installing brew packages..."
        brew bundle install --file="${here}/Brewfile"
    else
        echo "⚠️  Skipping package installation"
    fi
fi

# Backup and link dotfiles
echo ""
echo "🔗 Setting up dotfiles..."

files=(
    ".profile"
    ".vimrc" 
    ".zshrc"
)

dirs=(
    "vim:.vim"
    "config:.config"
    "config/git/git:.gitconfig"
    "config/gtnexus-dev:.gtnexus-dev"
)

# Handle files
for file in "${files[@]}"; do
    target="$HOME/$file"
    source_file="${here}/$file"
    
    if [[ -e "$target" && ! -L "$target" ]]; then
        if ask "Backup existing $file?" y; then
            mv "$target" "${target}.backup.$(date +%Y%m%d_%H%M%S)"
            echo "  📋 Backed up $file"
        else
            rm -f "$target"
        fi
    elif [[ -L "$target" ]]; then
        rm -f "$target"
    fi
    
    ln -s "$source_file" "$target"
    echo "  🔗 Linked $file"
done

# Handle directories and special cases
for mapping in "${dirs[@]}"; do
    source_dir="${mapping%:*}"
    target_name="${mapping#*:}"
    target="$HOME/$target_name"
    source_path="${here}/$source_dir"
    
    if [[ -e "$target" && ! -L "$target" ]]; then
        if ask "Backup existing $target_name?" y; then
            mv "$target" "${target}.backup.$(date +%Y%m%d_%H%M%S)"
            echo "  📋 Backed up $target_name"
        else
            rm -rf "$target"
        fi
    elif [[ -L "$target" ]]; then
        rm -f "$target"
    fi
    
    ln -s "$source_path" "$target"
    echo "  🔗 Linked $target_name"
done

# Link bash files to profile
for bash_file in ".bashrc" ".bash_login" ".bash_profile"; do
    target="$HOME/$bash_file"
    if [[ -e "$target" && ! -L "$target" ]]; then
        rm -f "$target"
    fi
    ln -s "${here}/.profile" "$target"
    echo "  🔗 Linked $bash_file -> .profile"
done

# Setup file associations
if [[ -f "${here}/setup-file-associations.sh" ]]; then
    if ask "Setup file associations?" y; then
        echo "📁 Setting up file associations..."
        bash "${here}/setup-file-associations.sh"
    else
        echo "⚠️  Skipping file associations"
    fi
fi

echo ""
echo "✅ Installation complete!"
echo "🔄 Restart your terminal or run: source ~/.zshrc"
