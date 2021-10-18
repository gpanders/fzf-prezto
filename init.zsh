#
# Fuzzy file finder module for prezto
#
# Authors:
#   Greg Anders <greg.p.anders@gmail.com>
#

# Add manually installed fzf to path
if [[ -s "$HOME/.fzf/bin/fzf" ]]; then
  path=("$HOME/.fzf/bin" $path)
fi

if (( ! $+commands[fzf] )); then
  return 1
fi

if zstyle -t ':prezto:module:fzf' key-bindings; then
  source "${0:h}/external/shell/key-bindings.zsh"
fi

if zstyle -t ':prezto:module:fzf' completion; then
  [[ $- == *i* ]] && source "${0:h}/external/shell/completion.zsh" 2>/dev/null
fi

export FZF_DEFAULT_OPTS=""

# Set height of fzf results
zstyle -s ':prezto:module:fzf' height FZF_HEIGHT

# Open fzf in a tmux pane if using tmux
if zstyle -t ':prezto:module:fzf' tmux && [ -n "$TMUX_PANE" ]; then
  export FZF_TMUX=1
  export FZF_TMUX_HEIGHT=${FZF_HEIGHT:-40%}
  alias fzf="fzf-tmux -d${FZF_TMUX_HEIGHT}"
else
  export FZF_TMUX=0
  if [ ! -z "$FZF_HEIGHT" ]; then
    export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --height ${FZF_HEIGHT} --reverse"
  fi
fi

__fzf_prog() {
  [ -n "$TMUX_PANE" ] && [ "${FZF_TMUX:-0}" != 0 ] && [ ${LINES:-40} -gt 15 ] \
    && echo "fzf-tmux -d${FZF_TMUX_HEIGHT}" || echo "fzf"
}

# Use ripgrep or ag if available
if (( $+commands[rg] )); then
  export FZF_DEFAULT_COMMAND="rg --files"
  _fzf_compgen_path() {
    rg --files "$1"
  }
elif (( $+commands[ag] )); then
  export FZF_DEFAULT_COMMAND="ag -g ''"
  _fzf_compgen_path() {
    ag -g '' "$1"
  }
fi

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Uncomment to use --inline-info option
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --inline-info"

# Set colors defined by user
source "${0:h}/colors.zsh"
zstyle -s ':prezto:module:fzf' colorscheme FZF_COLOR
if [[ ! -z "$FZF_COLOR" && ${fzf_colors["$FZF_COLOR"]} ]]; then
  export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --color ${fzf_colors["$FZF_COLOR"]}"
fi

# Use preview window with Ctrl-T
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

# If tree command is installed, show directory contents in preview pane when
# using ALT-C
if (( $+commands[tree] )); then
  export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
fi

# If fasd is loaded, pipe output to fzf
# Note that the `fzf-tmux` command works regardless of whether or not the user is
# in a tmux session. If no tmux session is detected, it acts just like `fzf`
if zstyle -t ':prezto:module:fasd' loaded; then
  unalias j 2>/dev/null
  __fzf_cd() {
    local dir fzf
    fzf=$(__fzf_prog)
    dir="$(fasd -Rdl "$*" | ${=fzf} -1 -0 --no-sort +m)" && cd "${dir}" || return 1
  }
  alias j='__fzf_cd'
fi
