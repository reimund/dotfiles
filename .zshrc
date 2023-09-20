#   Author: Johannes Martinsson
#     Mail: <johannes@antiklimax.se>
#    
#   Modified by: Reimund Trost
#     Mail: <reimund@code7.se>
#
#    zshrc: interactive shells, after zprofile before zlogin

# Mixed {{{1

umask 022
autoload -U colors && colors
autoload zmv
setopt autopushd

# Source host specific file.
[[ -e $ZDOTDIR/zshrc.$HOST ]] && . $ZDOTDIR/zshrc.$HOST
[[ -e $ZDOTDIR/zshrc.${HOST:r:e} ]] && . $ZDOTDIR/zshrc.${HOST:r:e}

# Aliases {{{1

alias ss='source ~/.zshrc'
alias zshrc='mvim ~/.zshrc'
alias vimrc='mvim ~/.vimrc'
alias crontab='VIM_CRONTAB=true crontab'

# Set window title, useful together with Display Maid.
# # My iTerm2 config:
# Watchers		Work 1
# Servers		Work 2
alias set_title='f() { echo -ne "\033]0;"$1"\007" };f'

alias rm='rm -i'
alias df='df -h'
alias du='du -hcs'

alias rm_ds='find . -name "*.DS_Store" -type f -delete; find . -name "*.ds_store" -type f -delete;'

alias ehosts='sudo mvim /etc/hosts'

# Macports Apache install.
alias vhosts='sudo mvim /opt/local/apache2/conf/extra/httpd-vhosts.conf'
alias ehttpd='sudo mvim /opt/local/apache2/conf/httpd.conf'

# Ordinary Apache install.
#alias ehttpd='sudo mvim /private/etc/apache2/httpd.conf'
#alias vhosts='sudo mvim /private/etc/apache2/extra/httpd-vhosts.conf'

alias enginx='sudo mvim /opt/local/etc/nginx/nginx.conf'
alias ephp='sudo mvim /opt/local/etc/php5/php.ini'

# Git aliases
alias gst='git status'
alias gc='git commit -m'
alias gca='git commit --amend'
alias ga='git add'
alias gi='git add -i'
alias gau='git add -u -v'
alias gpl='git pull'
alias gps='git push'
alias gsta='git stash'
alias gstal='git stash list'
alias gstap='git stash pop'
alias gstac='git stash clear'
alias gstaa='git stash apply'
#alias gitk='gitk --all &'
alias gitk='gitk &'
alias gsu='git stash && git remote update && git rebase origin master && git stash pop'

alias q='cd ~/Projects/qualisys'
alias lum='cd ~/Projects/lumens/website/lumens/'
alias kel='cd ~/Projects/lumens/website/kelvin/'
alias tools='cd ~/Projects/lumens/website/tools/'
alias bit='cd ~/Projects/bitsek.se/2.0/'
alias fa='cd ~/Projects/fashionaffiliate'

alias show_hidden='defaults write com.apple.Finder AppleShowAllFiles YES'
alias hide_hidden='defaults write com.apple.Finder AppleShowAllFiles NO'

#alias nginx_start='sudo nginx'
#alias nginx_stop='sudo kill `cat /opt/local/var/run/nginx/nginx.pid`'
alias nginx_start='sudo launchctl start org.macports.nginx'
alias nginx_stop='sudo launchctl stop org.macports.nginx'
alias nginx_restart='nginx_stop;nginx_start'

alias phpfpm_stop='sudo killall php-fpm'
alias phpfpm_start='sudo php-fpm'


# Fix os-specific ls-aliases.
case $OSTYPE in
       darwin*|freebsd*)
               alias ls='ls -FG'
               ;;
   solaris*)
       alias ls='ls -F'
       ;;
       *)
               alias ls='ls -hHF --color --format=horizontal'
               ;;
esac

alias cd..='cd ..'
alias ll='ls -la'
alias l='ls -1'
alias lsd='ll -df */'

# From <http://strcat.neessen.net/dotfiles/zsh/dot.zshaliases>
alias lad='ls -d .*(/)'                 # only show dot-directories
alias lsa='ls -a .*(.)'                 # only show dot-files
alias lss='ls -l *(s,S,t)'              # only files with setgid/setuid/sticky flag
alias lsl='ls -l *(@[1,10])'            # only symlinks
alias lsx='ls -l *(*[1,10])'            # only executables
alias lsw='ls -ld *(R,W,X.^ND/)'        # world-{readable,writable,executable} files
alias lsbig="ls -flh *(.OL[1,10])"      # display the biggest files
alias lsd='ls -d *(/)'                  # only show directories
alias lse='ls -d *(/^F)'                # only show empty directories
alias lsnew="ls -rl *(D.om[1,10])"      # display the newest files
alias lsold="ls -rtlh *(D.om[1,10])"    # display the oldest files
alias lssmall="ls -Srl *(.oL[1,10])"    # display the smallest files
alias tree='tree -C -A'

if [[ -x $(which irb) ]]; then
   alias irb='irb --readline -r irb/completion'
fi

# Other stuff
alias ex=extract_archive

# Global aliases
alias -g BG='>/dev/null &'

# Completion {{{1
# :completion:<func>:<completer>:<command>:<argument>:<tag>
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' accept-exact false
zstyle ':completion:*' cache-path $ZDOTDIR/cache
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*:rm:*' ignore-line other
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:*:users' ignored-patterns \
       adm alias apache at bin cron cyrus daemon games gdm guest halt \
       lighttpd lp mail man mpd mysql named news nobody ntp nut operator \
       portage postfix postgres postmaster qmaild qmaill qmailp qmailq qmailr \
       qmails rpc shutdown smmsp squid sshd sync uucp vpopmail xfs
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _match _correct _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion::expand:*' tag-order globbed-files all-expansions
zstyle ':completion:*' format '%BCompleting %d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd directory
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma='42;30;01'
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=10
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
#zstyle :compinstall filename '/home/majoh/.zsh/zshrc'

# Hostnames
if [[ -f $HOME/.ssh/known_hosts ]]
then
       local _myhosts
       _myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
       zstyle ':completion:*' hosts $_myhosts
fi

autoload -Uz compinit && compinit -i

# Prompt {{{1
((MAXWIDTH=$COLUMNS/3))

# Do stuff for git stuff.
autoload -Uz vcs_info

# set formats
# %b - branchname
# %u - unstagedstr (see below)
# %c - stangedstr (see below)
# %a - action (e.g. rebase-i)
# %R - repository path
# %S - path in the repository
FMT_BRANCH="${PR_GREEN}%b%u%c${PR_RESET}" # e.g. master¹²
FMT_ACTION="(${PR_CYAN}%a${PR_RESET}%)"   # e.g. (rebase-i)
FMT_PATH="%R${PR_YELLOW}/%S"              # e.g. ~/repo/subdir

# Check-for-changes can be really slow.
# You should disable it, if you work with large repositories
zstyle ':vcs_info:*:prompt:*' enable git
zstyle ':vcs_info:*:prompt:*' check-for-changes true
zstyle ':vcs_info:*:prompt:*' unstagedstr '¹'  # Display ¹ if there are unstaged changes
zstyle ':vcs_info:*:prompt:*' stagedstr '²'    # Display ² if there are staged changes
zstyle ':vcs_info:*:prompt:*' actionformats " ${FMT_BRANCH}${FMT_ACTION}" " ~${FMT_PATH}"
zstyle ':vcs_info:*:prompt:*' formats       " ${FMT_BRANCH}"              " ~${FMT_PATH}"
zstyle ':vcs_info:*:prompt:*' nvcsformats   ""                             "%~"

precmd()
{
	psvar=()
	vcs_info 'prompt'

	[[ -n $vcs_info_msg_0_ ]] && psvar[1]="$vcs_info_msg_0_"

	# Remove leading whitespace.
	trimmed_branch="${vcs_info_msg_0_## }"

	if [ -z "$trimmed_branch" ]; then
		branch=''
	else
		branch="(${trimmed_branch})"
	fi

	# Set the iTerm tab title to current directory.
	echo -ne "\e]1;${PWD##*/} ${branch}\a" 2> /dev/null;
}

set -A prompt_array \
       "%(1j.[%j] .)" \
       "%B%m%b" \
       "%(1v.%1v%f.)" \
       "%(!@.%{$fg[red]%}%n%{$reset_color%}@)" \
       "%(?.%{$fg[green]%}%#.%{$fg[red]%}%#)%{$reset_color%} "

set -A rprompt_array \
       "%U%$MAXWIDTH<...<%~%u" \
       " %{$fg_bold[black]%}%T%{$fg[black]%}%{$reset_color%}"

PROMPT=""
for i in $prompt_array
do
       PROMPT=${PROMPT}${i}
done

RPROMPT=""
for i in $rprompt_array
do
       RPROMPT=${RPROMPT}${i}
done

#-/ Nice titles /----------
case $TERM in ((x|a|E)term|*rxvt*)
   # Show path in titlebar
   #precmd () { print -Pn "\e]0;%n@%m: %~\a" }
   # Show command in titlebar
   #preexec () { print -Pn "\e]0;%n@%m: $1\a" }
   ;;
esac

# interactive environment {{{1

[[ -x $(which most 2> /dev/null) ]] && export PAGER=/usr/bin/most
[[ -x $(which less 2> /dev/null) ]] && export PAGER=/usr/bin/less\ -RFX

# Keys {{{1
# Key bindings for zshzle

## This uses the zsh builtin zkbd which when run, prompts you to press a
## bunch of keys. It saves them in ~/.zkbd, so that you can have many
## configurations depending on which terminal and/or keyboard type you
## are using.

## Use vi-style keybindings
bindkey -v
bindkey '^A' vi-beginning-of-line
bindkey '^E' vi-end-of-line
bindkey '^F' history-incremental-search-backward

bindkey '^H' run-help

bindkey -r '^X'

#bindkey -M menuselect '^O' accept-and-infer-next-history
#bindkey -M menuselect '^U' undo

## Bind the keys that zkbd set up to some widgets
[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Home]} ]]      && bindkey "${key[Home]}" vi-beginning-of-line
[[ -n ${key[PageUp]} ]]    && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]]    && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]]       && bindkey "${key[End]}" vi-end-of-line
[[ -n ${key[PageDown]} ]]  && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]]        && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]]      && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]]      && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]]     && bindkey "${key[Right]}" forward-char

# Options {{za{1
## Completion
setopt complete_in_word # Do completion inside of words as well.
setopt always_to_end    # If completed from within a word move to end.
setopt list_packed      # Use different width columns.
setopt list_types       # Append characters to indicate file types.
setopt no_nomatch       # Forward unmatching stuff to command.
setopt no_menu_complete # Don't insert the first match from the menu.
setopt extended_glob
setopt auto_list
setopt correct # Try to correct misspelled commands.
setopt interactive_comments # Allow comments on the command line.

## Miscellaneous
setopt auto_cd           # cd if not command.
setopt pushd_to_home     # Pushd without arguments goes to home.
setopt pushd_ignore_dups # Unique directories on stack.
setopt auto_continue     # Continue stopped job after disown.
setopt dvorak            # Assume DVORAK keyboard for corrections etc.

## History
HISTSIZE=1000000
SAVEHIST=100000
HISTFILE=$ZDOTDIR/.zhistory

setopt hist_verify          # Don't execute immediatly, just substitute.
setopt hist_ignore_space    # Ignore commands begining with space.
setopt hist_no_store        # Don't store the `history` or `fc -l` commands.
setopt hist_ignore_all_dups # Remove old duplicates.
setopt no_hist_beep         # Don't beep at top of history
setopt extended_history     # Save timestamps with command.

# vim: ft=zsh foldmethod=marker :


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# Paths {{{1
# Setup PYTHONPATH
export PYTHONPATH=/Library/Python/2.7/site-packages/django/bin:PYTHONPATH

# Set various environment variables.
export ZDOTDIR=~
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export FONTCONFIG_PATH=/opt/local/etc/fonts/
export DJANGO_ENV=hackmon
export SVN_EDITOR=vi

# Setup PATH
export PATH=~/bin
export PATH=/usr/bin/:$PATH
export PATH=/usr/sbin/:$PATH
export PATH=/opt/homebrew/bin:$PATH

#export NPM_CONFIG_PREFIX=~/.npm
export NODE_PATH=$NODE_PATH:$HOME/.npm/lib/node_modules
export PATH="$NPM_CONFIG_PREFIX/bin:$PATH"
#NPM_PACKAGES=~/.npm-packages
#NODE_PATH="$NPM_PACKAGES/lib/node_modules"
#PATH="$NPM_PACKAGES/bin:$PATH"

export PATH="/opt/homebrew/opt/php@8.0/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.0/sbin:$PATH"
export PATH="/opt/homebrew/opt/mongodb-community@5.0/bin:$PATH"
export PATH="/Users/reimund/Library/Python/3.9/bin:$PATH"
export PATH="/Applications/MAMP/Library/bin:$PATH"


