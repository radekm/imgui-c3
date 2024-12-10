cmake_minimum_required(VERSION 3.20)
project(libs)

set (CMAKE_C_STANDARD 17)
set (CMAKE_CXX_STANDARD 17)
set(CMAKE_OSX_DEPLOYMENT_TARGET "11.0")

add_library(cimgui STATIC
    cimgui/cimgui.cpp
    cimgui/imgui/imgui.cpp
    cimgui/imgui/imgui_draw.cpp
    cimgui/imgui/imgui_demo.cpp
    cimgui/imgui/imgui_widgets.cpp
    cimgui/imgui/imgui_tables.cpp
)

target_compile_definitions(cimgui PUBLIC IMGUI_DISABLE_OBSOLETE_FUNCTIONS=1)
target_compile_definitions(cimgui PUBLIC IMGUI_IMPL_API=extern\t\"C\"\t)
target_include_directories(cimgui PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/cimgui)
target_include_directories(cimgui PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/cimgui/imgui)

add_library(sokol STATIC 
    sokol/sokol.c
)

target_include_directories(sokol PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/cimgui)
if (APPLE)
    target_compile_definitions(sokol PUBLIC SOKOL_METAL=1)
    target_compile_options(sokol PRIVATE -x objective-c)
endif()
