
---

# 🛠️ My Dotfiles

This repository contains my personalized dotfiles and setup scripts for configuring my development environment across machines. These dotfiles automate setting up Bash, VSCode, Neovim, and essential software to maintain consistency in my workflow.

## Table of Contents
- [Introduction](#introduction)
- [Files and Configurations](#files-and-configurations)
- [Installation](#installation)
  - [Cloning the Repo](#cloning-the-repo)
  - [Using the Installation Scripts](#using-the-installation-scripts)
- [Customization](#customization)
- [Contributing](#contributing)

## Introduction
These dotfiles are designed to configure my machine exactly how I need it, whether it’s setting up keybindings in VSCode or automating the installation of development tools. Here’s a breakdown of what’s included:
- **Bash Configuration (`.bashrc`)**: Custom aliases, functions, and prompt setups.
- **VSCode Settings (`settings.json`)**: Personal editor settings and configurations.
- **VSCode Keybindings (`keybindings.json`)**: Custom keybindings to streamline my VSCode experience.
- **Software Installation Script**: Automates the installation of essential software via package managers.
- **Homebrew Installation Script**: Handles the setup of Homebrew and its dependencies.
- **Neovim Configuration**: Custom config to optimize my Neovim workflow.

## Files and Configurations

1. **.bashrc**:
   - Aliases for common commands.
   - Custom prompt setup with Git integration.
   - History and path configuration for an efficient terminal experience.

2. **VSCode Settings (`settings.json`)**:
   - Customized editor layout, font settings, extensions, and UI preferences.

3. **VSCode Keybindings (`keybindings.json`)**:
   - Custom keybindings for VSCode to maximize productivity.

4. **Software Installation Script**:
   - Installs essential development tools like Git, Docker, Node.js, etc.
   - Can be easily extended by adding more packages.

5. **Homebrew Installation Script**:
   - Automates the installation of Homebrew and commonly used formulae for macOS.

6. **Neovim Configuration**:
   - Lays out plugins, key mappings, and color schemes tailored to Neovim.

## Installation

### Cloning the Repo

Clone the repository to your home directory:

```bash
git clone https://github.com/your-username/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### Using the Installation Scripts

To install all the necessary software and set up your environment:

1. **Run the Homebrew installation script** (macOS only):
   ```bash
   ./brew-install.sh
   ```

2. **Run the software installation script**:
   ```bash
   ./install-software.sh
   ```

3. **Symlink your dotfiles**:
   This command creates symbolic links from the dotfiles in this repo to the appropriate places on your machine:
   ```bash
   ./symlink-setup.sh
   ```

## Customization
You can easily customize this setup by modifying any of the configuration files or adding new ones. Here’s how you can tweak each part:
- **Bash**: Modify `.bashrc` to add your own aliases, environment variables, or functions.
- **VSCode**: Update `settings.json` and `keybindings.json` for personalized editor settings.
- **Neovim**: Extend the config with your favorite plugins and key mappings.

## Contributing
Feel free to fork this repository and make it your own! Contributions are welcome if you'd like to add improvements or additional setups.

---

