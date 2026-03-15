scriptname := "walzed"

_default:
    @just --list

# builds a binary, if "release" is present it builds a release
build mode="debug":
    @echo "building as {{ if mode == "release" { "release" } else { "debug" } }}..."
    @crystal build {{ scriptname }}.cr {{ if mode == "release" { "--release --no-debug" } else { "" } }}
    @echo "successfully built release at ./{{ scriptname }}"
    @echo ""

# runs the code without building it
run:
    @echo 'running code!'
    @crystal run {{ scriptname }}.cr
    @echo ""

# cleans the build binaries
clean:
    #!/usr/bin/env bash
    echo "cleaning build files..."
    if [ -e "./{{ scriptname }}" ]; then
        echo "file exists!"
        rm "./{{ scriptname }}"
        echo "file removed!"
    else
        echo "file doesn't exist"
    fi
