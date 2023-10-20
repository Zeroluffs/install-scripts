#!/bin/bash

# Open .zshrc file with Neovim
nvim ~/.zshrc

# Check if Neovim exited with a non-zero status (user quit without saving)
if [ $? -eq 0 ]; then
    # Replace the line containing "plugins=(git)" with the desired plugins
    sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete zsh-vi-mode)/' ~/.zshrc

    echo "Updated the .zshrc file with the new plugins. Please restart your shell to start using Zsh with the updated plugins."
else
    echo "Neovim was closed without saving changes. No modifications were made to .zshrc."
fi

