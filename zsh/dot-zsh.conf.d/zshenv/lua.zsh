
if [[ ! -v LUA_PATH ]]
then
	LUA_PATH="$HOME/.lua/libs/?.lua"
elif ! [[ "$LUA_PATH" =~ "$HOME/.lua/libs:" ]]
then
    LUA_PATH="$HOME/.lua/libs/?.lua;$LUA_PATH"
fi

export PATH

