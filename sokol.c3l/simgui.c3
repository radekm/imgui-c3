// machine generated, do not edit

module sokol::simgui;
import sokol;

extern fn void setup(Desc* desc) @extern("simgui_setup");
extern fn void new_frame(FrameDesc* desc) @extern("simgui_new_frame");
extern fn void render() @extern("simgui_render");
extern fn Image make_image(ImageDesc* desc) @extern("simgui_make_image");
extern fn void destroy_image(Image img) @extern("simgui_destroy_image");
extern fn ImageDesc query_image_desc(Image img) @extern("simgui_query_image_desc");
extern fn ulong imtextureid(Image img) @extern("simgui_imtextureid");
extern fn Image image_from_imtextureid(ulong im_texture_id) @extern("simgui_image_from_imtextureid");
extern fn void add_focus_event(bool focus) @extern("simgui_add_focus_event");
extern fn void add_mouse_pos_event(float x, float y) @extern("simgui_add_mouse_pos_event");
extern fn void add_touch_pos_event(float x, float y) @extern("simgui_add_touch_pos_event");
extern fn void add_mouse_button_event(CInt mouse_button, bool down) @extern("simgui_add_mouse_button_event");
extern fn void add_mouse_wheel_event(float wheel_x, float wheel_y) @extern("simgui_add_mouse_wheel_event");
extern fn void add_key_event(CInt imgui_key, bool down) @extern("simgui_add_key_event");
extern fn void add_input_character(uint c) @extern("simgui_add_input_character");
extern fn void add_input_characters_utf8(ZString c) @extern("simgui_add_input_characters_utf8");
extern fn void add_touch_button_event(CInt mouse_button, bool down) @extern("simgui_add_touch_button_event");
extern fn bool handle_event(sokol::sapp::Event* ev) @extern("simgui_handle_event");
extern fn CInt map_keycode(sokol::sapp::Keycode keycode) @extern("simgui_map_keycode");
extern fn void shutdown() @extern("simgui_shutdown");
extern fn void create_fonts_texture(FontTexDesc* desc) @extern("simgui_create_fonts_texture");
extern fn void destroy_fonts_texture() @extern("simgui_destroy_fonts_texture");

const usz INVALID_ID = 0;

struct Image
{
    uint id;
}

struct ImageDesc
{
    sokol::sg::Image image;
    sokol::sg::Sampler sampler;
}

distinct LogItem = int;
module sokol::simgui::log_item;
const LogItem OK = 0;
const LogItem MALLOC_FAILED = 1;
const LogItem IMAGE_POOL_EXHAUSTED = 2;
module sokol::simgui;
import sokol;

struct Allocator
{
    AllocCb alloc_fn;
    FreeCb free_fn;
    void* user_data;
}

struct Logger
{
    LogCb func;
    void* user_data;
}

struct Desc
{
    CInt max_vertices;
    CInt image_pool_size;
    sokol::sg::PixelFormat color_format;
    sokol::sg::PixelFormat depth_format;
    CInt sample_count;
    ZString ini_filename;
    bool no_default_font;
    bool disable_paste_override;
    bool disable_set_mouse_cursor;
    bool disable_windows_resize_from_edges;
    bool write_alpha_channel;
    Allocator allocator;
    Logger logger;
}

struct FrameDesc
{
    CInt width;
    CInt height;
    double delta_time;
    float dpi_scale;
}

struct FontTexDesc
{
    sokol::sg::Filter min_filter;
    sokol::sg::Filter mag_filter;
}

def AllocCb = fn void*(usz, void*);
def FreeCb = fn void*(usz, void*);
def LogCb = fn void(ZString, uint, uint, ZString, uint, ZString, void*);

