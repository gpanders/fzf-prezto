# fzf module for prezto

This is module adds configuration for [fzf](https://github.com/junegunn/fzf) to
the [prezto](https://github.com/sorin-ionescu/prezto) Zsh configuration
framework.

## Installation

zprezto will load external modules found in the `$ZDOTDIR/.zprezto/contrib`
directory.

    mkdir -p $ZDOTDIR/.zprezto/contrib && cd $_
    git clone https://github.com/gpanders/fzf-prezto.git fzf
    cd fzf
    git submodule update --init

If you already have fzf installed, then the init script will detect your
installation. Otherwise, you can install fzf by running:

    $ZDOTDIR/.zprezto/contrib/fzf/external/install --bin

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

The `color.zsh` file contains three color schemes: Solarized Dark, Solarized
Light, and Atom's One Dark. You can add more color schemes of your own in this
file and activate them by setting the appropriate `zstyle` in `.zpreztorc`.
