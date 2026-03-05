
# -U or --universal to make it available to all users and terminals immediately
# -x or --export to make it available to child processes - making it a ENV VAR
set -Ux N_PREFIX $HOME/.n
# -m or --move moves the path to the new place in PATH - otherwise existing entries would not be touched
fish_add_path -m $N_PREFIX/bin

