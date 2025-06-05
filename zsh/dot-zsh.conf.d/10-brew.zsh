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

