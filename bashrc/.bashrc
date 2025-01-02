# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

# Load starship prompt if starship is installed
if [ -x /usr/bin/starship ]; then
  __main() {
    local major="${BASH_VERSINFO[0]}"
    local minor="${BASH_VERSINFO[1]}"

    if ((major > 4)) || { ((major == 4)) && ((minor >= 1)); }; then
      source <("/usr/bin/starship" init bash --print-full-init)
    else
      source /dev/stdin <<<"$("/usr/bin/starship" init bash --print-full-init)"
    fi
  }
  __main
  unset -f __main
fi

## Useful aliases

# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first --icons'     # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'      # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'      # long format
alias lt='exa -aT --color=always --group-directories-first --icons'     # tree listing
alias l.='exa -ald --color=always --group-directories-first --icons .*' # show only dotfiles

# Replace some more things with better alternatives
alias cat='bat --style header --style snip --style changes --style header'
[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru'

# Common use
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='ugrep --color=auto'
alias fgrep='ugrep -F --color=auto'
alias egrep='ugrep -E --color=auto'
alias hw='hwinfo --short'                          # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"     # Sort installed packages according to size in MB (expac must be installed)
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
alias ip='ip -color'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"
# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias vs="code ." # Open Visual Studio Code in the current directory
eval "$(zoxide init bash --cmd 'cd')"
alias cdi='__zoxide_zi'
alias q="exit"
alias c="clear"
alias n="nvim"
alias lg="lazygit"
alias hl="hyprlock"
alias r="rm -rf"
alias update="sudo dnf upgrade -y"
alias need="sudo dnf install"
alias remove="sudo dnf remove"
# export CHROME_EXECUTABLE="/bin/google-chrome-stable"

# neofetch
