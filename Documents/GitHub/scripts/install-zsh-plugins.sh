#!/bin/bash

# Check if Homebrew is installed on macOS
if [[ "$(uname -s)" == "Darwin" ]] && [[ -x $(command -v brew) ]]; then
    echo "macOS detected. Using Homebrew to install Zsh and plugins..."
    brew update
    brew install zsh zsh-autosuggestions zsh-syntax-highlighting

    # Set Zsh as the default shell
    if [ -z "$(grep -F '/usr/local/bin/zsh' /etc/shells)" ]; then
        echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
    fi
    chsh -s /usr/local/bin/zsh

    # Clone Zsh Autocomplete plugin
    echo "Cloning Zsh Autocomplete plugin..."
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

    # Clone Zsh Vi Mode plugin
    echo "Cloning Zsh Vi Mode plugin..."
    git clone --depth 1 -- https://github.com/jeffreytse/zsh-vi-mode.git $ZSH_CUSTOM/plugins/zsh-vi-mode

    # Update the .zshrc file with the new plugins

    echo "Zsh, Zsh Autosuggestions, Zsh Syntax Highlighting, Zsh Autocomplete, and Zsh Vi Mode have been installed on macOS. Please restart your shell to start using Zsh with the new plugins."
elif [[ -x $(command -v apt) ]]; then
    echo "Debian-based system detected. Installing Zsh, Zsh Autosuggestions, Zsh Syntax Highlighting, Zsh Autocomplete, and Zsh Vi Mode..."
    sudo apt update
    sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting

    # Set Zsh as the default shell
    chsh -s $(command -v zsh)

    # Clone Zsh Autocomplete plugin
    echo "Cloning Zsh Autocomplete plugin..."
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

    # Clone Zsh Vi Mode plugin
    echo "Cloning Zsh Vi Mode plugin..."
    git clone --depth 1 -- https://github.com/jeffreytse/zsh-vi-mode.git $ZSH_CUSTOM/plugins/zsh-vi-mode

    # Update the .zshrc file with the new plugins

elif [[ -x $(command -v pacman) ]]; then
    echo "Arch-based system detected. Installing Zsh, Zsh Autosuggestions, Zsh Syntax Highlighting, Zsh Autocomplete, and Zsh Vi Mode..."
    sudo pacman -Syu
    sudo pacman -S zsh zsh-autosuggestions zsh-syntax-highlighting

    # Set Zsh as the default shell
    chsh -s $(command -v zsh)

    # Clone Zsh Autocomplete plugin
    echo "Cloning Zsh Autocomplete plugin..."
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

    # Clone Zsh Vi Mode plugin
    echo "Cloning Zsh Vi Mode plugin..."
    git clone --depth 1 -- https://github.com/jeffreytse/zsh-vi-mode.git $ZSH_CUSTOM/plugins/zsh-vi-mode

    # Update the .zshrc file with the new plugins


else
    echo "Unsupported system. Please install Zsh, Zsh Autosuggestions, Zsh Syntax Highlighting, Zsh Autocomplete, and Zsh Vi Mode manually."
    exit 1
fi

