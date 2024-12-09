#!/usr/bin/env bash
set -e

script_dir=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
build_dir="$script_dir/build"

mkdir -p "$build_dir"
cd "$build_dir"

c3c compile ../imgui-generator/*.c3 -o imgui-generator

cd "$script_dir"
"$build_dir/imgui-generator"
