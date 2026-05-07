# remove duplicate history entries and only keep newest entry
setopt hist_ignore_all_dups

# Solution found on StackOverflow - tried it with "up", seemed to work,
# even with partial arguments, like `nvim lu`,
# which would give me history entry of `nvim lua/some-file.lua`
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
# TODO: Adding this here, although not totally sure what `bindkey -M emacs` does; but I'm fairly certain that emacs is my default working style in zsh
bindkey -M emacs "^P" up-line-or-beginning-search
bindkey -M emacs "^N" down-line-or-beginning-search

# oh-my-zsh config (autoload and zle parts are identical)
# ----------------------------------------------------------------------
# Start typing + [Up-Arrow] - fuzzy find history forward
# bindkey -M emacs "^[[A" up-line-or-beginning-search
# bindkey -M viins "^[[A" up-line-or-beginning-search
# bindkey -M vicmd "^[[A" up-line-or-beginning-search
# if [[ -n "${terminfo[kcuu1]}" ]]; then
#   bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search
#   bindkey -M viins "${terminfo[kcuu1]}" up-line-or-beginning-search
#   bindkey -M vicmd "${terminfo[kcuu1]}" up-line-or-beginning-search
# fi

# Start typing + [Down-Arrow] - fuzzy find history backward
# bindkey -M emacs "^[[B" down-line-or-beginning-search
# bindkey -M viins "^[[B" down-line-or-beginning-search
# bindkey -M vicmd "^[[B" down-line-or-beginning-search
# if [[ -n "${terminfo[kcud1]}" ]]; then
#  bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search
#  bindkey -M viins "${terminfo[kcud1]}" down-line-or-beginning-search
#  bindkey -M vicmd "${terminfo[kcud1]}" down-line-or-beginning-search
# fi
# ----------------------------------------------------------------------


# alternative answer from StackOverflow
# autoload -Uz history-search-end
# zle -N history-beginning-search-backward-end history-search-end
# zle -N history-beginning-search-forward-end history-search-end
# $terminfo[kcuu1] ...[kcud1] return "A" and "B" - which looks like the same characters
# used in the approach above, only dynamically read
# bindkey "$terminfo[kcuu1]" history-beginning-search-backward-end
# bindkey "$terminfo[kcud1]" history-beginning-search-forward-end

# man zshoptions
# HIST_IGNORE_SPACE
# Remove command lines from the history list when the first character on the line is a space, or when one of the expanded aliases contains a leading space. Note that the command lingers in the internal history until the next command is entered before it vanishes, allowing you to briefly reuse or edit the line. If you want to make it vanish right away without entering another command, type a space and press return.
setopt HIST_IGNORE_SPACE
