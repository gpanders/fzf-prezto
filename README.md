# fzf module for prezto

This module adds configuration for [fzf](https://github.com/junegunn/fzf) to
the [prezto](https://github.com/sorin-ionescu/prezto) Zsh configuration
framework.

## Installation

zprezto will load external modules found in the `$ZDOTDIR/.zprezto/contrib`
directory.

 ```zsh
 mkdir -p $ZDOTDIR/.zprezto/contrib && cd $_
 git clone https://github.com/gpanders/fzf-prezto.git fzf
 cd fzf
 git submodule update --init
 ```

If you already have fzf installed, then the init script will detect your
installation. Otherwise, you can install fzf by running:

```zsh
$ZDOTDIR/.zprezto/contrib/fzf/external/install --bin
```

## prezto parameters

This module adds the following configuration options to your prezto 
installation:

```zsh
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
```

Add the above lines to your `.zpreztorc` file.

## Colorscheme

The `color.zsh` file currently contains three color schemes:
[Solarized](https://ethanschoonover.com/solarized/) (both dark and light
variants) and [Atom's One Dark](https://atom.io/themes/one-dark-syntax). You
can add more color schemes of your own in this file and activate them by
setting the appropriate `zstyle` in `.zpreztorc`.
