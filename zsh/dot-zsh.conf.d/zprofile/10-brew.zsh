HOMEBREW_BIN_PATH=/opt/homebrew/bin/
HOMEBREW_SBIN_PATH=/opt/homebrew/sbin/

if [[ ! "$PATH" =~ (^|:)"${HOMEBREW_SBIN_PATH}"(:|$) ]]
then
    PATH=${HOMEBREW_SBIN_PATH}:$PATH
fi

if [[ ! "$PATH" =~ (^|:)"${HOMEBREW_BIN_PATH}"(:|$) ]]
then
    PATH=${HOMEBREW_BIN_PATH}:$PATH
fi

# `shellenv` installs brew's auto-completions for zsh (technically it adds the path with the auto-completions to $fpath / $FPATH)
# `shellenv` MUST be called before compinit
eval "$(brew shellenv)"
