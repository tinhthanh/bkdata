#!/bin/bash

target_dir="/www/server/panel/bkdata/dockercompose"

find "$(dirname "$(find / -name "docker-compose*" -type f -print -quit)")" -type f -name "docker-compose*" -exec bash -c '
    for file; do
        # Get the relative path of the file
        rel_path="${file#${1}/}"
        
        # Create the target directory structure
        target_path="${2}/${rel_path%/*}"
        mkdir -p "${target_path}"
        
        # Copy the file to the target directory
        cp "${file}" "${target_path}"
    done
' bash {} "$(dirname "$(find / -name "docker-compose*" -type f -print -quit)")" "${target_dir}" \;
