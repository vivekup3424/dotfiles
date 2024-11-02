#!/bin/bash
# Install Git if not installed
if ! command -v git &> /dev/null
then
    echo "Installing Git..."
    sudo apt install git -y
else 
    echo "Git is already installed."
fi

# Get current git user details (if available)
git_user_name=$(git config --global user.name)
git_user_email=$(git config --global user.email)

if [ -z "$git_user_name" ] || [ -z "$git_user_email" ]; then
    echo "Git user details not set. Please configure them:"
    
    # Prompt the user for name and email
    read -p "Enter your Git user.name: " git_user_name
    read -p "Enter your Git user.email: " git_user_email

    # Set the git user details globally
    git config --global user.name "$git_user_name"
    git config --global user.email "$git_user_email"
    
    echo "Git user details configured successfully."
else
    echo "Git user.name is set to: $git_user_name"
    echo "Git user.email is set to: $git_user_email"
fi

# Install Homebrew if not installed
if ! command -v brew &> /dev/null
then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Install stow if not installed
if ! brew list stow &> /dev/null
then
    echo "Installing GNU Stow..."
    brew install stow
else
    echo "GNU Stow is already installed."
fi

# Install go-glow if not installed
if ! brew list glow &> /dev/null
then
    echo "Installing go-glow..."
    brew install glow
else
    echo "go-glow is already installed."
fi

# Install tmux if not installed
if ! brew list tmux &> /dev/null
then
    echo "Installing tmux..."
    brew install tmux
else
    echo "TMUX is already installed."
fi

# Install fzf if not installed
if ! brew list fzf &> /dev/null
then
    echo "Installing fzf..."
    brew install fzf
else
    echo "fzf is already installed."
fi

# Install ripgrep if not installed
if ! brew list ripgrep &> /dev/null
then
    echo "Installing ripgrep..."
    brew install ripgrep
else
    echo "RipGrep is already installed."
fi

# Installing neovim
if ! brew list neovim &> /dev/null
then
    echo "Installing neovim..."
    brew install neovim
else
    echo "Neovim is already installed."
fi

# Reminder for manual installations
echo "Remember to manually install VSCode and sync dotfiles from your GitHub repository."

# Install NVM (Node Version Manager) if not installed
if ! command -v nvm &> /dev/null
then
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
else
    echo "NVM is already installed. Please manually select a node version."
    echo "Refer to NVM docs: https://github.com/nvm-sh/nvm#usage"
fi

# Installing tree
if ! brew list tree &> /dev/null
then
    echo "Installing tree..."
    brew install tree
else
    echo "Tree is already installed."
fi

#replace the original gnome-terminal settings with my own
dconf load /org/gnome/terminal/ < ~/dotfiles/gnome-terminal-settings.dconf
dconf read /org/gnome/terminal/

setting up obsidian
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.7.4/Obsidian-1.7.4.AppImage
sudo chmod +x Obsidian-1.7.4.AppImage
sudo mv Obsidian-1.7.4.AppImage /usr/bin/
sudo apt install manpages-dev #install man pages for development libraries
