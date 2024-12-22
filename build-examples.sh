#!/usr/bin/env bash
set -e

script_dir=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
build_dir="$script_dir/build"

mkdir -p "$build_dir"
cd "$build_dir"

# Even though we link examples with `--wincrt=none`
# standard library is linked anyway.
#
# When I replace that with `-g0` (to get non-debug CRT) linking fails with:
#
# lld-link: error: duplicate symbol: __report_gsfailure
# >>> defined at D:\a\_work\1\s\src\vctools\crt\vcstartup\src\gs\gs_report.c:217
# >>>            msvcrt.lib(gs_report.obj)
# >>> defined at VCRUNTIME140.dll
c3c compile --wincrt=none -O1 --macos-min-version 13.0 -L "$build_dir/libs" --libdir .. --lib sokol --lib imgui ../examples/plot_example.c3 -o plot_example
c3c compile --wincrt=none -O1 --macos-min-version 13.0 -L "$build_dir/libs" --libdir .. --lib sokol --lib imgui ../examples/file_dialog_example.c3 -o file_dialog_example
