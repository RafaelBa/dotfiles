
# FIXME: Untested(!!) helper function to add first argument ($1}) to PATH
# TODO: Add check to make sure $1 is not empty!
function add_to_path {
    if [[ ! "$PATH" =~ (^|:)"${1}"(:|$) ]]
    then
        PATH=${1}:$PATH
    fi
}
