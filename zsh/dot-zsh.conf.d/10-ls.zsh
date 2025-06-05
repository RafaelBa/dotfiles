# tool configs - a mix of aliases and ENV VARs, kept together because they configure specific tools
## ls
alias ls="ls --color=auto"
alias la="ls -al"
alias ll="ls -l"
### GNU / Linux
export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
### MacOS / BSD
export LSCOLORS="Gxfxcxdxbxegedabagacad"
