# 🏠 Dotfiles

Personal configuration files and development environment setup for macOS.

## 🚀 Quick Start

```bash
git clone <this-repo> ~/.dots
cd ~/.dots
./install.sh
```

The interactive installer will:
- Install Homebrew (if needed)
- Install packages from Brewfile
- Backup existing configs
- Create symlinks to dotfiles
- Setup file associations

## 📦 What's Included

### Shell Configuration
- **Zsh** - Custom prompt with git status
- **Aliases** - Useful shortcuts and commands
- **Functions** - Custom shell functions
- **Git integration** - Enhanced git prompt and completions

### Development Tools
- **Vim** - Configured text editor
- **Git** - Version control settings
- **Homebrew** - Package management via Brewfile

### Applications
See `Brewfile` for the complete list of installed packages including:
- Development tools (git, maven, gradle, go)
- Utilities (duti, ffmpeg, rclone)
- GUI apps (VS Code, IntelliJ, DBeaver)

## 🔧 Manual Setup

Individual components can be linked manually:

```bash
# Core dotfiles
ln -s ~/.dots/.zshrc ~/.zshrc
ln -s ~/.dots/.vimrc ~/.vimrc
ln -s ~/.dots/config ~/.config

# Install packages
brew bundle install --file=~/.dots/Brewfile

# Setup file associations
./setup-file-associations.sh
```

## 📁 Structure

```
.dots/
├── .zshrc              # Zsh configuration
├── .vimrc              # Vim configuration  
├── .profile            # Shell profile
├── aliases             # Command aliases
├── functions           # Custom functions
├── Brewfile            # Homebrew packages
├── install.sh          # Interactive installer
├── bin/                # Custom scripts
├── config/             # Application configs
├── vim/                # Vim plugins/settings
└── zsh/                # Zsh modules
```

## 🎨 Features

- **Interactive installer** with backup options
- **Git-aware prompt** with status indicators
- **Custom aliases** for common tasks
- **File associations** for development files
- **Modular zsh config** (colors, completion, git, prompt)
- **Cross-shell compatibility** (bash/zsh)
