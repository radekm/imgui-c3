#!/usr/bin/env bash
set -e

script_dir=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
build_dir="$script_dir/build"

mkdir -p "$build_dir"
cd "$build_dir"

c3c compile -O1 --macos-min-version 13.0 -L "$build_dir/libs" --libdir .. --lib sokol --lib imgui ../examples/plot_example.c3 -o plot_example
c3c compile -O1 --macos-min-version 13.0 -L "$build_dir/libs" --libdir .. --lib sokol --lib imgui ../examples/file_dialog_example.c3 -o file_dialog_example