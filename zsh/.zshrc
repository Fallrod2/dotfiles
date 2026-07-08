
# Start the tmux session if not alraedy in the tmux session
#if [[ ! -n $TMUX  ]]; then
#    tmux kill-session -a
#    tmux
#fi


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi



# opam configuration
[[ ! -r /Users/alexabriel/.opam/opam-init/init.zsh ]] || source /Users/alexabriel/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

export PATH="$HOME/.local/bin":$PATH

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls="eza --icons=always"
alias mvim='NVIM_APPNAME=mvim nvim'

eval "$(zoxide init zsh)"

alias cd="z"

mini() { ssh -t macmini "tmux new-session -A -s ${1:-claw}"; }


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Added by Windsurf
export PATH="/Users/alexabriel/.codeium/windsurf/bin:$PATH"
alias kali='container run --remove --interactive --tty --entrypoint=/bin/bash --volume /Users/alexabriel:/mnt --name device-60-SPziYk --workdir /mnt kalilinux/kali-rolling:latest'
