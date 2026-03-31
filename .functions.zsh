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

rguniq() {
    rg -o "$1" "${2:-.}" | sort -u
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

replace_word() {
    old_word="$1"
    new_word="$2"
    grep -rl ${old_word} . | xargs sed -i "s/${old_word}/${new_word}/g"
}

fetch_viz_bag() {
    local url="$1"

    # Extract the s3_object_name parameter
    local obj
    obj=$(printf '%s' "$url" | sed -E 's/.*s3_object_name=([^&]+).*/\1/')

    # Extract timestamp (first field) from filename: 2025-11-20-02-13-19-8810
    local date
    date=$(printf '%s' "$obj" | cut -d'_' -f1 | cut -d'-' -f1-3)

    # Extract mission_id field: mission_<UUID>_
    local mission_id
    mission_id=$(printf '%s' "$obj" | sed -E 's/.*mission_([0-9a-fA-F-]+).*/\1/')

    # Build S3 prefix
    local prefix="s3://spad-static-site/date=${date}/mission_id=${mission_id}"

    echo "Downloading:"
    echo "  $prefix/$obj"

    aws s3 cp "${prefix}/${obj}" .
}

vault_login() {
    local username=$1

    if vault token lookup 2>/dev/null; then
        echo "Vault credentials are valid, no need to sign in again!"
        return 0
    fi

    if [ -z "$username" ]; then
        echo "Usage: vault_login <username>"
        return 1
    fi

    vault login -method=okta username=${username}@outrider.ai

    if [ "$?" -ne 0 ]; then
        echo "login failed"
        return 2
    fi

    vault write -field=signed_key vehicle_ssh/sign/development public_key=@$HOME/.ssh/id_ed25519.pub valid_principals=development > ~/.ssh/vault-vehicle-ssh.pub

    if [ "$?" -ne 0 ]; then
        echo "writing key failed"
        return 3
    fi
}
source ~/.local/bin/video_utils
