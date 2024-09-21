export PATH="$PATH:/opt/mssql-tools18/bin"
# CADDEハンズオン用
export WORKDIR=/home/seike/cadde_testbed
# ~/.bashrc に以下を追加または確認
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# 色の定義（ANSIエスケープコード）
RED='\[\e[31m\]'
GREEN='\[\e[32m\]'
BLUE='\[\e[34m\]'
YELLOW='\[\e[33m\]'
CYAN='\[\e[36m\]'
WHITE='\[\e[37m\]'
RESET='\[\e[0m\]'

# プロンプトの設定
PS1="${GREEN}\u${CYAN}@${BLUE}\h${WHITE}:${YELLOW}\w${RESET}\$ "
