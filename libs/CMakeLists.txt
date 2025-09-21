cmake_minimum_required(VERSION 3.20)
project(libs)

set(CMAKE_C_STANDARD 17)
set(CMAKE_CXX_STANDARD 17)

# For macOS. Must be also set in both `manifest.json` files.
set(CMAKE_OSX_DEPLOYMENT_TARGET "13.0")

# Otherwise on Windows static libraries end up in `Debug` or `Release` subfolder.
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${CMAKE_BINARY_DIR})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${CMAKE_BINARY_DIR})

add_library(cimgui STATIC
    cimgui/cimgui.cpp
    cimgui/imgui/imgui.cpp
    cimgui/imgui/imgui_draw.cpp
    cimgui/imgui/imgui_demo.cpp
    cimgui/imgui/imgui_widgets.cpp
    cimgui/imgui/imgui_tables.cpp
)

target_compile_definitions(cimgui PRIVATE IMGUI_DISABLE_OBSOLETE_FUNCTIONS=1)
target_compile_definitions(cimgui PRIVATE IMGUI_IMPL_API=extern\t\"C\"\t)
target_include_directories(cimgui PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/cimgui)

add_library(cimplot STATIC
    cimplot/cimplot.cpp
    cimplot/implot/implot.cpp
    cimplot/implot/implot_demo.cpp
    cimplot/implot/implot_items.cpp
)

# Same defines as used for ImGui.
# For example if you omit `IMGUI_DISABLE_OBSOLETE_FUNCTIONS` here
# then you will get segfault when running example.
target_compile_definitions(cimplot PRIVATE IMGUI_DISABLE_OBSOLETE_FUNCTIONS=1)
target_compile_definitions(cimplot PRIVATE IMGUI_IMPL_API=extern\t\"C\"\t)

target_compile_definitions(cimplot PRIVATE IMPLOT_DISABLE_OBSOLETE_FUNCTIONS=1)
target_include_directories(cimplot PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/cimplot)
target_include_directories(cimplot PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/cimgui)
target_include_directories(cimplot PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/cimgui/imgui)

add_library(filedialog STATIC
    filedialog/ImGuiFileDialog.cpp
)

# Same defines as used for ImGui.
target_compile_definitions(filedialog PRIVATE IMGUI_DISABLE_OBSOLETE_FUNCTIONS=1)
target_compile_definitions(filedialog PRIVATE IMGUI_IMPL_API=extern\t\"C\"\t)

target_include_directories(filedialog PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/cimgui/imgui)

add_library(sokol STATIC
    sokol/sokol.c
)

target_include_directories(sokol PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/cimgui)
if (APPLE)
    target_compile_definitions(sokol PRIVATE SOKOL_METAL=1)
    target_compile_options(sokol PRIVATE -x objective-c)
elseif (WIN32)
    target_compile_definitions(sokol PRIVATE SOKOL_D3D11=1)
else()
    # Assume Linux.
    target_compile_definitions(sokol PRIVATE SOKOL_GLCORE=1)
endif()
