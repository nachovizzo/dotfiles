get_remote() {
    git remote -vv | tail -n1 | awk '{print $2}' | tr -d '\n' | xcopy
}

get_branch() {
    git branch | sed -n -e 's/^\* \(.*\)/\1/p' | xcopy
}

open_remote() {
    xdg-open $(git remote -vv | grep origin | tail -n1 | awk '{print $2}' | xargs -I URL sh -c "echo URL | grep https || echo URL | sed 's/:/\//' | sed 's/^.*@/https:\/\//'") 1> /dev/null
}

grab() {
    realpath "$1" | tr -d "\n" | xclip -selection clipboard
}

wsp_compress() {
    VIDEO="$1"
    BASENAME="$(basename -- $VIDEO)"
    FILENAME=${BASENAME%.*}
    echo "Compressing $VIDEO for WhatsApp..."
    ffmpeg -i "${VIDEO}" -vcodec libx264 -acodec aac ${FILENAME}_wsp.mp4 2>/dev/zero
    mv "${FILENAME}_wsp".mp4 ${VIDEO}
}

cut_video() {
    VIDEO="$1"
    START_TIME="$2"
    END_TIME="$3"
    BASENAME="$(basename -- $VIDEO)"
    FILENAME=${BASENAME%.*}
    echo "Cutting $VIDEO from ${START_TIME} to ${END_TIME}..."
    ffmpeg -ss ${START_TIME} -to ${END_TIME} -i ${VIDEO} -c copy ${FILENAME}_cut.mp4
}

split_video() {
    VIDEO="$1"
    BASENAME="$(basename -- $VIDEO)"
    FILENAME=${BASENAME%.*}

    VIDEO_LENGTH="$(ffprobe -i $VIDEO -show_entries format=duration -v quiet -of csv='p=0')"
    SPLIT_SECONDS=$(($VIDEO_LENGTH / 2))
    SPLIT="$(date -d@"${SPLIT_SECONDS}" -u +%H:%M:%S)"

    echo "Splitting in half $VIDEO..."
    ffmpeg -i $1 -t ${SPLIT} -c copy "${FILENAME}"_part_1.mp4 \
        -ss ${SPLIT} -c copy "${FILENAME}"_part_2.mp4
    echo "Done!"
}

speedup_video() {
    VIDEO="$1"
    BASENAME="$(basename -- $VIDEO)"
    FILENAME=${BASENAME%.*}
    echo "Speeding by 2x video: $VIDEO..."
    ffmpeg -i $VIDEO -filter_complex "[0:v]setpts=0.20*PTS[v];[0:a]atempo=2[a]" -map "[v]" -map "[a]" -c:v libx264 -c:a aac ${FILENAME}_2x.mp4
    echo "Done!"
}

mkv_to_mp4() {
    VIDEO="$1"
    BASENAME="$(basename -- $VIDEO)"
    FILENAME=${BASENAME%.*}
    echo "Converting $VIDEO..."
    ffmpeg -i $VIDEO -codec copy ${FILENAME}.mp4
}

function cuda_is_availabe() {
    python3 -c "import torch; print(torch.cuda.is_available())"
}

start_notebook() {
    echo "Starting background Jupyter notebook server on $(pwd)..."
    tmux new -s "[notebook] $(basename $(pwd))" -d 'jupyter notebook .'
}

start_tensorboard() {
    logdir="$@"
    echo "Starting background TensorBoard server with logs at $logdir"
    tmux set-environment -g logdir $logdir \;             \
        new-session -s "[tensorboard] $(basename $(pwd))" \
        -d 'tensorboard --logdir=$logdir'
}

start_notebook_headless() {
    echo "Starting headless background Jupyter notebook server on $(pwd)..."
    tmux new -s "[notebook] $(basename $(pwd))" -d 'jupyter notebook --no-browser --port=8080 .'
}

naqui() {
    tmux new -s "nautilus@$(basename $(pwd))" -d 'nautilus .'
}

cpp_sources() {
    find . -regextype posix-extended -regex \
        ".*\.(cpp|cxx|cc|hpp|hxx|h)" |
        grep -vE "^./(build|3rdparty)/"
}

filename () {
    BASENAME="$(basename -- $1)"
    FILENAME=${BASENAME%.*}
    echo $FILENAME
}

check_includes() {
    grep -rh include | sort | uniq
}

check_imports() {
    grep -rh import | sort | uniq
}

fast_remove() {
    DIR="$(realpath $1)"
    printf '%s ' "[WARNING] Removing all contents in \"${DIR}\", are you sure (y/n)"
    read REPLY
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
    fi
    mkdir /tmp/empty_directory
    rsync -a --delete /tmp/empty_directory/ ${DIR}/
    rm -rf ${DIR}
    rm -rf /tmp/empty_directory
    echo "Done!"
}

zip_folder() {
    folder="$1"
    echo "Creating zip file of $folder"
    zip -r $folder.zip $folder
}

function za() {
    zathura --fork $1 2>/dev/null
}

run_docker_cwd() {
    docker run --rm -it -u 1000:1000 -v $(realpath .):/workspace -w /workspace $1
}

run_root_docker_cwd() {
    docker run --rm -it -v $(realpath .):/workspace -w /workspace $1
}

light_terminal(){ kitty @ set-colors -a "~/.config/kitty/light.conf" }

dark_terminal(){  kitty @ set-colors -a "~/.config/kitty/dark.conf" }

function gitignore() {
    curl -sLw n https://www.toptal.com/developers/gitignore/api/$@
}

taker () { take $(mktemp -d) }
