
# MacOS keybindings
bindkey "^[[1;3D" backward-word # ALT-left-arrow  ⌥ + ←
bindkey "^[[1;3C" forward-word  # ALT-right-arrow ⌥ + →

# MacOS (v26 on 2026-03-04) prints the same information on -p and -l, but we expect only the PID on -p
function jobs-p () {
    jobs -l $1 | awk '{print $3}'
}
