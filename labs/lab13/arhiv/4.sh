#!/bin/bash

if [ "$1" = "modified" ]; then
    tar -czf archive.tar.gz $(find "$2" -type f -mtime -7)
    echo "Modified files from $2 archived."
else
    tar -czf archive.tar.gz -C "$1" .
    echo "Archived all contents of $1."
fi
