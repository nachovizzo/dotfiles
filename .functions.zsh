ros2_setup() {
    source /opt/ros/humble/setup.zsh
    complete -o nospace -o default -F _python_argcomplete "ros2"
}

get_remote() {
    git remote -vv | tail -n1 | awk '{print $2}' | tr -d '\n' | xcopy
}

open_remote() {
    open $(git remote -vv | grep origin | tail -n1 | awk '{print $2}' | xargs -I URL sh -c "echo URL | grep https || echo URL | sed 's/:/\//' | sed 's/^.*@/https:\/\//'") 1>/dev/null
}

grab() {
    realpath "$1" | tr -d "\n" | xcopy
}

naqui() {
    tmux new -s "nautilus@$(basename $(pwd))" -d 'nautilus .'
}

cpp_sources() {
    find . -regextype posix-extended -regex \
        ".*\.(cpp|cxx|cc|hpp|hxx|h)" |
        grep -vE "^./(build|3rdparty)/"
}

filename() {
    BASENAME="$(basename -- $1)"
    FILENAME=${BASENAME%.*}
    echo $FILENAME
}

check_includes() {
    grep -rhE '^#include\s+(<|").*(>|")' | sort | uniq
}

check_imports() {
    grep -rh import | sort | uniq
}

zip_folder() {
    folder="$1"
    echo "Creating zip file of $folder"
    zip -r $folder.zip $folder
}

za() {
    zathura --fork $1 2>/dev/null
}

run_docker_cwd() {
    docker run --rm -it -u 1000:1000 -v $(realpath .):/workspace -w /workspace $1
}

run_root_docker_cwd() {
    docker run --rm -it -v $(realpath .):/workspace -w /workspace $1
}

gitignore() {
    curl -sLw n https://www.toptal.com/developers/gitignore/api/$@
}

fast_remove() {
    DIR="$(realpath $1)"
    printf '%s ' "[WARNING] Removing all contents in \"${DIR}\", are you sure (y/n)"
    read REPLY
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
    fi
    mkdir /tmp/empty_directory
    rsync -a --delete /tmp/empty_directory/ ${DIR}/
    rm -rf ${DIR}
    rm -rf /tmp/empty_directory
    echo "Done!"
}

ssh() {
    if [ "$#" -eq 2 ]; then
        /usr/bin/ssh $1 "balena exec -it \$(balena ps -q -f name=$2) bash"
    else
        /usr/bin/ssh $@
    fi
}
