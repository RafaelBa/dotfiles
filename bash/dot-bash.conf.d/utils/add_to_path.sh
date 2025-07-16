function add_to_path {
    if [ -z "${1}" ]
    then
        echo -e "\e[0;33mWARNING:\e[0m called $0 with no argument!"
        echo ""
        return 1;
    fi

    if [[ ! "$PATH" =~ (^|:)"${1}"(:|$) ]]
    then
        PATH=${1}:$PATH
    fi
}
