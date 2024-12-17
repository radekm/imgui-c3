
Dear ImGui for C3 language. This binding is based on `cimgui` and `cimplot`
and as a backend uses `sokol`.

## Usage

**Copy directories** `libs`, `sokol.c3l` and `imgui.c3l` to you project.
`libs` contains C and C++ code of sokol and Dear ImGui, ImPlot, cimgui and cimplot.
`sokol.c3l` and `imgui.c3l` contain C3 signatures.

`sokol.c3l` and `imgui.c3l` depend on static libraries, so you must build those
libraries before using `sokol.c3l` and `imgui.c3l`.

### Bulding static libraries

Let's build static libraries in directory `build/libs`.

On macOS and Linux:

```bash
mkdir -p build/libs
cd build/libs
cmake ../../libs -DCMAKE_BUILD_TYPE=Release
cmake --build .
cd ../..
```

On Windows:

```cmd
md build\libs
cd build\libs
cmake ..\..\libs
cmake --build . --config Release
cd ..\..
```

### Building C3 code

After you have built static libraries you can build C3 code
which depends on `sokol.c3l` and `imgui.c3l`.
Let's build your code in directory `build`.

On macOS, Linux and Windows:

```bash
cd build
c3c compile -O1 --macos-min-version 13.0 -L libs --libdir .. --lib sokol --lib imgui [your-c3-files] -o [name-of-your-executable]
cd ..
```

Explanation:
- `--macos-min-version 13.0` may be omitted on Linux and Windows.
- `-L libs` specifies the path to static libraries built in the previous step by CMake.
- `--libdir ..` specifies the path to C3 libraries.
- `--lib sokol` and `--lib imgui` says that we want to compile with C3 libraries `sokol.c3l` and `imgui.c3l`.
- `[your-c3-files]` is a placeholder for a list of your C3 source files.
- `[name-of-your-executable]` is a placeholder for a name of your executable.

## Contributions

We accept:

- ✅ Bug reports for the following platforms:
  - macOS on arm64
  - Windows 11 on x64
  - Linux on x64

We don't accept:

- ❌ Pull requests
- ❌ Feature requests

## Maintenance

### Update Dear ImGui, ImPlot

**Update cimgui definitions:**
Go to repository https://github.com/cimgui/cimgui and copy definitions from `generator/output`
locally to `imgui-generator/definitions/cimgui`.

**Update cimplot definitions:**
Go to repository https://github.com/cimgui/cimplot and copy definitions from `generator/output`
locally to `imgui-generator/definitions/cimplot`.

**Update C and C++ sources:**
Go to repositories of Dear ImGui, cimgui, ImPlot and cimplot
and update sources in `libs/cimgui` and `libs/cimplot`.
You may also need to update `sokol_imgui.h` which is in sokol repo
and regenerate `simgui.c3`. Unfortunately at the moment this
means manually modifying `bindgen/gen_all.py` and `bindgen/gen_c3.py`
in sokol repo because they currently don't generate this file `simgui.c3`.
