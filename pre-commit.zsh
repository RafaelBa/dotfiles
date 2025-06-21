# TODO: this should be another shell or programming language, something I expect to be on all set-up computers, eg. fish, Nushell, JS, Lua - dealing with `IFS=$'\n'` is no fun

function check-with-git-ls {
	local FINDS
	local IFS=$'\n'
	for a in $(git ls-files); do 
		local CURRENT_FIND=$(grep -iR -f $TOKEN_FILENAME "$a")
		if [ ! -z "$( echo $CURRENT_FIND | grep 'Binary file')" ]; then 
			CURRENT_FIND="\n$CURRENT_FIND\n"
		fi
		FINDS+=$CURRENT_FIND
	done
	# TODO: `printf` complains if `$FINDS` is empty, since it has not been given any arguments
	printf $FINDS
}

local TOKEN_FILENAME=pre-commit-tokens
local TOKEN_ERROR_MESSAGE="⚠️ Please add a $TOKEN_FILENAME and fill it with strings that must not be committed!"
# Check if token file is properly set up
if [ ! -f $TOKEN_FILENAME ]; then
	echo "❌ File $TOKEN_FILENAME is missing"
	echo $TOKEN_ERROR_MESSAGE
	return 1
elif [ -z "$(cat $TOKEN_FILENAME | grep "\\S")" ]; then
	echo "❌ File $TOKEN_FILENAME exists, but file is empty"
	echo $TOKEN_ERROR_MESSAGE
	return 1
else 
	echo "$TOKEN_FILENAME exists and has content"
fi

# TODO: PoC is making both checks - one should be sufficient; git ls-files seems like the better solution
echo "run file based grep"
# TODO: this version would need to make sure that we do not check-in $TOKEN_FILENAME accidentally
GREP_FILE_RESULT=$(grep -iR -f $TOKEN_FILENAME $PWD | grep -v "^$PWD/\(.git\|$TOKEN_FILENAME\)")
# git ls-files list all files tracked by git, including newly staged files in the current process
echo "run git-ls based grep"
GIT_LS_GREP_RESULT=$(check-with-git-ls)

if [ ! -z "$GREP_FILE_RESULT" ]; then
	echo "File-based check found these: "
	echo "$GREP_FILE_RESULT"
	echo
fi
if [ ! -z "$GIT_LS_GREP_RESULT" ]; then
	echo "git-ls-based check found these: "
	echo "$GIT_LS_GREP_RESULT"
	echo
fi

if [ ! -z "$GREP_FILE_RESULT" ] || [ ! -z "$GIT_LS_GREP_RESULT" ]; then
	echo "Check failed, found strings that shouldn't be committed!"
	return 1;
fi

