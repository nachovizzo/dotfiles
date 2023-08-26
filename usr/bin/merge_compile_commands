#!/bin/bash

if compgen -G "**/*compile_commands.json" >/dev/null; then
    # Cleanup
    rm compile_commands.json 2>/dev/null
    rm tmp.json 2>/dev/null

    for json_file in **/*compile_commands.json; do
        echo "Merging $json_file..."
        sed -e '1s/^/[\'$'\n''/' -e '$s/,$/\'$'\n'']/' "$json_file" | sed 's/[][]//g' >>tmp.json
        echo , >>tmp.json
    done

    # Remove last ","
    sed -i '$d' tmp.json

    # Add the fucking square bracktes
    sed -i '1 i\[' tmp.json
    echo ] >>tmp.json

    # Format the json file, if doesn't succeed, then the JSON file is wrong
    if python3 -m json.tool tmp.json >compile_commands.json; then
        echo "Success, results ready in ./compile_commands.json"
    else
        echo "Merging failed"
        rm compile_commands.json 2>/dev/null
    fi

    # Cleanup
    rm tmp.json 2>/dev/null

else
    echo "No compile_commands.json files in $(pwd)"
fi
