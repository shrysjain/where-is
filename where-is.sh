#!/bin/bash

display_help() {
    echo "Usage: where-is [OPTIONS] <filename>"
    echo "Options:"
    echo "  --help               Display this help message"
    echo "  -e <dir>             Exclude the specified directory from search"
    echo "  --gitignore          Exclude directories/files listed in .gitignore"
    echo "  --verbose            Show verbose output"
    echo "  --ext <extension>    Search for files with a specific extension"
    echo "  -d                   Search for directory names as well"
    exit 0
}

whereis_files() {
    local filename=$1
    local search_path=${2:-.}
    local exclude_dir=$3
    local git_ignore=$4
    local verbose=$5
    local extension=$6
    local search_dirs=$7

    local find_cmd="find \"$search_path\""

    if [ ! -z "$exclude_dir" ]; then
        find_cmd+=" -path \"$exclude_dir\" -prune -o"
    fi

    if [ "$git_ignore" = true ] && [ -e .gitignore ]; then
        while IFS= read -r pattern; do
            find_cmd+=" ! -path \"$pattern\""
        done < .gitignore
        find_cmd+=" -prune -o"
    fi

    if [ ! -z "$extension" ]; then
        find_cmd+=" -type f -name \"*.$extension\""
    else
        find_cmd+=" -type f"
    fi

    if [ "$search_dirs" = true ]; then
        find_cmd+=" -o -type d -name \"$filename\""
    else
        find_cmd+=" -name \"$filename\""
    fi

    if [ "$verbose" = true ]; then
        echo "Running find command: $find_cmd"
    fi

    eval "$find_cmd"
}

while [[ "$1" =~ ^- ]]; do
    case $1 in
        --help)
            display_help
            ;;
        -e)
            shift
            EXCLUDE_DIR=$1
            ;;
        --gitignore)
            GIT_IGNORE=true
            ;;
        --verbose)
            VERBOSE=true
            ;;
        --ext)
            shift
            EXTENSION=$1
            ;;
        -d)
            SEARCH_DIRS=true
            ;;
        *)
            echo "Error: Unknown option $1"
            exit 1
            ;;
    esac
    shift
done

if [ -z "$1" ]; then
    echo "Usage: where-is [OPTIONS] <filename>"
    exit 1
fi

whereis_files "$1" "." "$EXCLUDE_DIR" "$GIT_IGNORE" "$VERBOSE" "$EXTENSION" "$SEARCH_DIRS"
