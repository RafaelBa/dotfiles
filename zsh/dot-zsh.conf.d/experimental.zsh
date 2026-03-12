# This config should be as empty as possible
# It is meant for trying out new settings, tools, or workflows
# Additions and changes need to be commented with date of change
# Configs that haven't changed in a long time should be removed or moved to a permanent config file

# 2026-03-11 `fc` command will call this editor for editing the last command
FCEDIT=nvim

# 2026-03-11 default editor when a terminal command wants to open an editor
EDITOR=nvim

# 2026-03-11 this stops CTRL+w at slashes
autoload -Uz select-word-style
select-word-style bash
