# Nvim config

## Dependencies
- [neovim](https://neovim.io/)
- [vectorcode](https://github.com/Davidyz/VectorCode)
- [yarn](https://yarnpkg.com/)

## Installation
### Clone and link the configuration files
Make git folder and clone the configuration folder into it, then create a symbolic link from the config file to .config/nvim:
```bash
mkdir ~/git
git clone https://github.com/lassejep/nvim_config.git ~/git/
ln -s ~/git/nvim_config ~/.config/nvim
```
### Install neovim plugins
After this you open neovim, open the Lazy plugin manager by typing `:Lazy`, this will install the plugins, you then close lazy by pressing `q`.

### Install LSPs
Lastly you open Mason by typing `:Mason`, install whichever lsps you need, and then close it by pressing `q`.
