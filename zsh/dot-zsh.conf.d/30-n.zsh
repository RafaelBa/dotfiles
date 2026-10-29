export N_PREFIX=$HOME/.n
N_BIN_PATH=$N_PREFIX/bin/
[[ ":$PATH:" =~ "$N_BIN_PATH" ]] || PATH=$N_BIN_PATH:$PATH

# read the PWD's .nvmrc file and apply to `n`
alias nnvmrc='n $(cat .nvmrc)'
