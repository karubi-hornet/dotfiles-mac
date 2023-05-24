chmod 755 /usr/local/share/zsh
chmod 755 /usr/local/share/zsh/site-functions

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

### ALIACES
alias dsstore="find . -name '*.DS_Store' -type f -ls -delete"
alias ll="ls -la"
alias emulator="/Users/ryo/Library/Android/sdk/emulator/emulator"

### for git
autoload -U colors; colors

function git-prompt {
  local branchname branch st remote pushed upstream
  branchname=`git symbolic-ref --short HEAD 2> /dev/null`
  if [ -z $branchname ]; then
    return
  fi
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    branch="%{${fg[green]}%}($branchname)%{$reset_color%}"
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    branch="%{${fg[yellow]}%}($branchname)%{$reset_color%}"
  else
    branch="%{${fg[red]}%}($branchname)%{$reset_color%}"
  fi

  remote=`git config branch.${branchname}.remote 2> /dev/null`

  if [ -z $remote ]; then
    pushed=''
  else
    upstream="${remote}/${branchname}"
    if [[ -z `git log ${upstream}..${branchname}` ]]; then
      pushed="%{${fg[green]}%}[up]%{$reset_color%}"
    else
      pushed="%{${fg[red]}%}[up]%{$reset_color%}"
    fi
  fi

  echo "$branch$pushed"
}

PROMPT='`git-prompt`%{$fg_bold[cyan]%}[%~]%{$reset_color%}'
setopt prompt_subst

# yarn
# export PATH="$PATH:`yarn global bin`"

. $(brew --prefix asdf)/libexec/asdf.sh
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
PATH=/Users/ryo/.asdf/shims:/usr/local/opt/asdf/libexec/bin:/Users/ryo/.local/share/zinit/polaris/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin::/Users/ryo/.asdf/installs/nodejs/19.0.0/.npm/bin:::/usr/local/bin
