#!/bin/bash

target_dir="/path/to/target"

find "$(dirname "$(find /path/to/source -name "docker-compose*" -type f -print -quit)")" -type f -name "docker-compose*" -exec bash -c '
    for file; do
        # Get the relative path of the file
        rel_path="${file#${1}/}"
        
        # Create the target directory structure
        target_path="${2}/${rel_path%/*}"
        mkdir -p "${target_path}"
        
        # Copy the file to the target directory
        cp "${file}" "${target_path}"
    done
' bash {} "$(dirname "$(find /path/to/source -name "docker-compose*" -type f -print -quit)")" "${target_dir}" \;
