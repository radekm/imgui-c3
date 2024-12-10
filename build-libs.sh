#!/usr/bin/env bash
set -e

script_dir=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
build_dir="$script_dir/build/libs"

mkdir -p "$build_dir"
cd "$build_dir"

cmake "$script_dir/libs" -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release
