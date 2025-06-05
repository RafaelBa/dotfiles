export N_PREFIX=$HOME/.n
N_BIN_PATH=$N_PREFIX/bin/
[[ ":$PATH:" =~ "$N_BIN_PATH" ]] || PATH=$N_BIN_PATH:$PATH
