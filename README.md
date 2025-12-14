# Nvim config

## Dependencies
- [neovim](https://neovim.io/)
- [yarn](https://yarnpkg.com/)
- [git](https://git-scm.com/)
- [stow](https://www.gnu.org/software/stow/)

## Installation
### Clone and link the configuration files
Make git folder and clone the configuration folder into it, then create a symbolic link from the config file to .config/nvim:
```bash
mkdir -p ~/configs
git clone https://github.com/lassejep/nvim_config.git ~/configs
cd ~/configs/nvim_config/
stow -t $XDG_CONFIG_HOME .
```
### Install neovim plugins
After this you open neovim, open the Lazy plugin manager by typing `:Lazy`, this will install the plugins, you then close lazy by pressing `q`.

### Install LSPs
Lastly you open Mason by typing `:Mason`, install whichever lsps you need, and then close it by pressing `q`.
