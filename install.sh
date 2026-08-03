#!/usr/bin/env bash
#
# Dotfile Installation Helper Script for bashrc-fish
#

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install_home() {
    echo "Installing dotfiles for current user ($USER)..."
    mkdir -p ~/.config/fish/functions

    cp -v "$REPO_DIR/bash/home/bashrc" ~/.bashrc
    cp -v "$REPO_DIR/bash/home/zshrc" ~/.zshrc
    cp -v "$REPO_DIR/bash/home/fish/config.fish" ~/.config/fish/config.fish
    cp -v "$REPO_DIR/bash/home/fish/fish_variables" ~/.config/fish/fish_variables
    cp -vr "$REPO_DIR/bash/home/fish/functions/"* ~/.config/fish/functions/

    echo "User dotfiles installed successfully."
}

install_root() {
    echo "Installing dotfiles for root..."
    if [ "$EUID" -ne 0 ]; then
        echo "Root installation requires sudo permissions."
        sudo mkdir -p /root/.config/fish/functions
        sudo cp -v "$REPO_DIR/bash/root/bashrc" /root/.bashrc
        sudo cp -v "$REPO_DIR/bash/root/zshrc" /root/.zshrc
        sudo cp -v "$REPO_DIR/bash/root/fish/config.fish" /root/.config/fish/config.fish
        sudo cp -v "$REPO_DIR/bash/root/fish/fish_variables" /root/.config/fish/fish_variables
        sudo cp -vr "$REPO_DIR/bash/root/fish/functions/"* /root/.config/fish/functions/
    else
        mkdir -p /root/.config/fish/functions
        cp -v "$REPO_DIR/bash/root/bashrc" /root/.bashrc
        cp -v "$REPO_DIR/bash/root/zshrc" /root/.zshrc
        cp -v "$REPO_DIR/bash/root/fish/config.fish" /root/.config/fish/config.fish
        cp -v "$REPO_DIR/bash/root/fish/fish_variables" /root/.config/fish/fish_variables
        cp -vr "$REPO_DIR/bash/root/fish/functions/"* /root/.config/fish/functions/
    fi
    echo "Root dotfiles installed successfully."
}

case "${1:-home}" in
    home)
        install_home
        ;;
    root)
        install_root
        ;;
    all)
        install_home
        install_root
        ;;
    *)
        echo "Usage: $0 [home|root|all]"
        exit 1
        ;;
esac
