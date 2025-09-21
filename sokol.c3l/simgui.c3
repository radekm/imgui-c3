// machine generated, do not edit

module sokol::simgui;
import sokol;

extern fn void setup(SimguiDesc* desc) @extern("simgui_setup");
extern fn void new_frame(SimguiFrameDesc* desc) @extern("simgui_new_frame");
extern fn void render() @extern("simgui_render");
extern fn ulong imtextureid(SgView tex_view) @extern("simgui_imtextureid");
extern fn ulong imtextureid_with_sampler(SgView tex_view, SgSampler smp) @extern("simgui_imtextureid_with_sampler");
extern fn SgView texture_view_from_imtextureid(ulong imtex_id) @extern("simgui_texture_view_from_imtextureid");
extern fn SgSampler sampler_from_imtextureid(ulong imtex_id) @extern("simgui_sampler_from_imtextureid");
extern fn void add_focus_event(bool focus) @extern("simgui_add_focus_event");
extern fn void add_mouse_pos_event(float x, float y) @extern("simgui_add_mouse_pos_event");
extern fn void add_touch_pos_event(float x, float y) @extern("simgui_add_touch_pos_event");
extern fn void add_mouse_button_event(CInt mouse_button, bool down) @extern("simgui_add_mouse_button_event");
extern fn void add_mouse_wheel_event(float wheel_x, float wheel_y) @extern("simgui_add_mouse_wheel_event");
extern fn void add_key_event(CInt imgui_key, bool down) @extern("simgui_add_key_event");
extern fn void add_input_character(uint c) @extern("simgui_add_input_character");
extern fn void add_input_characters_utf8(ZString c) @extern("simgui_add_input_characters_utf8");
extern fn void add_touch_button_event(CInt mouse_button, bool down) @extern("simgui_add_touch_button_event");
extern fn bool handle_event(SappEvent* ev) @extern("simgui_handle_event");
extern fn CInt map_keycode(SappKeycode keycode) @extern("simgui_map_keycode");
extern fn void shutdown() @extern("simgui_shutdown");

enum SimguiLogItem : const int
{
    OK = 0,
    MALLOC_FAILED = 1,
}

struct SimguiAllocator
{
    AllocCb alloc_fn;
    FreeCb free_fn;
    void* user_data;
}

struct SimguiLogger
{
    LogCb func;
    void* user_data;
}

struct SimguiDesc
{
    CInt max_vertices;
    SgPixelFormat color_format;
    SgPixelFormat depth_format;
    CInt sample_count;
    ZString ini_filename;
    bool no_default_font;
    bool disable_paste_override;
    bool disable_set_mouse_cursor;
    bool disable_windows_resize_from_edges;
    bool write_alpha_channel;
    SimguiAllocator allocator;
    SimguiLogger logger;
}

struct SimguiFrameDesc
{
    CInt width;
    CInt height;
    double delta_time;
    float dpi_scale;
}

struct SimguiFontTexDesc
{
    SgFilter min_filter;
    SgFilter mag_filter;
}

alias AllocCb = fn void*(usz, void*);
alias FreeCb = fn void*(usz, void*);
alias LogCb = fn void(ZString, uint, uint, ZString, uint, ZString, void*);

