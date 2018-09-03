# fzf module for prezto

This is module adds configuration for [fzf](https://github.com/junegunn/fzf) to
the [prezto](https://github.com/sorin-ionescu/prezto) Zsh configuration
framework.

## Installation

Make sure you have the line

    zstyle ':prezto:load' pmodule-dirs $HOME/.zprezto-contrib

in your `.zpreztorc` file.

Then issue the following commands:

    mkdir -p ~/.zprezto-contrib
    git clone https://github.com/gpanders/fzf-prezto.git ~/.zprezto-contrib/fzf
    cd ~/.zprezto-contrib/fzf
    git submodule update --init

If you already have fzf installed, then the init script will detect your
installation. Otherwise, you can install fzf by running:

    ~/.zprezto-contrib/fzf/external/install --bin

## prezto parameters

This module adds the following configuration options to your prezto 
installation:

    # Use keybindings
    zstyle ':prezto:module:fzf' key-bindings 'yes'
    
    # Use completion
    zstyle ':prezto:module:fzf' completion 'yes'
    
    # Set height of the fzf results (comment for full screen)
    zstyle ':prezto:module:fzf' height '30%'
    
    # Open fzf results in a tmux pane (if using tmux)
    zstyle ':prezto:module:fzf' tmux 'yes'
    
    # Set colorscheme
    # A list of available colorschemes is available in color.zsh
    # To add more color schemes of your own, consult
    # https://github.com/junegunn/fzf/wiki/Color-schemes and add values to the
    # color.zsh file accordingly
    zstyle ':prezto:module:fzf' colorscheme 'Solarized Light'

Add the above lines to your `.zpreztorc` file.

## Colorscheme

The `color.zsh` file contains two color schemes: Solarized Dark and
Solarized Light. You can add more color schemes of your own in this file and
activate them by setting the appropriate `zstyle` in `.zpreztorc`.
