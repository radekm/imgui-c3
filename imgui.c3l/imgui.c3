module ig;
import libc;
distinct ImStbTexteditState = void;
// Manually translated from cimgui.h.
// It should be kept in sync.
struct ImBitArrayForNamedKeys
{
    ImU32[((usz)key::NAMED_KEY_COUNT + 31) >> 5] storage;
}
// Using C3 vectors instead of structs ImVec1, ImVec2 and ImVec4 is more convenient.
// Hopefully their layout is same. We only check that their size is same.
def ImVec1 = float[<1>];
$assert(ImVec1.sizeof == Old_ImVec1.sizeof);
def ImVec2 = float[<2>];
$assert(ImVec2.sizeof == Old_ImVec2.sizeof);
def ImVec4 = float[<4>];
$assert(ImVec4.sizeof == Old_ImVec4.sizeof);
// Following templated types are defined manually.
// Hopefully their layout is same.
struct ImVector
{
    CInt size;
    CInt capacity;
    void* data;
}
struct ImSpan
{
    void* data;
    void* data_end;
}
struct ImPool
{
    ImVector buf;
    ImGuiStorage map;
    ImPoolIdx free_idx;
    ImPoolIdx alive_count;
}
struct ImChunkStream
{
    ImVector buf;
}
def ImWchar16 = ushort;
def ImWchar32 = ulong;
// We don't compile ImGui with IMGUI_USE_WCHAR32 option.
// This means that ImWchar has 2 bytes.
def ImWchar = ImWchar16;
def ImS8 = ichar;
def ImS16 = short;
def ImS32 = int;
def ImS64 = long;
def ImU8 = char;
def ImU16 = ushort;
def ImU32 = uint;
def ImU64 = ulong;
// Aliases for function pointers.
def Settings_ClearAllFn = fn void(ImGuiContext* ctx, ImGuiSettingsHandler* handler);
def Settings_ReadInitFn = fn void(ImGuiContext* ctx, ImGuiSettingsHandler* handler);
def Settings_ReadOpenFn = fn void*(ImGuiContext* ctx, ImGuiSettingsHandler* handler, ZString name);
def Settings_ReadLineFn = fn void(ImGuiContext* ctx, ImGuiSettingsHandler* handler, void* entry, ZString line);
def Settings_ApplyAllFn = fn void(ImGuiContext* ctx, ImGuiSettingsHandler* handler);
def Settings_WriteAllFn = fn void(ImGuiContext* ctx, ImGuiSettingsHandler* handler, ImGuiTextBuffer* out_buf);
def Context_DockNodeWindowMenuHandler = fn void(ImGuiContext* ctx, ImGuiDockNode* node, ImGuiTabBar* tab_bar);
def FontBuilder_Build = fn CBool(ImFontAtlas* atlas);
def Platform_GetClipboardTextFn = fn ZString(ImGuiContext* ctx);
def Platform_SetClipboardTextFn = fn void(ImGuiContext* ctx, ZString text);
def Platform_OpenInShellFn = fn CBool(ImGuiContext* ctx, ZString path);
def Platform_SetImeDataFn = fn void(ImGuiContext* ctx, ImGuiViewport* viewport, ImGuiPlatformImeData* data);
def Platform_WindowActionFn = fn void(ImGuiViewport* vp);
def Platform_SetWindowPosOrSizeFn = fn void(ImGuiViewport* vp, ImVec2 pos_or_size);
def Platform_GetWindowPosOrSizeFn = fn ImVec2(ImGuiViewport* vp);
def Platform_GetWindowWorkAreaInsetsFn = fn ImVec4(ImGuiViewport* vp);
def Platform_GetWindowBoolPropFn = fn CBool(ImGuiViewport* vp);
def Platform_SetWindowTitleFn = fn void(ImGuiViewport* vp, ZString str);
def Platform_SetWindowAlphaFn = fn void(ImGuiViewport* vp, float alpha);
def Platform_RenderActionFn = fn void(ImGuiViewport* vp, void* render_arg);
def Platform_GetWindowDpiScaleFn = fn float(ImGuiViewport* vp);
def Platform_CreateVkSurfaceFn = fn CInt(ImGuiViewport* vp, ImU64 vk_inst, void* vk_allocators, ImU64* out_vk_surface);
def SelectionStorage_AdapterIndexToStorageIdFn = fn ImGuiID(ImGuiSelectionBasicStorage* self, CInt idx);
def SelectionStorage_AdapterSetItemSelectedFn = fn void(ImGuiSelectionExternalStorage* self, CInt idx, CBool selected);
distinct ImBitArrayPtr = ImU32*;
def ImDrawCallback = fn void(ImDrawList* parent_list, ImDrawCmd* cmd);
distinct ImDrawFlags = CInt;
distinct ImDrawIdx = CUShort;
distinct ImDrawListFlags = CInt;
distinct ImFileHandle = libc::CFile;
distinct ImFontAtlasFlags = CInt;
distinct ImGuiActivateFlags = CInt;
distinct ImGuiBackendFlags = CInt;
distinct ImGuiButtonFlags = CInt;
distinct ImGuiChildFlags = CInt;
distinct ImGuiCol = CInt;
distinct ImGuiColorEditFlags = CInt;
distinct ImGuiComboFlags = CInt;
distinct ImGuiCond = CInt;
distinct ImGuiConfigFlags = CInt;
def ImGuiContextHookCallback = fn void(ImGuiContext* ctx, ImGuiContextHook* hook);
distinct ImGuiDataAuthority = CInt;
distinct ImGuiDataType = CInt;
distinct ImGuiDebugLogFlags = CInt;
distinct ImGuiDockNodeFlags = CInt;
distinct ImGuiDragDropFlags = CInt;
def ImGuiErrorCallback = fn void(ImGuiContext* ctx, void* user_data, char* msg);
distinct ImGuiFocusRequestFlags = CInt;
distinct ImGuiFocusedFlags = CInt;
distinct ImGuiHoveredFlags = CInt;
distinct ImGuiID = CUInt;
distinct ImGuiInputFlags = CInt;
def ImGuiInputTextCallback = fn int(ImGuiInputTextCallbackData* data);
distinct ImGuiInputTextFlags = CInt;
distinct ImGuiItemFlags = CInt;
distinct ImGuiItemStatusFlags = CInt;
distinct ImGuiKeyChord = CInt;
distinct ImGuiKeyRoutingIndex = ImS16;
distinct ImGuiLayoutType = CInt;
distinct ImGuiLogFlags = CInt;
def ImGuiMemAllocFunc = fn void*(usz sz, void* user_data);
def ImGuiMemFreeFunc = fn void(void* ptr, void* user_data);
distinct ImGuiMouseButton = CInt;
distinct ImGuiMouseCursor = CInt;
distinct ImGuiMultiSelectFlags = CInt;
distinct ImGuiNavMoveFlags = CInt;
distinct ImGuiNavRenderCursorFlags = CInt;
distinct ImGuiNextItemDataFlags = CInt;
distinct ImGuiNextWindowDataFlags = CInt;
distinct ImGuiOldColumnFlags = CInt;
distinct ImGuiPopupFlags = CInt;
distinct ImGuiScrollFlags = CInt;
distinct ImGuiSelectableFlags = CInt;
distinct ImGuiSelectionUserData = ImS64;
distinct ImGuiSeparatorFlags = CInt;
def ImGuiSizeCallback = fn void(ImGuiSizeCallbackData* data);
distinct ImGuiSliderFlags = CInt;
distinct ImGuiStyleVar = CInt;
distinct ImGuiTabBarFlags = CInt;
distinct ImGuiTabItemFlags = CInt;
distinct ImGuiTableBgTarget = CInt;
distinct ImGuiTableColumnFlags = CInt;
distinct ImGuiTableColumnIdx = ImS16;
distinct ImGuiTableDrawChannelIdx = ImU16;
distinct ImGuiTableFlags = CInt;
distinct ImGuiTableRowFlags = CInt;
distinct ImGuiTextFlags = CInt;
distinct ImGuiTooltipFlags = CInt;
distinct ImGuiTreeNodeFlags = CInt;
distinct ImGuiTypingSelectFlags = CInt;
distinct ImGuiViewportFlags = CInt;
distinct ImGuiWindowFlags = CInt;
distinct ImGuiWindowRefreshFlags = CInt;
distinct ImPoolIdx = CInt;
distinct ImTextureID = ImU64;
module ig::draw_flags;
const ImDrawFlags NONE = 0;  // 0
const ImDrawFlags CLOSED = 1;  // 1 << 0
const ImDrawFlags ROUND_CORNERS_TOP_LEFT = 16;  // 1 << 4
const ImDrawFlags ROUND_CORNERS_TOP_RIGHT = 32;  // 1 << 5
const ImDrawFlags ROUND_CORNERS_BOTTOM_LEFT = 64;  // 1 << 6
const ImDrawFlags ROUND_CORNERS_BOTTOM_RIGHT = 128;  // 1 << 7
const ImDrawFlags ROUND_CORNERS_NONE = 256;  // 1 << 8
const ImDrawFlags ROUND_CORNERS_TOP = 48;  // ImDrawFlags_RoundCornersTopLeft | ImDrawFlags_RoundCornersTopRight
const ImDrawFlags ROUND_CORNERS_BOTTOM = 192;  // ImDrawFlags_RoundCornersBottomLeft | ImDrawFlags_RoundCornersBottomRight
const ImDrawFlags ROUND_CORNERS_LEFT = 80;  // ImDrawFlags_RoundCornersBottomLeft | ImDrawFlags_RoundCornersTopLeft
const ImDrawFlags ROUND_CORNERS_RIGHT = 160;  // ImDrawFlags_RoundCornersBottomRight | ImDrawFlags_RoundCornersTopRight
const ImDrawFlags ROUND_CORNERS_ALL = 240;  // ImDrawFlags_RoundCornersTopLeft | ImDrawFlags_RoundCornersTopRight | ImDrawFlags_RoundCornersBottomLeft | ImDrawFlags_RoundCornersBottomRight
const ImDrawFlags ROUND_CORNERS_DEFAULT_ = 240;  // ImDrawFlags_RoundCornersAll
const ImDrawFlags ROUND_CORNERS_MASK_ = 496;  // ImDrawFlags_RoundCornersAll | ImDrawFlags_RoundCornersNone
module ig;
module ig::draw_list_flags;
const ImDrawListFlags NONE = 0;  // 0
const ImDrawListFlags ANTI_ALIASED_LINES = 1;  // 1 << 0
const ImDrawListFlags ANTI_ALIASED_LINES_USE_TEX = 2;  // 1 << 1
const ImDrawListFlags ANTI_ALIASED_FILL = 4;  // 1 << 2
const ImDrawListFlags ALLOW_VTX_OFFSET = 8;  // 1 << 3
module ig;
module ig::font_atlas_flags;
const ImFontAtlasFlags NONE = 0;  // 0
const ImFontAtlasFlags NO_POWER_OF_TWO_HEIGHT = 1;  // 1 << 0
const ImFontAtlasFlags NO_MOUSE_CURSORS = 2;  // 1 << 1
const ImFontAtlasFlags NO_BAKED_LINES = 4;  // 1 << 2
module ig;
module ig::activate_flags;
const ImGuiActivateFlags NONE = 0;  // 0
const ImGuiActivateFlags PREFER_INPUT = 1;  // 1 << 0
const ImGuiActivateFlags PREFER_TWEAK = 2;  // 1 << 1
const ImGuiActivateFlags TRY_TO_PRESERVE_STATE = 4;  // 1 << 2
const ImGuiActivateFlags FROM_TABBING = 8;  // 1 << 3
const ImGuiActivateFlags FROM_SHORTCUT = 16;  // 1 << 4
module ig;
distinct ImGuiAxis = CInt;
module ig::axis;
const ImGuiAxis NONE = -1;  // -1
const ImGuiAxis X = 0;  // 0
const ImGuiAxis Y = 1;  // 1
module ig;
module ig::backend_flags;
const ImGuiBackendFlags NONE = 0;  // 0
const ImGuiBackendFlags HAS_GAMEPAD = 1;  // 1 << 0
const ImGuiBackendFlags HAS_MOUSE_CURSORS = 2;  // 1 << 1
const ImGuiBackendFlags HAS_SET_MOUSE_POS = 4;  // 1 << 2
const ImGuiBackendFlags RENDERER_HAS_VTX_OFFSET = 8;  // 1 << 3
const ImGuiBackendFlags PLATFORM_HAS_VIEWPORTS = 1024;  // 1 << 10
const ImGuiBackendFlags HAS_MOUSE_HOVERED_VIEWPORT = 2048;  // 1 << 11
const ImGuiBackendFlags RENDERER_HAS_VIEWPORTS = 4096;  // 1 << 12
module ig;
module ig::button_flags;
const ImGuiButtonFlags NONE = 0;  // 0
const ImGuiButtonFlags MOUSE_BUTTON_LEFT = 1;  // 1 << 0
const ImGuiButtonFlags MOUSE_BUTTON_RIGHT = 2;  // 1 << 1
const ImGuiButtonFlags MOUSE_BUTTON_MIDDLE = 4;  // 1 << 2
const ImGuiButtonFlags MOUSE_BUTTON_MASK_ = 7;  // ImGuiButtonFlags_MouseButtonLeft | ImGuiButtonFlags_MouseButtonRight | ImGuiButtonFlags_MouseButtonMiddle
const ImGuiButtonFlags ENABLE_NAV = 8;  // 1 << 3
module ig;
module ig::child_flags;
const ImGuiChildFlags NONE = 0;  // 0
const ImGuiChildFlags BORDERS = 1;  // 1 << 0
const ImGuiChildFlags ALWAYS_USE_WINDOW_PADDING = 2;  // 1 << 1
const ImGuiChildFlags RESIZE_X = 4;  // 1 << 2
const ImGuiChildFlags RESIZE_Y = 8;  // 1 << 3
const ImGuiChildFlags AUTO_RESIZE_X = 16;  // 1 << 4
const ImGuiChildFlags AUTO_RESIZE_Y = 32;  // 1 << 5
const ImGuiChildFlags ALWAYS_AUTO_RESIZE = 64;  // 1 << 6
const ImGuiChildFlags FRAME_STYLE = 128;  // 1 << 7
const ImGuiChildFlags NAV_FLATTENED = 256;  // 1 << 8
module ig;
module ig::col;
const ImGuiCol TEXT = 0;  // 0
const ImGuiCol TEXT_DISABLED = 1;  // 1
const ImGuiCol WINDOW_BG = 2;  // 2
const ImGuiCol CHILD_BG = 3;  // 3
const ImGuiCol POPUP_BG = 4;  // 4
const ImGuiCol BORDER = 5;  // 5
const ImGuiCol BORDER_SHADOW = 6;  // 6
const ImGuiCol FRAME_BG = 7;  // 7
const ImGuiCol FRAME_BG_HOVERED = 8;  // 8
const ImGuiCol FRAME_BG_ACTIVE = 9;  // 9
const ImGuiCol TITLE_BG = 10;  // 10
const ImGuiCol TITLE_BG_ACTIVE = 11;  // 11
const ImGuiCol TITLE_BG_COLLAPSED = 12;  // 12
const ImGuiCol MENU_BAR_BG = 13;  // 13
const ImGuiCol SCROLLBAR_BG = 14;  // 14
const ImGuiCol SCROLLBAR_GRAB = 15;  // 15
const ImGuiCol SCROLLBAR_GRAB_HOVERED = 16;  // 16
const ImGuiCol SCROLLBAR_GRAB_ACTIVE = 17;  // 17
const ImGuiCol CHECK_MARK = 18;  // 18
const ImGuiCol SLIDER_GRAB = 19;  // 19
const ImGuiCol SLIDER_GRAB_ACTIVE = 20;  // 20
const ImGuiCol BUTTON = 21;  // 21
const ImGuiCol BUTTON_HOVERED = 22;  // 22
const ImGuiCol BUTTON_ACTIVE = 23;  // 23
const ImGuiCol HEADER = 24;  // 24
const ImGuiCol HEADER_HOVERED = 25;  // 25
const ImGuiCol HEADER_ACTIVE = 26;  // 26
const ImGuiCol SEPARATOR = 27;  // 27
const ImGuiCol SEPARATOR_HOVERED = 28;  // 28
const ImGuiCol SEPARATOR_ACTIVE = 29;  // 29
const ImGuiCol RESIZE_GRIP = 30;  // 30
const ImGuiCol RESIZE_GRIP_HOVERED = 31;  // 31
const ImGuiCol RESIZE_GRIP_ACTIVE = 32;  // 32
const ImGuiCol TAB_HOVERED = 33;  // 33
const ImGuiCol TAB = 34;  // 34
const ImGuiCol TAB_SELECTED = 35;  // 35
const ImGuiCol TAB_SELECTED_OVERLINE = 36;  // 36
const ImGuiCol TAB_DIMMED = 37;  // 37
const ImGuiCol TAB_DIMMED_SELECTED = 38;  // 38
const ImGuiCol TAB_DIMMED_SELECTED_OVERLINE = 39;  // 39
const ImGuiCol DOCKING_PREVIEW = 40;  // 40
const ImGuiCol DOCKING_EMPTY_BG = 41;  // 41
const ImGuiCol PLOT_LINES = 42;  // 42
const ImGuiCol PLOT_LINES_HOVERED = 43;  // 43
const ImGuiCol PLOT_HISTOGRAM = 44;  // 44
const ImGuiCol PLOT_HISTOGRAM_HOVERED = 45;  // 45
const ImGuiCol TABLE_HEADER_BG = 46;  // 46
const ImGuiCol TABLE_BORDER_STRONG = 47;  // 47
const ImGuiCol TABLE_BORDER_LIGHT = 48;  // 48
const ImGuiCol TABLE_ROW_BG = 49;  // 49
const ImGuiCol TABLE_ROW_BG_ALT = 50;  // 50
const ImGuiCol TEXT_LINK = 51;  // 51
const ImGuiCol TEXT_SELECTED_BG = 52;  // 52
const ImGuiCol DRAG_DROP_TARGET = 53;  // 53
const ImGuiCol NAV_CURSOR = 54;  // 54
const ImGuiCol NAV_WINDOWING_HIGHLIGHT = 55;  // 55
const ImGuiCol NAV_WINDOWING_DIM_BG = 56;  // 56
const ImGuiCol MODAL_WINDOW_DIM_BG = 57;  // 57
const ImGuiCol COUNT = 58;  // 58
module ig;
module ig::color_edit_flags;
const ImGuiColorEditFlags NONE = 0;  // 0
const ImGuiColorEditFlags NO_ALPHA = 2;  // 1 << 1
const ImGuiColorEditFlags NO_PICKER = 4;  // 1 << 2
const ImGuiColorEditFlags NO_OPTIONS = 8;  // 1 << 3
const ImGuiColorEditFlags NO_SMALL_PREVIEW = 16;  // 1 << 4
const ImGuiColorEditFlags NO_INPUTS = 32;  // 1 << 5
const ImGuiColorEditFlags NO_TOOLTIP = 64;  // 1 << 6
const ImGuiColorEditFlags NO_LABEL = 128;  // 1 << 7
const ImGuiColorEditFlags NO_SIDE_PREVIEW = 256;  // 1 << 8
const ImGuiColorEditFlags NO_DRAG_DROP = 512;  // 1 << 9
const ImGuiColorEditFlags NO_BORDER = 1024;  // 1 << 10
const ImGuiColorEditFlags ALPHA_BAR = 65536;  // 1 << 16
const ImGuiColorEditFlags ALPHA_PREVIEW = 131072;  // 1 << 17
const ImGuiColorEditFlags ALPHA_PREVIEW_HALF = 262144;  // 1 << 18
const ImGuiColorEditFlags HDR = 524288;  // 1 << 19
const ImGuiColorEditFlags DISPLAY_RGB = 1048576;  // 1 << 20
const ImGuiColorEditFlags DISPLAY_HSV = 2097152;  // 1 << 21
const ImGuiColorEditFlags DISPLAY_HEX = 4194304;  // 1 << 22
const ImGuiColorEditFlags UINT8 = 8388608;  // 1 << 23
const ImGuiColorEditFlags FLOAT = 16777216;  // 1 << 24
const ImGuiColorEditFlags PICKER_HUE_BAR = 33554432;  // 1 << 25
const ImGuiColorEditFlags PICKER_HUE_WHEEL = 67108864;  // 1 << 26
const ImGuiColorEditFlags INPUT_RGB = 134217728;  // 1 << 27
const ImGuiColorEditFlags INPUT_HSV = 268435456;  // 1 << 28
const ImGuiColorEditFlags DEFAULT_OPTIONS_ = 177209344;  // ImGuiColorEditFlags_Uint8 | ImGuiColorEditFlags_DisplayRGB | ImGuiColorEditFlags_InputRGB | ImGuiColorEditFlags_PickerHueBar
const ImGuiColorEditFlags DISPLAY_MASK_ = 7340032;  // ImGuiColorEditFlags_DisplayRGB | ImGuiColorEditFlags_DisplayHSV | ImGuiColorEditFlags_DisplayHex
const ImGuiColorEditFlags DATA_TYPE_MASK_ = 25165824;  // ImGuiColorEditFlags_Uint8 | ImGuiColorEditFlags_Float
const ImGuiColorEditFlags PICKER_MASK_ = 100663296;  // ImGuiColorEditFlags_PickerHueWheel | ImGuiColorEditFlags_PickerHueBar
const ImGuiColorEditFlags INPUT_MASK_ = 402653184;  // ImGuiColorEditFlags_InputRGB | ImGuiColorEditFlags_InputHSV
module ig;
module ig::combo_flags;
const ImGuiComboFlags NONE = 0;  // 0
const ImGuiComboFlags POPUP_ALIGN_LEFT = 1;  // 1 << 0
const ImGuiComboFlags HEIGHT_SMALL = 2;  // 1 << 1
const ImGuiComboFlags HEIGHT_REGULAR = 4;  // 1 << 2
const ImGuiComboFlags HEIGHT_LARGE = 8;  // 1 << 3
const ImGuiComboFlags HEIGHT_LARGEST = 16;  // 1 << 4
const ImGuiComboFlags NO_ARROW_BUTTON = 32;  // 1 << 5
const ImGuiComboFlags NO_PREVIEW = 64;  // 1 << 6
const ImGuiComboFlags WIDTH_FIT_PREVIEW = 128;  // 1 << 7
const ImGuiComboFlags HEIGHT_MASK_ = 30;  // ImGuiComboFlags_HeightSmall | ImGuiComboFlags_HeightRegular | ImGuiComboFlags_HeightLarge | ImGuiComboFlags_HeightLargest
module ig;
module ig::cond;
const ImGuiCond NONE = 0;  // 0
const ImGuiCond ALWAYS = 1;  // 1 << 0
const ImGuiCond ONCE = 2;  // 1 << 1
const ImGuiCond FIRST_USE_EVER = 4;  // 1 << 2
const ImGuiCond APPEARING = 8;  // 1 << 3
module ig;
module ig::config_flags;
const ImGuiConfigFlags NONE = 0;  // 0
const ImGuiConfigFlags NAV_ENABLE_KEYBOARD = 1;  // 1 << 0
const ImGuiConfigFlags NAV_ENABLE_GAMEPAD = 2;  // 1 << 1
const ImGuiConfigFlags NO_MOUSE = 16;  // 1 << 4
const ImGuiConfigFlags NO_MOUSE_CURSOR_CHANGE = 32;  // 1 << 5
const ImGuiConfigFlags NO_KEYBOARD = 64;  // 1 << 6
const ImGuiConfigFlags DOCKING_ENABLE = 128;  // 1 << 7
const ImGuiConfigFlags VIEWPORTS_ENABLE = 1024;  // 1 << 10
const ImGuiConfigFlags DPI_ENABLE_SCALE_VIEWPORTS = 16384;  // 1 << 14
const ImGuiConfigFlags DPI_ENABLE_SCALE_FONTS = 32768;  // 1 << 15
const ImGuiConfigFlags IS_SRGB = 1048576;  // 1 << 20
const ImGuiConfigFlags IS_TOUCH_SCREEN = 2097152;  // 1 << 21
module ig;
distinct ImGuiContextHookType = CInt;
module ig::context_hook_type;
const ImGuiContextHookType NEW_FRAME_PRE = 0;  // 0
const ImGuiContextHookType NEW_FRAME_POST = 1;  // 1
const ImGuiContextHookType END_FRAME_PRE = 2;  // 2
const ImGuiContextHookType END_FRAME_POST = 3;  // 3
const ImGuiContextHookType RENDER_PRE = 4;  // 4
const ImGuiContextHookType RENDER_POST = 5;  // 5
const ImGuiContextHookType SHUTDOWN = 6;  // 6
const ImGuiContextHookType PENDING_REMOVAL_ = 7;  // 7
module ig;
module ig::data_authority;
const ImGuiDataAuthority AUTO = 0;  // 0
const ImGuiDataAuthority DOCK_NODE = 1;  // 1
const ImGuiDataAuthority WINDOW = 2;  // 2
module ig;
module ig::data_type;
const ImGuiDataType S8 = 0;  // 0
const ImGuiDataType U8 = 1;  // 1
const ImGuiDataType S16 = 2;  // 2
const ImGuiDataType U16 = 3;  // 3
const ImGuiDataType S32 = 4;  // 4
const ImGuiDataType U32 = 5;  // 5
const ImGuiDataType S64 = 6;  // 6
const ImGuiDataType U64 = 7;  // 7
const ImGuiDataType FLOAT = 8;  // 8
const ImGuiDataType DOUBLE = 9;  // 9
const ImGuiDataType BOOL = 10;  // 10
const ImGuiDataType COUNT = 11;  // 11
module ig;
module ig::debug_log_flags;
const ImGuiDebugLogFlags NONE = 0;  // 0
const ImGuiDebugLogFlags EVENT_ERROR = 1;  // 1 << 0
const ImGuiDebugLogFlags EVENT_ACTIVE_ID = 2;  // 1 << 1
const ImGuiDebugLogFlags EVENT_FOCUS = 4;  // 1 << 2
const ImGuiDebugLogFlags EVENT_POPUP = 8;  // 1 << 3
const ImGuiDebugLogFlags EVENT_NAV = 16;  // 1 << 4
const ImGuiDebugLogFlags EVENT_CLIPPER = 32;  // 1 << 5
const ImGuiDebugLogFlags EVENT_SELECTION = 64;  // 1 << 6
const ImGuiDebugLogFlags EVENT_IO = 128;  // 1 << 7
const ImGuiDebugLogFlags EVENT_INPUT_ROUTING = 256;  // 1 << 8
const ImGuiDebugLogFlags EVENT_DOCKING = 512;  // 1 << 9
const ImGuiDebugLogFlags EVENT_VIEWPORT = 1024;  // 1 << 10
const ImGuiDebugLogFlags EVENT_MASK_ = 2047;  // ImGuiDebugLogFlags_EventError | ImGuiDebugLogFlags_EventActiveId | ImGuiDebugLogFlags_EventFocus | ImGuiDebugLogFlags_EventPopup | ImGuiDebugLogFlags_EventNav | ImGuiDebugLogFlags_EventClipper | ImGuiDebugLogFlags_EventSelection | ImGuiDebugLogFlags_EventIO | ImGuiDebugLogFlags_EventInputRouting | ImGuiDebugLogFlags_EventDocking | ImGuiDebugLogFlags_EventViewport
const ImGuiDebugLogFlags OUTPUT_TO_TTY = 1048576;  // 1 << 20
const ImGuiDebugLogFlags OUTPUT_TO_TEST_ENGINE = 2097152;  // 1 << 21
module ig;
distinct ImGuiDir = CInt;
module ig::dir;
const ImGuiDir NONE = -1;  // -1
const ImGuiDir LEFT = 0;  // 0
const ImGuiDir RIGHT = 1;  // 1
const ImGuiDir UP = 2;  // 2
const ImGuiDir DOWN = 3;  // 3
const ImGuiDir COUNT = 4;  // 4
module ig;
module ig::dock_node_flags;
const ImGuiDockNodeFlags NONE = 0;  // 0
const ImGuiDockNodeFlags KEEP_ALIVE_ONLY = 1;  // 1 << 0
const ImGuiDockNodeFlags NO_DOCKING_OVER_CENTRAL_NODE = 4;  // 1 << 2
const ImGuiDockNodeFlags PASSTHRU_CENTRAL_NODE = 8;  // 1 << 3
const ImGuiDockNodeFlags NO_DOCKING_SPLIT = 16;  // 1 << 4
const ImGuiDockNodeFlags NO_RESIZE = 32;  // 1 << 5
const ImGuiDockNodeFlags AUTO_HIDE_TAB_BAR = 64;  // 1 << 6
const ImGuiDockNodeFlags NO_UNDOCKING = 128;  // 1 << 7
module ig;
distinct ImGuiDockNodeState = CInt;
module ig::dock_node_state;
const ImGuiDockNodeState UNKNOWN = 0;  // 0
const ImGuiDockNodeState HOST_WINDOW_HIDDEN_BECAUSE_SINGLE_WINDOW = 1;  // 1
const ImGuiDockNodeState HOST_WINDOW_HIDDEN_BECAUSE_WINDOWS_ARE_RESIZING = 2;  // 2
const ImGuiDockNodeState HOST_WINDOW_VISIBLE = 3;  // 3
module ig;
module ig::drag_drop_flags;
const ImGuiDragDropFlags NONE = 0;  // 0
const ImGuiDragDropFlags SOURCE_NO_PREVIEW_TOOLTIP = 1;  // 1 << 0
const ImGuiDragDropFlags SOURCE_NO_DISABLE_HOVER = 2;  // 1 << 1
const ImGuiDragDropFlags SOURCE_NO_HOLD_TO_OPEN_OTHERS = 4;  // 1 << 2
const ImGuiDragDropFlags SOURCE_ALLOW_NULL_ID = 8;  // 1 << 3
const ImGuiDragDropFlags SOURCE_EXTERN = 16;  // 1 << 4
const ImGuiDragDropFlags PAYLOAD_AUTO_EXPIRE = 32;  // 1 << 5
const ImGuiDragDropFlags PAYLOAD_NO_CROSS_CONTEXT = 64;  // 1 << 6
const ImGuiDragDropFlags PAYLOAD_NO_CROSS_PROCESS = 128;  // 1 << 7
const ImGuiDragDropFlags ACCEPT_BEFORE_DELIVERY = 1024;  // 1 << 10
const ImGuiDragDropFlags ACCEPT_NO_DRAW_DEFAULT_RECT = 2048;  // 1 << 11
const ImGuiDragDropFlags ACCEPT_NO_PREVIEW_TOOLTIP = 4096;  // 1 << 12
const ImGuiDragDropFlags ACCEPT_PEEK_ONLY = 3072;  // ImGuiDragDropFlags_AcceptBeforeDelivery | ImGuiDragDropFlags_AcceptNoDrawDefaultRect
module ig;
module ig::focus_request_flags;
const ImGuiFocusRequestFlags NONE = 0;  // 0
const ImGuiFocusRequestFlags RESTORE_FOCUSED_CHILD = 1;  // 1 << 0
const ImGuiFocusRequestFlags UNLESS_BELOW_MODAL = 2;  // 1 << 1
module ig;
module ig::focused_flags;
const ImGuiFocusedFlags NONE = 0;  // 0
const ImGuiFocusedFlags CHILD_WINDOWS = 1;  // 1 << 0
const ImGuiFocusedFlags ROOT_WINDOW = 2;  // 1 << 1
const ImGuiFocusedFlags ANY_WINDOW = 4;  // 1 << 2
const ImGuiFocusedFlags NO_POPUP_HIERARCHY = 8;  // 1 << 3
const ImGuiFocusedFlags DOCK_HIERARCHY = 16;  // 1 << 4
const ImGuiFocusedFlags ROOT_AND_CHILD_WINDOWS = 3;  // ImGuiFocusedFlags_RootWindow | ImGuiFocusedFlags_ChildWindows
module ig;
distinct ImGuiFreeTypeBuilderFlags = CInt;
module ig::free_type_builder_flags;
const ImGuiFreeTypeBuilderFlags NO_HINTING = 1;  // 1 << 0
const ImGuiFreeTypeBuilderFlags NO_AUTO_HINT = 2;  // 1 << 1
const ImGuiFreeTypeBuilderFlags FORCE_AUTO_HINT = 4;  // 1 << 2
const ImGuiFreeTypeBuilderFlags LIGHT_HINTING = 8;  // 1 << 3
const ImGuiFreeTypeBuilderFlags MONO_HINTING = 16;  // 1 << 4
const ImGuiFreeTypeBuilderFlags BOLD = 32;  // 1 << 5
const ImGuiFreeTypeBuilderFlags OBLIQUE = 64;  // 1 << 6
const ImGuiFreeTypeBuilderFlags MONOCHROME = 128;  // 1 << 7
const ImGuiFreeTypeBuilderFlags LOAD_COLOR = 256;  // 1 << 8
const ImGuiFreeTypeBuilderFlags BITMAP = 512;  // 1 << 9
module ig;
module ig::hovered_flags;
const ImGuiHoveredFlags NONE = 0;  // 0
const ImGuiHoveredFlags CHILD_WINDOWS = 1;  // 1 << 0
const ImGuiHoveredFlags ROOT_WINDOW = 2;  // 1 << 1
const ImGuiHoveredFlags ANY_WINDOW = 4;  // 1 << 2
const ImGuiHoveredFlags NO_POPUP_HIERARCHY = 8;  // 1 << 3
const ImGuiHoveredFlags DOCK_HIERARCHY = 16;  // 1 << 4
const ImGuiHoveredFlags ALLOW_WHEN_BLOCKED_BY_POPUP = 32;  // 1 << 5
const ImGuiHoveredFlags ALLOW_WHEN_BLOCKED_BY_ACTIVE_ITEM = 128;  // 1 << 7
const ImGuiHoveredFlags ALLOW_WHEN_OVERLAPPED_BY_ITEM = 256;  // 1 << 8
const ImGuiHoveredFlags ALLOW_WHEN_OVERLAPPED_BY_WINDOW = 512;  // 1 << 9
const ImGuiHoveredFlags ALLOW_WHEN_DISABLED = 1024;  // 1 << 10
const ImGuiHoveredFlags NO_NAV_OVERRIDE = 2048;  // 1 << 11
const ImGuiHoveredFlags ALLOW_WHEN_OVERLAPPED = 768;  // ImGuiHoveredFlags_AllowWhenOverlappedByItem | ImGuiHoveredFlags_AllowWhenOverlappedByWindow
const ImGuiHoveredFlags RECT_ONLY = 928;  // ImGuiHoveredFlags_AllowWhenBlockedByPopup | ImGuiHoveredFlags_AllowWhenBlockedByActiveItem | ImGuiHoveredFlags_AllowWhenOverlapped
const ImGuiHoveredFlags ROOT_AND_CHILD_WINDOWS = 3;  // ImGuiHoveredFlags_RootWindow | ImGuiHoveredFlags_ChildWindows
const ImGuiHoveredFlags FOR_TOOLTIP = 4096;  // 1 << 12
const ImGuiHoveredFlags STATIONARY = 8192;  // 1 << 13
const ImGuiHoveredFlags DELAY_NONE = 16384;  // 1 << 14
const ImGuiHoveredFlags DELAY_SHORT = 32768;  // 1 << 15
const ImGuiHoveredFlags DELAY_NORMAL = 65536;  // 1 << 16
const ImGuiHoveredFlags NO_SHARED_DELAY = 131072;  // 1 << 17
module ig;
distinct ImGuiInputEventType = CInt;
module ig::input_event_type;
const ImGuiInputEventType NONE = 0;  // 0
const ImGuiInputEventType MOUSE_POS = 1;  // 1
const ImGuiInputEventType MOUSE_WHEEL = 2;  // 2
const ImGuiInputEventType MOUSE_BUTTON = 3;  // 3
const ImGuiInputEventType MOUSE_VIEWPORT = 4;  // 4
const ImGuiInputEventType KEY = 5;  // 5
const ImGuiInputEventType TEXT = 6;  // 6
const ImGuiInputEventType FOCUS = 7;  // 7
const ImGuiInputEventType COUNT = 8;  // 8
module ig;
module ig::input_flags;
const ImGuiInputFlags NONE = 0;  // 0
const ImGuiInputFlags REPEAT = 1;  // 1 << 0
const ImGuiInputFlags ROUTE_ACTIVE = 1024;  // 1 << 10
const ImGuiInputFlags ROUTE_FOCUSED = 2048;  // 1 << 11
const ImGuiInputFlags ROUTE_GLOBAL = 4096;  // 1 << 12
const ImGuiInputFlags ROUTE_ALWAYS = 8192;  // 1 << 13
const ImGuiInputFlags ROUTE_OVER_FOCUSED = 16384;  // 1 << 14
const ImGuiInputFlags ROUTE_OVER_ACTIVE = 32768;  // 1 << 15
const ImGuiInputFlags ROUTE_UNLESS_BG_FOCUSED = 65536;  // 1 << 16
const ImGuiInputFlags ROUTE_FROM_ROOT_WINDOW = 131072;  // 1 << 17
const ImGuiInputFlags TOOLTIP = 262144;  // 1 << 18
module ig;
distinct ImGuiInputSource = CInt;
module ig::input_source;
const ImGuiInputSource NONE = 0;  // 0
const ImGuiInputSource MOUSE = 1;  // 1
const ImGuiInputSource KEYBOARD = 2;  // 2
const ImGuiInputSource GAMEPAD = 3;  // 3
const ImGuiInputSource COUNT = 4;  // 4
module ig;
module ig::input_text_flags;
const ImGuiInputTextFlags NONE = 0;  // 0
const ImGuiInputTextFlags CHARS_DECIMAL = 1;  // 1 << 0
const ImGuiInputTextFlags CHARS_HEXADECIMAL = 2;  // 1 << 1
const ImGuiInputTextFlags CHARS_SCIENTIFIC = 4;  // 1 << 2
const ImGuiInputTextFlags CHARS_UPPERCASE = 8;  // 1 << 3
const ImGuiInputTextFlags CHARS_NO_BLANK = 16;  // 1 << 4
const ImGuiInputTextFlags ALLOW_TAB_INPUT = 32;  // 1 << 5
const ImGuiInputTextFlags ENTER_RETURNS_TRUE = 64;  // 1 << 6
const ImGuiInputTextFlags ESCAPE_CLEARS_ALL = 128;  // 1 << 7
const ImGuiInputTextFlags CTRL_ENTER_FOR_NEW_LINE = 256;  // 1 << 8
const ImGuiInputTextFlags READ_ONLY = 512;  // 1 << 9
const ImGuiInputTextFlags PASSWORD = 1024;  // 1 << 10
const ImGuiInputTextFlags ALWAYS_OVERWRITE = 2048;  // 1 << 11
const ImGuiInputTextFlags AUTO_SELECT_ALL = 4096;  // 1 << 12
const ImGuiInputTextFlags PARSE_EMPTY_REF_VAL = 8192;  // 1 << 13
const ImGuiInputTextFlags DISPLAY_EMPTY_REF_VAL = 16384;  // 1 << 14
const ImGuiInputTextFlags NO_HORIZONTAL_SCROLL = 32768;  // 1 << 15
const ImGuiInputTextFlags NO_UNDO_REDO = 65536;  // 1 << 16
const ImGuiInputTextFlags CALLBACK_COMPLETION = 131072;  // 1 << 17
const ImGuiInputTextFlags CALLBACK_HISTORY = 262144;  // 1 << 18
const ImGuiInputTextFlags CALLBACK_ALWAYS = 524288;  // 1 << 19
const ImGuiInputTextFlags CALLBACK_CHAR_FILTER = 1048576;  // 1 << 20
const ImGuiInputTextFlags CALLBACK_RESIZE = 2097152;  // 1 << 21
const ImGuiInputTextFlags CALLBACK_EDIT = 4194304;  // 1 << 22
module ig;
module ig::item_flags;
const ImGuiItemFlags NONE = 0;  // 0
const ImGuiItemFlags NO_TAB_STOP = 1;  // 1 << 0
const ImGuiItemFlags NO_NAV = 2;  // 1 << 1
const ImGuiItemFlags NO_NAV_DEFAULT_FOCUS = 4;  // 1 << 2
const ImGuiItemFlags BUTTON_REPEAT = 8;  // 1 << 3
const ImGuiItemFlags AUTO_CLOSE_POPUPS = 16;  // 1 << 4
const ImGuiItemFlags ALLOW_DUPLICATE_ID = 32;  // 1 << 5
module ig;
module ig::item_status_flags;
const ImGuiItemStatusFlags NONE = 0;  // 0
const ImGuiItemStatusFlags HOVERED_RECT = 1;  // 1 << 0
const ImGuiItemStatusFlags HAS_DISPLAY_RECT = 2;  // 1 << 1
const ImGuiItemStatusFlags EDITED = 4;  // 1 << 2
const ImGuiItemStatusFlags TOGGLED_SELECTION = 8;  // 1 << 3
const ImGuiItemStatusFlags TOGGLED_OPEN = 16;  // 1 << 4
const ImGuiItemStatusFlags HAS_DEACTIVATED = 32;  // 1 << 5
const ImGuiItemStatusFlags DEACTIVATED = 64;  // 1 << 6
const ImGuiItemStatusFlags HOVERED_WINDOW = 128;  // 1 << 7
const ImGuiItemStatusFlags VISIBLE = 256;  // 1 << 8
const ImGuiItemStatusFlags HAS_CLIP_RECT = 512;  // 1 << 9
const ImGuiItemStatusFlags HAS_SHORTCUT = 1024;  // 1 << 10
module ig;
distinct ImGuiKey = CInt;
module ig::key;
const ImGuiKey NONE = 0;  // 0
const ImGuiKey NAMED_KEY_BEGIN = 512;  // 512
const ImGuiKey TAB = 512;  // 512
const ImGuiKey LEFT_ARROW = 513;  // 513
const ImGuiKey RIGHT_ARROW = 514;  // 514
const ImGuiKey UP_ARROW = 515;  // 515
const ImGuiKey DOWN_ARROW = 516;  // 516
const ImGuiKey PAGE_UP = 517;  // 517
const ImGuiKey PAGE_DOWN = 518;  // 518
const ImGuiKey HOME = 519;  // 519
const ImGuiKey END = 520;  // 520
const ImGuiKey INSERT = 521;  // 521
const ImGuiKey DELETE = 522;  // 522
const ImGuiKey BACKSPACE = 523;  // 523
const ImGuiKey SPACE = 524;  // 524
const ImGuiKey ENTER = 525;  // 525
const ImGuiKey ESCAPE = 526;  // 526
const ImGuiKey LEFT_CTRL = 527;  // 527
const ImGuiKey LEFT_SHIFT = 528;  // 528
const ImGuiKey LEFT_ALT = 529;  // 529
const ImGuiKey LEFT_SUPER = 530;  // 530
const ImGuiKey RIGHT_CTRL = 531;  // 531
const ImGuiKey RIGHT_SHIFT = 532;  // 532
const ImGuiKey RIGHT_ALT = 533;  // 533
const ImGuiKey RIGHT_SUPER = 534;  // 534
const ImGuiKey MENU = 535;  // 535
const ImGuiKey KEY_0 = 536;  // 536
const ImGuiKey KEY_1 = 537;  // 537
const ImGuiKey KEY_2 = 538;  // 538
const ImGuiKey KEY_3 = 539;  // 539
const ImGuiKey KEY_4 = 540;  // 540
const ImGuiKey KEY_5 = 541;  // 541
const ImGuiKey KEY_6 = 542;  // 542
const ImGuiKey KEY_7 = 543;  // 543
const ImGuiKey KEY_8 = 544;  // 544
const ImGuiKey KEY_9 = 545;  // 545
const ImGuiKey A = 546;  // 546
const ImGuiKey B = 547;  // 547
const ImGuiKey C = 548;  // 548
const ImGuiKey D = 549;  // 549
const ImGuiKey E = 550;  // 550
const ImGuiKey F = 551;  // 551
const ImGuiKey G = 552;  // 552
const ImGuiKey H = 553;  // 553
const ImGuiKey I = 554;  // 554
const ImGuiKey J = 555;  // 555
const ImGuiKey K = 556;  // 556
const ImGuiKey L = 557;  // 557
const ImGuiKey M = 558;  // 558
const ImGuiKey N = 559;  // 559
const ImGuiKey O = 560;  // 560
const ImGuiKey P = 561;  // 561
const ImGuiKey Q = 562;  // 562
const ImGuiKey R = 563;  // 563
const ImGuiKey S = 564;  // 564
const ImGuiKey T = 565;  // 565
const ImGuiKey U = 566;  // 566
const ImGuiKey V = 567;  // 567
const ImGuiKey W = 568;  // 568
const ImGuiKey X = 569;  // 569
const ImGuiKey Y = 570;  // 570
const ImGuiKey Z = 571;  // 571
const ImGuiKey F1 = 572;  // 572
const ImGuiKey F2 = 573;  // 573
const ImGuiKey F3 = 574;  // 574
const ImGuiKey F4 = 575;  // 575
const ImGuiKey F5 = 576;  // 576
const ImGuiKey F6 = 577;  // 577
const ImGuiKey F7 = 578;  // 578
const ImGuiKey F8 = 579;  // 579
const ImGuiKey F9 = 580;  // 580
const ImGuiKey F10 = 581;  // 581
const ImGuiKey F11 = 582;  // 582
const ImGuiKey F12 = 583;  // 583
const ImGuiKey F13 = 584;  // 584
const ImGuiKey F14 = 585;  // 585
const ImGuiKey F15 = 586;  // 586
const ImGuiKey F16 = 587;  // 587
const ImGuiKey F17 = 588;  // 588
const ImGuiKey F18 = 589;  // 589
const ImGuiKey F19 = 590;  // 590
const ImGuiKey F20 = 591;  // 591
const ImGuiKey F21 = 592;  // 592
const ImGuiKey F22 = 593;  // 593
const ImGuiKey F23 = 594;  // 594
const ImGuiKey F24 = 595;  // 595
const ImGuiKey APOSTROPHE = 596;  // 596
const ImGuiKey COMMA = 597;  // 597
const ImGuiKey MINUS = 598;  // 598
const ImGuiKey PERIOD = 599;  // 599
const ImGuiKey SLASH = 600;  // 600
const ImGuiKey SEMICOLON = 601;  // 601
const ImGuiKey EQUAL = 602;  // 602
const ImGuiKey LEFT_BRACKET = 603;  // 603
const ImGuiKey BACKSLASH = 604;  // 604
const ImGuiKey RIGHT_BRACKET = 605;  // 605
const ImGuiKey GRAVE_ACCENT = 606;  // 606
const ImGuiKey CAPS_LOCK = 607;  // 607
const ImGuiKey SCROLL_LOCK = 608;  // 608
const ImGuiKey NUM_LOCK = 609;  // 609
const ImGuiKey PRINT_SCREEN = 610;  // 610
const ImGuiKey PAUSE = 611;  // 611
const ImGuiKey KEYPAD0 = 612;  // 612
const ImGuiKey KEYPAD1 = 613;  // 613
const ImGuiKey KEYPAD2 = 614;  // 614
const ImGuiKey KEYPAD3 = 615;  // 615
const ImGuiKey KEYPAD4 = 616;  // 616
const ImGuiKey KEYPAD5 = 617;  // 617
const ImGuiKey KEYPAD6 = 618;  // 618
const ImGuiKey KEYPAD7 = 619;  // 619
const ImGuiKey KEYPAD8 = 620;  // 620
const ImGuiKey KEYPAD9 = 621;  // 621
const ImGuiKey KEYPAD_DECIMAL = 622;  // 622
const ImGuiKey KEYPAD_DIVIDE = 623;  // 623
const ImGuiKey KEYPAD_MULTIPLY = 624;  // 624
const ImGuiKey KEYPAD_SUBTRACT = 625;  // 625
const ImGuiKey KEYPAD_ADD = 626;  // 626
const ImGuiKey KEYPAD_ENTER = 627;  // 627
const ImGuiKey KEYPAD_EQUAL = 628;  // 628
const ImGuiKey APP_BACK = 629;  // 629
const ImGuiKey APP_FORWARD = 630;  // 630
const ImGuiKey GAMEPAD_START = 631;  // 631
const ImGuiKey GAMEPAD_BACK = 632;  // 632
const ImGuiKey GAMEPAD_FACE_LEFT = 633;  // 633
const ImGuiKey GAMEPAD_FACE_RIGHT = 634;  // 634
const ImGuiKey GAMEPAD_FACE_UP = 635;  // 635
const ImGuiKey GAMEPAD_FACE_DOWN = 636;  // 636
const ImGuiKey GAMEPAD_DPAD_LEFT = 637;  // 637
const ImGuiKey GAMEPAD_DPAD_RIGHT = 638;  // 638
const ImGuiKey GAMEPAD_DPAD_UP = 639;  // 639
const ImGuiKey GAMEPAD_DPAD_DOWN = 640;  // 640
const ImGuiKey GAMEPAD_L1 = 641;  // 641
const ImGuiKey GAMEPAD_R1 = 642;  // 642
const ImGuiKey GAMEPAD_L2 = 643;  // 643
const ImGuiKey GAMEPAD_R2 = 644;  // 644
const ImGuiKey GAMEPAD_L3 = 645;  // 645
const ImGuiKey GAMEPAD_R3 = 646;  // 646
const ImGuiKey GAMEPAD_LSTICK_LEFT = 647;  // 647
const ImGuiKey GAMEPAD_LSTICK_RIGHT = 648;  // 648
const ImGuiKey GAMEPAD_LSTICK_UP = 649;  // 649
const ImGuiKey GAMEPAD_LSTICK_DOWN = 650;  // 650
const ImGuiKey GAMEPAD_RSTICK_LEFT = 651;  // 651
const ImGuiKey GAMEPAD_RSTICK_RIGHT = 652;  // 652
const ImGuiKey GAMEPAD_RSTICK_UP = 653;  // 653
const ImGuiKey GAMEPAD_RSTICK_DOWN = 654;  // 654
const ImGuiKey MOUSE_LEFT = 655;  // 655
const ImGuiKey MOUSE_RIGHT = 656;  // 656
const ImGuiKey MOUSE_MIDDLE = 657;  // 657
const ImGuiKey MOUSE_X1 = 658;  // 658
const ImGuiKey MOUSE_X2 = 659;  // 659
const ImGuiKey MOUSE_WHEEL_X = 660;  // 660
const ImGuiKey MOUSE_WHEEL_Y = 661;  // 661
const ImGuiKey RESERVED_FOR_MOD_CTRL = 662;  // 662
const ImGuiKey RESERVED_FOR_MOD_SHIFT = 663;  // 663
const ImGuiKey RESERVED_FOR_MOD_ALT = 664;  // 664
const ImGuiKey RESERVED_FOR_MOD_SUPER = 665;  // 665
const ImGuiKey NAMED_KEY_END = 666;  // 666
const ImGuiKey MOD_NONE = 0;  // 0
const ImGuiKey MOD_CTRL = 4096;  // 1 << 12
const ImGuiKey MOD_SHIFT = 8192;  // 1 << 13
const ImGuiKey MOD_ALT = 16384;  // 1 << 14
const ImGuiKey MOD_SUPER = 32768;  // 1 << 15
const ImGuiKey MOD_MASK_ = 61440;  // 0xF000
const ImGuiKey NAMED_KEY_COUNT = 154;  // ImGuiKey_NamedKey_END - ImGuiKey_NamedKey_BEGIN
module ig;
module ig::layout_type;
const ImGuiLayoutType HORIZONTAL = 0;  // 0
const ImGuiLayoutType VERTICAL = 1;  // 1
module ig;
distinct ImGuiLocKey = CInt;
module ig::loc_key;
const ImGuiLocKey VERSION_STR = 0;  // 0
const ImGuiLocKey TABLE_SIZE_ONE = 1;  // 1
const ImGuiLocKey TABLE_SIZE_ALL_FIT = 2;  // 2
const ImGuiLocKey TABLE_SIZE_ALL_DEFAULT = 3;  // 3
const ImGuiLocKey TABLE_RESET_ORDER = 4;  // 4
const ImGuiLocKey WINDOWING_MAIN_MENU_BAR = 5;  // 5
const ImGuiLocKey WINDOWING_POPUP = 6;  // 6
const ImGuiLocKey WINDOWING_UNTITLED = 7;  // 7
const ImGuiLocKey OPEN_LINK_S = 8;  // 8
const ImGuiLocKey COPY_LINK = 9;  // 9
const ImGuiLocKey DOCKING_HIDE_TAB_BAR = 10;  // 10
const ImGuiLocKey DOCKING_HOLD_SHIFT_TO_DOCK = 11;  // 11
const ImGuiLocKey DOCKING_DRAG_TO_UNDOCK_OR_MOVE_NODE = 12;  // 12
const ImGuiLocKey COUNT = 13;  // 13
module ig;
module ig::log_flags;
const ImGuiLogFlags NONE = 0;  // 0
const ImGuiLogFlags OUTPUT_TTY = 1;  // 1 << 0
const ImGuiLogFlags OUTPUT_FILE = 2;  // 1 << 1
const ImGuiLogFlags OUTPUT_BUFFER = 4;  // 1 << 2
const ImGuiLogFlags OUTPUT_CLIPBOARD = 8;  // 1 << 3
const ImGuiLogFlags OUTPUT_MASK_ = 15;  // ImGuiLogFlags_OutputTTY | ImGuiLogFlags_OutputFile | ImGuiLogFlags_OutputBuffer | ImGuiLogFlags_OutputClipboard
module ig;
module ig::mouse_button;
const ImGuiMouseButton LEFT = 0;  // 0
const ImGuiMouseButton RIGHT = 1;  // 1
const ImGuiMouseButton MIDDLE = 2;  // 2
const ImGuiMouseButton COUNT = 5;  // 5
module ig;
module ig::mouse_cursor;
const ImGuiMouseCursor NONE = -1;  // -1
const ImGuiMouseCursor ARROW = 0;  // 0
const ImGuiMouseCursor TEXT_INPUT = 1;  // 1
const ImGuiMouseCursor RESIZE_ALL = 2;  // 2
const ImGuiMouseCursor RESIZE_NS = 3;  // 3
const ImGuiMouseCursor RESIZE_EW = 4;  // 4
const ImGuiMouseCursor RESIZE_NESW = 5;  // 5
const ImGuiMouseCursor RESIZE_NWSE = 6;  // 6
const ImGuiMouseCursor HAND = 7;  // 7
const ImGuiMouseCursor NOT_ALLOWED = 8;  // 8
const ImGuiMouseCursor COUNT = 9;  // 9
module ig;
distinct ImGuiMouseSource = CInt;
module ig::mouse_source;
const ImGuiMouseSource MOUSE = 0;  // 0
const ImGuiMouseSource TOUCH_SCREEN = 1;  // 1
const ImGuiMouseSource PEN = 2;  // 2
const ImGuiMouseSource COUNT = 3;  // 3
module ig;
module ig::multi_select_flags;
const ImGuiMultiSelectFlags NONE = 0;  // 0
const ImGuiMultiSelectFlags SINGLE_SELECT = 1;  // 1 << 0
const ImGuiMultiSelectFlags NO_SELECT_ALL = 2;  // 1 << 1
const ImGuiMultiSelectFlags NO_RANGE_SELECT = 4;  // 1 << 2
const ImGuiMultiSelectFlags NO_AUTO_SELECT = 8;  // 1 << 3
const ImGuiMultiSelectFlags NO_AUTO_CLEAR = 16;  // 1 << 4
const ImGuiMultiSelectFlags NO_AUTO_CLEAR_ON_RESELECT = 32;  // 1 << 5
const ImGuiMultiSelectFlags BOX_SELECT1D = 64;  // 1 << 6
const ImGuiMultiSelectFlags BOX_SELECT2D = 128;  // 1 << 7
const ImGuiMultiSelectFlags BOX_SELECT_NO_SCROLL = 256;  // 1 << 8
const ImGuiMultiSelectFlags CLEAR_ON_ESCAPE = 512;  // 1 << 9
const ImGuiMultiSelectFlags CLEAR_ON_CLICK_VOID = 1024;  // 1 << 10
const ImGuiMultiSelectFlags SCOPE_WINDOW = 2048;  // 1 << 11
const ImGuiMultiSelectFlags SCOPE_RECT = 4096;  // 1 << 12
const ImGuiMultiSelectFlags SELECT_ON_CLICK = 8192;  // 1 << 13
const ImGuiMultiSelectFlags SELECT_ON_CLICK_RELEASE = 16384;  // 1 << 14
const ImGuiMultiSelectFlags NAV_WRAP_X = 65536;  // 1 << 16
module ig;
distinct ImGuiNavLayer = CInt;
module ig::nav_layer;
const ImGuiNavLayer MAIN = 0;  // 0
const ImGuiNavLayer MENU = 1;  // 1
const ImGuiNavLayer COUNT = 2;  // 2
module ig;
module ig::nav_move_flags;
const ImGuiNavMoveFlags NONE = 0;  // 0
const ImGuiNavMoveFlags LOOP_X = 1;  // 1 << 0
const ImGuiNavMoveFlags LOOP_Y = 2;  // 1 << 1
const ImGuiNavMoveFlags WRAP_X = 4;  // 1 << 2
const ImGuiNavMoveFlags WRAP_Y = 8;  // 1 << 3
const ImGuiNavMoveFlags WRAP_MASK_ = 15;  // ImGuiNavMoveFlags_LoopX | ImGuiNavMoveFlags_LoopY | ImGuiNavMoveFlags_WrapX | ImGuiNavMoveFlags_WrapY
const ImGuiNavMoveFlags ALLOW_CURRENT_NAV_ID = 16;  // 1 << 4
const ImGuiNavMoveFlags ALSO_SCORE_VISIBLE_SET = 32;  // 1 << 5
const ImGuiNavMoveFlags SCROLL_TO_EDGE_Y = 64;  // 1 << 6
const ImGuiNavMoveFlags FORWARDED = 128;  // 1 << 7
const ImGuiNavMoveFlags DEBUG_NO_RESULT = 256;  // 1 << 8
const ImGuiNavMoveFlags FOCUS_API = 512;  // 1 << 9
const ImGuiNavMoveFlags IS_TABBING = 1024;  // 1 << 10
const ImGuiNavMoveFlags IS_PAGE_MOVE = 2048;  // 1 << 11
const ImGuiNavMoveFlags ACTIVATE = 4096;  // 1 << 12
const ImGuiNavMoveFlags NO_SELECT = 8192;  // 1 << 13
const ImGuiNavMoveFlags NO_SET_NAV_CURSOR_VISIBLE = 16384;  // 1 << 14
const ImGuiNavMoveFlags NO_CLEAR_ACTIVE_ID = 32768;  // 1 << 15
module ig;
module ig::nav_render_cursor_flags;
const ImGuiNavRenderCursorFlags NONE = 0;  // 0
const ImGuiNavRenderCursorFlags COMPACT = 2;  // 1 << 1
const ImGuiNavRenderCursorFlags ALWAYS_DRAW = 4;  // 1 << 2
const ImGuiNavRenderCursorFlags NO_ROUNDING = 8;  // 1 << 3
module ig;
module ig::next_item_data_flags;
const ImGuiNextItemDataFlags NONE = 0;  // 0
const ImGuiNextItemDataFlags HAS_WIDTH = 1;  // 1 << 0
const ImGuiNextItemDataFlags HAS_OPEN = 2;  // 1 << 1
const ImGuiNextItemDataFlags HAS_SHORTCUT = 4;  // 1 << 2
const ImGuiNextItemDataFlags HAS_REF_VAL = 8;  // 1 << 3
const ImGuiNextItemDataFlags HAS_STORAGE_ID = 16;  // 1 << 4
module ig;
module ig::next_window_data_flags;
const ImGuiNextWindowDataFlags NONE = 0;  // 0
const ImGuiNextWindowDataFlags HAS_POS = 1;  // 1 << 0
const ImGuiNextWindowDataFlags HAS_SIZE = 2;  // 1 << 1
const ImGuiNextWindowDataFlags HAS_CONTENT_SIZE = 4;  // 1 << 2
const ImGuiNextWindowDataFlags HAS_COLLAPSED = 8;  // 1 << 3
const ImGuiNextWindowDataFlags HAS_SIZE_CONSTRAINT = 16;  // 1 << 4
const ImGuiNextWindowDataFlags HAS_FOCUS = 32;  // 1 << 5
const ImGuiNextWindowDataFlags HAS_BG_ALPHA = 64;  // 1 << 6
const ImGuiNextWindowDataFlags HAS_SCROLL = 128;  // 1 << 7
const ImGuiNextWindowDataFlags HAS_CHILD_FLAGS = 256;  // 1 << 8
const ImGuiNextWindowDataFlags HAS_REFRESH_POLICY = 512;  // 1 << 9
const ImGuiNextWindowDataFlags HAS_VIEWPORT = 1024;  // 1 << 10
const ImGuiNextWindowDataFlags HAS_DOCK = 2048;  // 1 << 11
const ImGuiNextWindowDataFlags HAS_WINDOW_CLASS = 4096;  // 1 << 12
module ig;
module ig::old_column_flags;
const ImGuiOldColumnFlags NONE = 0;  // 0
const ImGuiOldColumnFlags NO_BORDER = 1;  // 1 << 0
const ImGuiOldColumnFlags NO_RESIZE = 2;  // 1 << 1
const ImGuiOldColumnFlags NO_PRESERVE_WIDTHS = 4;  // 1 << 2
const ImGuiOldColumnFlags NO_FORCE_WITHIN_WINDOW = 8;  // 1 << 3
const ImGuiOldColumnFlags GROW_PARENT_CONTENTS_SIZE = 16;  // 1 << 4
module ig;
distinct ImGuiPlotType = CInt;
module ig::plot_type;
const ImGuiPlotType LINES = 0;  // 0
const ImGuiPlotType HISTOGRAM = 1;  // 1
module ig;
module ig::popup_flags;
const ImGuiPopupFlags NONE = 0;  // 0
const ImGuiPopupFlags MOUSE_BUTTON_LEFT = 0;  // 0
const ImGuiPopupFlags MOUSE_BUTTON_RIGHT = 1;  // 1
const ImGuiPopupFlags MOUSE_BUTTON_MIDDLE = 2;  // 2
const ImGuiPopupFlags MOUSE_BUTTON_MASK_ = 31;  // 0x1F
const ImGuiPopupFlags MOUSE_BUTTON_DEFAULT_ = 1;  // 1
const ImGuiPopupFlags NO_REOPEN = 32;  // 1 << 5
const ImGuiPopupFlags NO_OPEN_OVER_EXISTING_POPUP = 128;  // 1 << 7
const ImGuiPopupFlags NO_OPEN_OVER_ITEMS = 256;  // 1 << 8
const ImGuiPopupFlags ANY_POPUP_ID = 1024;  // 1 << 10
const ImGuiPopupFlags ANY_POPUP_LEVEL = 2048;  // 1 << 11
const ImGuiPopupFlags ANY_POPUP = 3072;  // ImGuiPopupFlags_AnyPopupId | ImGuiPopupFlags_AnyPopupLevel
module ig;
distinct ImGuiPopupPositionPolicy = CInt;
module ig::popup_position_policy;
const ImGuiPopupPositionPolicy DEFAULT = 0;  // 0
const ImGuiPopupPositionPolicy COMBO_BOX = 1;  // 1
const ImGuiPopupPositionPolicy TOOLTIP = 2;  // 2
module ig;
module ig::scroll_flags;
const ImGuiScrollFlags NONE = 0;  // 0
const ImGuiScrollFlags KEEP_VISIBLE_EDGE_X = 1;  // 1 << 0
const ImGuiScrollFlags KEEP_VISIBLE_EDGE_Y = 2;  // 1 << 1
const ImGuiScrollFlags KEEP_VISIBLE_CENTER_X = 4;  // 1 << 2
const ImGuiScrollFlags KEEP_VISIBLE_CENTER_Y = 8;  // 1 << 3
const ImGuiScrollFlags ALWAYS_CENTER_X = 16;  // 1 << 4
const ImGuiScrollFlags ALWAYS_CENTER_Y = 32;  // 1 << 5
const ImGuiScrollFlags NO_SCROLL_PARENT = 64;  // 1 << 6
const ImGuiScrollFlags MASK_X = 21;  // ImGuiScrollFlags_KeepVisibleEdgeX | ImGuiScrollFlags_KeepVisibleCenterX | ImGuiScrollFlags_AlwaysCenterX
const ImGuiScrollFlags MASK_Y = 42;  // ImGuiScrollFlags_KeepVisibleEdgeY | ImGuiScrollFlags_KeepVisibleCenterY | ImGuiScrollFlags_AlwaysCenterY
module ig;
module ig::selectable_flags;
const ImGuiSelectableFlags NONE = 0;  // 0
const ImGuiSelectableFlags NO_AUTO_CLOSE_POPUPS = 1;  // 1 << 0
const ImGuiSelectableFlags SPAN_ALL_COLUMNS = 2;  // 1 << 1
const ImGuiSelectableFlags ALLOW_DOUBLE_CLICK = 4;  // 1 << 2
const ImGuiSelectableFlags DISABLED = 8;  // 1 << 3
const ImGuiSelectableFlags ALLOW_OVERLAP = 16;  // 1 << 4
const ImGuiSelectableFlags HIGHLIGHT = 32;  // 1 << 5
module ig;
distinct ImGuiSelectionRequestType = CInt;
module ig::selection_request_type;
const ImGuiSelectionRequestType NONE = 0;  // 0
const ImGuiSelectionRequestType SET_ALL = 1;  // 1
const ImGuiSelectionRequestType SET_RANGE = 2;  // 2
module ig;
module ig::separator_flags;
const ImGuiSeparatorFlags NONE = 0;  // 0
const ImGuiSeparatorFlags HORIZONTAL = 1;  // 1 << 0
const ImGuiSeparatorFlags VERTICAL = 2;  // 1 << 1
const ImGuiSeparatorFlags SPAN_ALL_COLUMNS = 4;  // 1 << 2
module ig;
module ig::slider_flags;
const ImGuiSliderFlags NONE = 0;  // 0
const ImGuiSliderFlags LOGARITHMIC = 32;  // 1 << 5
const ImGuiSliderFlags NO_ROUND_TO_FORMAT = 64;  // 1 << 6
const ImGuiSliderFlags NO_INPUT = 128;  // 1 << 7
const ImGuiSliderFlags WRAP_AROUND = 256;  // 1 << 8
const ImGuiSliderFlags CLAMP_ON_INPUT = 512;  // 1 << 9
const ImGuiSliderFlags CLAMP_ZERO_RANGE = 1024;  // 1 << 10
const ImGuiSliderFlags ALWAYS_CLAMP = 1536;  // ImGuiSliderFlags_ClampOnInput | ImGuiSliderFlags_ClampZeroRange
const ImGuiSliderFlags INVALID_MASK_ = 1879048207;  // 0x7000000F
module ig;
distinct ImGuiSortDirection = ImU8;
module ig::sort_direction;
const ImGuiSortDirection NONE = 0;  // 0
const ImGuiSortDirection ASCENDING = 1;  // 1
const ImGuiSortDirection DESCENDING = 2;  // 2
module ig;
module ig::style_var;
const ImGuiStyleVar ALPHA = 0;  // 0
const ImGuiStyleVar DISABLED_ALPHA = 1;  // 1
const ImGuiStyleVar WINDOW_PADDING = 2;  // 2
const ImGuiStyleVar WINDOW_ROUNDING = 3;  // 3
const ImGuiStyleVar WINDOW_BORDER_SIZE = 4;  // 4
const ImGuiStyleVar WINDOW_MIN_SIZE = 5;  // 5
const ImGuiStyleVar WINDOW_TITLE_ALIGN = 6;  // 6
const ImGuiStyleVar CHILD_ROUNDING = 7;  // 7
const ImGuiStyleVar CHILD_BORDER_SIZE = 8;  // 8
const ImGuiStyleVar POPUP_ROUNDING = 9;  // 9
const ImGuiStyleVar POPUP_BORDER_SIZE = 10;  // 10
const ImGuiStyleVar FRAME_PADDING = 11;  // 11
const ImGuiStyleVar FRAME_ROUNDING = 12;  // 12
const ImGuiStyleVar FRAME_BORDER_SIZE = 13;  // 13
const ImGuiStyleVar ITEM_SPACING = 14;  // 14
const ImGuiStyleVar ITEM_INNER_SPACING = 15;  // 15
const ImGuiStyleVar INDENT_SPACING = 16;  // 16
const ImGuiStyleVar CELL_PADDING = 17;  // 17
const ImGuiStyleVar SCROLLBAR_SIZE = 18;  // 18
const ImGuiStyleVar SCROLLBAR_ROUNDING = 19;  // 19
const ImGuiStyleVar GRAB_MIN_SIZE = 20;  // 20
const ImGuiStyleVar GRAB_ROUNDING = 21;  // 21
const ImGuiStyleVar TAB_ROUNDING = 22;  // 22
const ImGuiStyleVar TAB_BORDER_SIZE = 23;  // 23
const ImGuiStyleVar TAB_BAR_BORDER_SIZE = 24;  // 24
const ImGuiStyleVar TAB_BAR_OVERLINE_SIZE = 25;  // 25
const ImGuiStyleVar TABLE_ANGLED_HEADERS_ANGLE = 26;  // 26
const ImGuiStyleVar TABLE_ANGLED_HEADERS_TEXT_ALIGN = 27;  // 27
const ImGuiStyleVar BUTTON_TEXT_ALIGN = 28;  // 28
const ImGuiStyleVar SELECTABLE_TEXT_ALIGN = 29;  // 29
const ImGuiStyleVar SEPARATOR_TEXT_BORDER_SIZE = 30;  // 30
const ImGuiStyleVar SEPARATOR_TEXT_ALIGN = 31;  // 31
const ImGuiStyleVar SEPARATOR_TEXT_PADDING = 32;  // 32
const ImGuiStyleVar DOCKING_SEPARATOR_SIZE = 33;  // 33
const ImGuiStyleVar COUNT = 34;  // 34
module ig;
module ig::tab_bar_flags;
const ImGuiTabBarFlags NONE = 0;  // 0
const ImGuiTabBarFlags REORDERABLE = 1;  // 1 << 0
const ImGuiTabBarFlags AUTO_SELECT_NEW_TABS = 2;  // 1 << 1
const ImGuiTabBarFlags TAB_LIST_POPUP_BUTTON = 4;  // 1 << 2
const ImGuiTabBarFlags NO_CLOSE_WITH_MIDDLE_MOUSE_BUTTON = 8;  // 1 << 3
const ImGuiTabBarFlags NO_TAB_LIST_SCROLLING_BUTTONS = 16;  // 1 << 4
const ImGuiTabBarFlags NO_TOOLTIP = 32;  // 1 << 5
const ImGuiTabBarFlags DRAW_SELECTED_OVERLINE = 64;  // 1 << 6
const ImGuiTabBarFlags FITTING_POLICY_RESIZE_DOWN = 128;  // 1 << 7
const ImGuiTabBarFlags FITTING_POLICY_SCROLL = 256;  // 1 << 8
const ImGuiTabBarFlags FITTING_POLICY_MASK_ = 384;  // ImGuiTabBarFlags_FittingPolicyResizeDown | ImGuiTabBarFlags_FittingPolicyScroll
const ImGuiTabBarFlags FITTING_POLICY_DEFAULT_ = 128;  // ImGuiTabBarFlags_FittingPolicyResizeDown
module ig;
module ig::tab_item_flags;
const ImGuiTabItemFlags NONE = 0;  // 0
const ImGuiTabItemFlags UNSAVED_DOCUMENT = 1;  // 1 << 0
const ImGuiTabItemFlags SET_SELECTED = 2;  // 1 << 1
const ImGuiTabItemFlags NO_CLOSE_WITH_MIDDLE_MOUSE_BUTTON = 4;  // 1 << 2
const ImGuiTabItemFlags NO_PUSH_ID = 8;  // 1 << 3
const ImGuiTabItemFlags NO_TOOLTIP = 16;  // 1 << 4
const ImGuiTabItemFlags NO_REORDER = 32;  // 1 << 5
const ImGuiTabItemFlags LEADING = 64;  // 1 << 6
const ImGuiTabItemFlags TRAILING = 128;  // 1 << 7
const ImGuiTabItemFlags NO_ASSUMED_CLOSURE = 256;  // 1 << 8
module ig;
module ig::table_bg_target;
const ImGuiTableBgTarget NONE = 0;  // 0
const ImGuiTableBgTarget ROW_BG0 = 1;  // 1
const ImGuiTableBgTarget ROW_BG1 = 2;  // 2
const ImGuiTableBgTarget CELL_BG = 3;  // 3
module ig;
module ig::table_column_flags;
const ImGuiTableColumnFlags NONE = 0;  // 0
const ImGuiTableColumnFlags DISABLED = 1;  // 1 << 0
const ImGuiTableColumnFlags DEFAULT_HIDE = 2;  // 1 << 1
const ImGuiTableColumnFlags DEFAULT_SORT = 4;  // 1 << 2
const ImGuiTableColumnFlags WIDTH_STRETCH = 8;  // 1 << 3
const ImGuiTableColumnFlags WIDTH_FIXED = 16;  // 1 << 4
const ImGuiTableColumnFlags NO_RESIZE = 32;  // 1 << 5
const ImGuiTableColumnFlags NO_REORDER = 64;  // 1 << 6
const ImGuiTableColumnFlags NO_HIDE = 128;  // 1 << 7
const ImGuiTableColumnFlags NO_CLIP = 256;  // 1 << 8
const ImGuiTableColumnFlags NO_SORT = 512;  // 1 << 9
const ImGuiTableColumnFlags NO_SORT_ASCENDING = 1024;  // 1 << 10
const ImGuiTableColumnFlags NO_SORT_DESCENDING = 2048;  // 1 << 11
const ImGuiTableColumnFlags NO_HEADER_LABEL = 4096;  // 1 << 12
const ImGuiTableColumnFlags NO_HEADER_WIDTH = 8192;  // 1 << 13
const ImGuiTableColumnFlags PREFER_SORT_ASCENDING = 16384;  // 1 << 14
const ImGuiTableColumnFlags PREFER_SORT_DESCENDING = 32768;  // 1 << 15
const ImGuiTableColumnFlags INDENT_ENABLE = 65536;  // 1 << 16
const ImGuiTableColumnFlags INDENT_DISABLE = 131072;  // 1 << 17
const ImGuiTableColumnFlags ANGLED_HEADER = 262144;  // 1 << 18
const ImGuiTableColumnFlags IS_ENABLED = 16777216;  // 1 << 24
const ImGuiTableColumnFlags IS_VISIBLE = 33554432;  // 1 << 25
const ImGuiTableColumnFlags IS_SORTED = 67108864;  // 1 << 26
const ImGuiTableColumnFlags IS_HOVERED = 134217728;  // 1 << 27
const ImGuiTableColumnFlags WIDTH_MASK_ = 24;  // ImGuiTableColumnFlags_WidthStretch | ImGuiTableColumnFlags_WidthFixed
const ImGuiTableColumnFlags INDENT_MASK_ = 196608;  // ImGuiTableColumnFlags_IndentEnable | ImGuiTableColumnFlags_IndentDisable
const ImGuiTableColumnFlags STATUS_MASK_ = 251658240;  // ImGuiTableColumnFlags_IsEnabled | ImGuiTableColumnFlags_IsVisible | ImGuiTableColumnFlags_IsSorted | ImGuiTableColumnFlags_IsHovered
const ImGuiTableColumnFlags NO_DIRECT_RESIZE_ = 1073741824;  // 1 << 30
module ig;
module ig::table_flags;
const ImGuiTableFlags NONE = 0;  // 0
const ImGuiTableFlags RESIZABLE = 1;  // 1 << 0
const ImGuiTableFlags REORDERABLE = 2;  // 1 << 1
const ImGuiTableFlags HIDEABLE = 4;  // 1 << 2
const ImGuiTableFlags SORTABLE = 8;  // 1 << 3
const ImGuiTableFlags NO_SAVED_SETTINGS = 16;  // 1 << 4
const ImGuiTableFlags CONTEXT_MENU_IN_BODY = 32;  // 1 << 5
const ImGuiTableFlags ROW_BG = 64;  // 1 << 6
const ImGuiTableFlags BORDERS_INNER_H = 128;  // 1 << 7
const ImGuiTableFlags BORDERS_OUTER_H = 256;  // 1 << 8
const ImGuiTableFlags BORDERS_INNER_V = 512;  // 1 << 9
const ImGuiTableFlags BORDERS_OUTER_V = 1024;  // 1 << 10
const ImGuiTableFlags BORDERS_H = 384;  // ImGuiTableFlags_BordersInnerH | ImGuiTableFlags_BordersOuterH
const ImGuiTableFlags BORDERS_V = 1536;  // ImGuiTableFlags_BordersInnerV | ImGuiTableFlags_BordersOuterV
const ImGuiTableFlags BORDERS_INNER = 640;  // ImGuiTableFlags_BordersInnerV | ImGuiTableFlags_BordersInnerH
const ImGuiTableFlags BORDERS_OUTER = 1280;  // ImGuiTableFlags_BordersOuterV | ImGuiTableFlags_BordersOuterH
const ImGuiTableFlags BORDERS = 1920;  // ImGuiTableFlags_BordersInner | ImGuiTableFlags_BordersOuter
const ImGuiTableFlags NO_BORDERS_IN_BODY = 2048;  // 1 << 11
const ImGuiTableFlags NO_BORDERS_IN_BODY_UNTIL_RESIZE = 4096;  // 1 << 12
const ImGuiTableFlags SIZING_FIXED_FIT = 8192;  // 1 << 13
const ImGuiTableFlags SIZING_FIXED_SAME = 16384;  // 2 << 13
const ImGuiTableFlags SIZING_STRETCH_PROP = 24576;  // 3 << 13
const ImGuiTableFlags SIZING_STRETCH_SAME = 32768;  // 4 << 13
const ImGuiTableFlags NO_HOST_EXTEND_X = 65536;  // 1 << 16
const ImGuiTableFlags NO_HOST_EXTEND_Y = 131072;  // 1 << 17
const ImGuiTableFlags NO_KEEP_COLUMNS_VISIBLE = 262144;  // 1 << 18
const ImGuiTableFlags PRECISE_WIDTHS = 524288;  // 1 << 19
const ImGuiTableFlags NO_CLIP = 1048576;  // 1 << 20
const ImGuiTableFlags PAD_OUTER_X = 2097152;  // 1 << 21
const ImGuiTableFlags NO_PAD_OUTER_X = 4194304;  // 1 << 22
const ImGuiTableFlags NO_PAD_INNER_X = 8388608;  // 1 << 23
const ImGuiTableFlags SCROLL_X = 16777216;  // 1 << 24
const ImGuiTableFlags SCROLL_Y = 33554432;  // 1 << 25
const ImGuiTableFlags SORT_MULTI = 67108864;  // 1 << 26
const ImGuiTableFlags SORT_TRISTATE = 134217728;  // 1 << 27
const ImGuiTableFlags HIGHLIGHT_HOVERED_COLUMN = 268435456;  // 1 << 28
const ImGuiTableFlags SIZING_MASK_ = 57344;  // ImGuiTableFlags_SizingFixedFit | ImGuiTableFlags_SizingFixedSame | ImGuiTableFlags_SizingStretchProp | ImGuiTableFlags_SizingStretchSame
module ig;
module ig::table_row_flags;
const ImGuiTableRowFlags NONE = 0;  // 0
const ImGuiTableRowFlags HEADERS = 1;  // 1 << 0
module ig;
module ig::text_flags;
const ImGuiTextFlags NONE = 0;  // 0
const ImGuiTextFlags NO_WIDTH_FOR_LARGE_CLIPPED_TEXT = 1;  // 1 << 0
module ig;
module ig::tooltip_flags;
const ImGuiTooltipFlags NONE = 0;  // 0
const ImGuiTooltipFlags OVERRIDE_PREVIOUS = 2;  // 1 << 1
module ig;
module ig::tree_node_flags;
const ImGuiTreeNodeFlags NONE = 0;  // 0
const ImGuiTreeNodeFlags SELECTED = 1;  // 1 << 0
const ImGuiTreeNodeFlags FRAMED = 2;  // 1 << 1
const ImGuiTreeNodeFlags ALLOW_OVERLAP = 4;  // 1 << 2
const ImGuiTreeNodeFlags NO_TREE_PUSH_ON_OPEN = 8;  // 1 << 3
const ImGuiTreeNodeFlags NO_AUTO_OPEN_ON_LOG = 16;  // 1 << 4
const ImGuiTreeNodeFlags DEFAULT_OPEN = 32;  // 1 << 5
const ImGuiTreeNodeFlags OPEN_ON_DOUBLE_CLICK = 64;  // 1 << 6
const ImGuiTreeNodeFlags OPEN_ON_ARROW = 128;  // 1 << 7
const ImGuiTreeNodeFlags LEAF = 256;  // 1 << 8
const ImGuiTreeNodeFlags BULLET = 512;  // 1 << 9
const ImGuiTreeNodeFlags FRAME_PADDING = 1024;  // 1 << 10
const ImGuiTreeNodeFlags SPAN_AVAIL_WIDTH = 2048;  // 1 << 11
const ImGuiTreeNodeFlags SPAN_FULL_WIDTH = 4096;  // 1 << 12
const ImGuiTreeNodeFlags SPAN_TEXT_WIDTH = 8192;  // 1 << 13
const ImGuiTreeNodeFlags SPAN_ALL_COLUMNS = 16384;  // 1 << 14
const ImGuiTreeNodeFlags NAV_LEFT_JUMPS_BACK_HERE = 32768;  // 1 << 15
const ImGuiTreeNodeFlags COLLAPSING_HEADER = 26;  // ImGuiTreeNodeFlags_Framed | ImGuiTreeNodeFlags_NoTreePushOnOpen | ImGuiTreeNodeFlags_NoAutoOpenOnLog
module ig;
module ig::typing_select_flags;
const ImGuiTypingSelectFlags NONE = 0;  // 0
const ImGuiTypingSelectFlags ALLOW_BACKSPACE = 1;  // 1 << 0
const ImGuiTypingSelectFlags ALLOW_SINGLE_CHAR_MODE = 2;  // 1 << 1
module ig;
module ig::viewport_flags;
const ImGuiViewportFlags NONE = 0;  // 0
const ImGuiViewportFlags IS_PLATFORM_WINDOW = 1;  // 1 << 0
const ImGuiViewportFlags IS_PLATFORM_MONITOR = 2;  // 1 << 1
const ImGuiViewportFlags OWNED_BY_APP = 4;  // 1 << 2
const ImGuiViewportFlags NO_DECORATION = 8;  // 1 << 3
const ImGuiViewportFlags NO_TASK_BAR_ICON = 16;  // 1 << 4
const ImGuiViewportFlags NO_FOCUS_ON_APPEARING = 32;  // 1 << 5
const ImGuiViewportFlags NO_FOCUS_ON_CLICK = 64;  // 1 << 6
const ImGuiViewportFlags NO_INPUTS = 128;  // 1 << 7
const ImGuiViewportFlags NO_RENDERER_CLEAR = 256;  // 1 << 8
const ImGuiViewportFlags NO_AUTO_MERGE = 512;  // 1 << 9
const ImGuiViewportFlags TOP_MOST = 1024;  // 1 << 10
const ImGuiViewportFlags CAN_HOST_OTHER_WINDOWS = 2048;  // 1 << 11
const ImGuiViewportFlags IS_MINIMIZED = 4096;  // 1 << 12
const ImGuiViewportFlags IS_FOCUSED = 8192;  // 1 << 13
module ig;
distinct ImGuiWindowDockStyleCol = CInt;
module ig::window_dock_style_col;
const ImGuiWindowDockStyleCol TEXT = 0;  // 0
const ImGuiWindowDockStyleCol TAB_HOVERED = 1;  // 1
const ImGuiWindowDockStyleCol TAB_FOCUSED = 2;  // 2
const ImGuiWindowDockStyleCol TAB_SELECTED = 3;  // 3
const ImGuiWindowDockStyleCol TAB_SELECTED_OVERLINE = 4;  // 4
const ImGuiWindowDockStyleCol TAB_DIMMED = 5;  // 5
const ImGuiWindowDockStyleCol TAB_DIMMED_SELECTED = 6;  // 6
const ImGuiWindowDockStyleCol TAB_DIMMED_SELECTED_OVERLINE = 7;  // 7
const ImGuiWindowDockStyleCol COUNT = 8;  // 8
module ig;
module ig::window_flags;
const ImGuiWindowFlags NONE = 0;  // 0
const ImGuiWindowFlags NO_TITLE_BAR = 1;  // 1 << 0
const ImGuiWindowFlags NO_RESIZE = 2;  // 1 << 1
const ImGuiWindowFlags NO_MOVE = 4;  // 1 << 2
const ImGuiWindowFlags NO_SCROLLBAR = 8;  // 1 << 3
const ImGuiWindowFlags NO_SCROLL_WITH_MOUSE = 16;  // 1 << 4
const ImGuiWindowFlags NO_COLLAPSE = 32;  // 1 << 5
const ImGuiWindowFlags ALWAYS_AUTO_RESIZE = 64;  // 1 << 6
const ImGuiWindowFlags NO_BACKGROUND = 128;  // 1 << 7
const ImGuiWindowFlags NO_SAVED_SETTINGS = 256;  // 1 << 8
const ImGuiWindowFlags NO_MOUSE_INPUTS = 512;  // 1 << 9
const ImGuiWindowFlags MENU_BAR = 1024;  // 1 << 10
const ImGuiWindowFlags HORIZONTAL_SCROLLBAR = 2048;  // 1 << 11
const ImGuiWindowFlags NO_FOCUS_ON_APPEARING = 4096;  // 1 << 12
const ImGuiWindowFlags NO_BRING_TO_FRONT_ON_FOCUS = 8192;  // 1 << 13
const ImGuiWindowFlags ALWAYS_VERTICAL_SCROLLBAR = 16384;  // 1 << 14
const ImGuiWindowFlags ALWAYS_HORIZONTAL_SCROLLBAR = 32768;  // 1<< 15
const ImGuiWindowFlags NO_NAV_INPUTS = 65536;  // 1 << 16
const ImGuiWindowFlags NO_NAV_FOCUS = 131072;  // 1 << 17
const ImGuiWindowFlags UNSAVED_DOCUMENT = 262144;  // 1 << 18
const ImGuiWindowFlags NO_DOCKING = 524288;  // 1 << 19
const ImGuiWindowFlags NO_NAV = 196608;  // ImGuiWindowFlags_NoNavInputs | ImGuiWindowFlags_NoNavFocus
const ImGuiWindowFlags NO_DECORATION = 43;  // ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoResize | ImGuiWindowFlags_NoScrollbar | ImGuiWindowFlags_NoCollapse
const ImGuiWindowFlags NO_INPUTS = 197120;  // ImGuiWindowFlags_NoMouseInputs | ImGuiWindowFlags_NoNavInputs | ImGuiWindowFlags_NoNavFocus
const ImGuiWindowFlags CHILD_WINDOW = 16777216;  // 1 << 24
const ImGuiWindowFlags TOOLTIP = 33554432;  // 1 << 25
const ImGuiWindowFlags POPUP = 67108864;  // 1 << 26
const ImGuiWindowFlags MODAL = 134217728;  // 1 << 27
const ImGuiWindowFlags CHILD_MENU = 268435456;  // 1 << 28
const ImGuiWindowFlags DOCK_NODE_HOST = 536870912;  // 1 << 29
module ig;
module ig::window_refresh_flags;
const ImGuiWindowRefreshFlags NONE = 0;  // 0
const ImGuiWindowRefreshFlags TRY_TO_AVOID_REFRESH = 1;  // 1 << 0
const ImGuiWindowRefreshFlags REFRESH_ON_HOVER = 2;  // 1 << 1
const ImGuiWindowRefreshFlags REFRESH_ON_FOCUS = 4;  // 1 << 2
module ig;
struct ImBitVector
{
    ImVector storage;
}
struct ImColor
{
    ImVec4 value;
}
struct ImDrawChannel
{
    ImVector cmd_buffer;
    ImVector idx_buffer;
}
struct ImDrawCmd
{
    ImVec4 clip_rect;
    ImTextureID texture_id;
    CUInt vtx_offset;
    CUInt idx_offset;
    CUInt elem_count;
    ImDrawCallback user_callback;
    void* user_callback_data;
    CInt user_callback_data_size;
    CInt user_callback_data_offset;
}
struct ImDrawCmdHeader
{
    ImVec4 clip_rect;
    ImTextureID texture_id;
    CUInt vtx_offset;
}
struct ImDrawData
{
    CBool valid;
    CInt cmd_lists_count;
    CInt total_idx_count;
    CInt total_vtx_count;
    ImVector cmd_lists;
    ImVec2 display_pos;
    ImVec2 display_size;
    ImVec2 framebuffer_scale;
    ImGuiViewport* owner_viewport;
}
struct ImDrawDataBuilder
{
    ImVector[2] layers;
    ImVector layer_data1;
}
struct ImDrawList
{
    ImVector cmd_buffer;
    ImVector idx_buffer;
    ImVector vtx_buffer;
    ImDrawListFlags flags;
    CUInt vtx_current_idx;
    ImDrawListSharedData* data;
    ImDrawVert* vtx_write_ptr;
    ImDrawIdx* idx_write_ptr;
    ImVector path;
    ImDrawCmdHeader cmd_header;
    ImDrawListSplitter splitter;
    ImVector clip_rect_stack;
    ImVector texture_id_stack;
    ImVector callbacks_data_buf;
    float fringe_scale;
    ZString owner_name;
}
struct ImDrawListSharedData
{
    ImVec2 tex_uv_white_pixel;
    ImFont* font;
    float font_size;
    float font_scale;
    float curve_tessellation_tol;
    float circle_segment_max_error;
    ImVec4 clip_rect_fullscreen;
    ImDrawListFlags initial_flags;
    ImVector temp_buffer;
    ImVec2[48] arc_fast_vtx;
    float arc_fast_radius_cutoff;
    ImU8[64] circle_segment_counts;
    ImVec4* tex_uv_lines;
}
struct ImDrawListSplitter
{
    CInt current;
    CInt count;
    ImVector channels;
}
struct ImDrawVert
{
    ImVec2 pos;
    ImVec2 uv;
    ImU32 col;
}
struct ImFont
{
    ImVector index_advance_x;
    float fallback_advance_x;
    float font_size;
    ImVector index_lookup;
    ImVector glyphs;
    ImFontGlyph* fallback_glyph;
    ImFontAtlas* container_atlas;
    ImFontConfig* config_data;
    CShort config_data_count;
    ImWchar fallback_char;
    ImWchar ellipsis_char;
    CShort ellipsis_char_count;
    float ellipsis_width;
    float ellipsis_char_step;
    CBool dirty_lookup_tables;
    float scale;
    float ascent;
    float descent;
    CInt metrics_total_surface;
    ImU8[(0xFFFF+1)/4096/8] used4k_pages_map;
}
struct ImFontAtlas
{
    ImFontAtlasFlags flags;
    ImTextureID tex_id;
    CInt tex_desired_width;
    CInt tex_glyph_padding;
    CBool locked;
    void* user_data;
    CBool tex_ready;
    CBool tex_pixels_use_colors;
    char* tex_pixels_alpha8;
    CUInt* tex_pixels_rgba32;
    CInt tex_width;
    CInt tex_height;
    ImVec2 tex_uv_scale;
    ImVec2 tex_uv_white_pixel;
    ImVector fonts;
    ImVector custom_rects;
    ImVector config_data;
    ImVec4[(63)+1] tex_uv_lines;
    ImFontBuilderIO* font_builder_io;
    CUInt font_builder_flags;
    CInt pack_id_mouse_cursors;
    CInt pack_id_lines;
}
struct ImFontAtlasCustomRect
{
    CUShort width;
    CUShort height;
    CUShort x;
    CUShort y;
    CUInt glyph_id;
    CUInt glyph_colored;
    float glyph_advance_x;
    ImVec2 glyph_offset;
    ImFont* font;
}
struct ImFontBuilderIO
{
    FontBuilder_Build font_builder_build;
}
struct ImFontConfig
{
    void* font_data;
    CInt font_data_size;
    CBool font_data_owned_by_atlas;
    CInt font_no;
    float size_pixels;
    CInt oversample_h;
    CInt oversample_v;
    CBool pixel_snap_h;
    ImVec2 glyph_extra_spacing;
    ImVec2 glyph_offset;
    ImWchar* glyph_ranges;
    float glyph_min_advance_x;
    float glyph_max_advance_x;
    CBool merge_mode;
    CUInt font_builder_flags;
    float rasterizer_multiply;
    float rasterizer_density;
    ImWchar ellipsis_char;
    char[40] name;
    ImFont* dst_font;
}
struct ImFontGlyph
{
    CUInt colored;
    CUInt visible;
    CUInt codepoint;
    float advance_x;
    float x0;
    float y0;
    float x1;
    float y1;
    float u0;
    float v0;
    float u1;
    float v1;
}
struct ImFontGlyphRangesBuilder
{
    ImVector used_chars;
}
struct ImGuiBoxSelectState
{
    ImGuiID id;
    CBool is_active;
    CBool is_starting;
    CBool is_started_from_void;
    CBool is_started_set_nav_id_once;
    CBool request_clear;
    ImGuiKeyChord key_mods;
    ImVec2 start_pos_rel;
    ImVec2 end_pos_rel;
    ImVec2 scroll_accum;
    ImGuiWindow* window;
    CBool unclip_mode;
    ImRect unclip_rect;
    ImRect box_select_rect_prev;
    ImRect box_select_rect_curr;
}
struct ImGuiColorMod
{
    ImGuiCol col;
    ImVec4 backup_value;
}
struct ImGuiComboPreviewData
{
    ImRect preview_rect;
    ImVec2 backup_cursor_pos;
    ImVec2 backup_cursor_max_pos;
    ImVec2 backup_cursor_pos_prev_line;
    float backup_prev_line_text_base_offset;
    ImGuiLayoutType backup_layout;
}
struct ImGuiContext
{
    CBool initialized;
    CBool font_atlas_owned_by_context;
    ImGuiIO io;
    ImGuiPlatformIO platform_io;
    ImGuiStyle style;
    ImGuiConfigFlags config_flags_curr_frame;
    ImGuiConfigFlags config_flags_last_frame;
    ImFont* font;
    float font_size;
    float font_base_size;
    float font_scale;
    float current_dpi_scale;
    ImDrawListSharedData draw_list_shared_data;
    double time;
    CInt frame_count;
    CInt frame_count_ended;
    CInt frame_count_platform_ended;
    CInt frame_count_rendered;
    CBool within_frame_scope;
    CBool within_frame_scope_with_implicit_window;
    CBool within_end_child;
    CBool gc_compact_all;
    CBool test_engine_hook_items;
    void* test_engine;
    char[16] context_name;
    ImVector input_events_queue;
    ImVector input_events_trail;
    ImGuiMouseSource input_events_next_mouse_source;
    ImU32 input_events_next_event_id;
    ImVector windows;
    ImVector windows_focus_order;
    ImVector windows_temp_sort_buffer;
    ImVector current_window_stack;
    ImGuiStorage windows_by_id;
    CInt windows_active_count;
    ImVec2 windows_hover_padding;
    ImGuiID debug_break_in_window;
    ImGuiWindow* current_window;
    ImGuiWindow* hovered_window;
    ImGuiWindow* hovered_window_under_moving_window;
    ImGuiWindow* hovered_window_before_clear;
    ImGuiWindow* moving_window;
    ImGuiWindow* wheeling_window;
    ImVec2 wheeling_window_ref_mouse_pos;
    CInt wheeling_window_start_frame;
    CInt wheeling_window_scrolled_frame;
    float wheeling_window_release_timer;
    ImVec2 wheeling_window_wheel_remainder;
    ImVec2 wheeling_axis_avg;
    ImGuiID debug_draw_id_conflicts;
    ImGuiID debug_hook_id_info;
    ImGuiID hovered_id;
    ImGuiID hovered_id_previous_frame;
    CInt hovered_id_previous_frame_item_count;
    float hovered_id_timer;
    float hovered_id_not_active_timer;
    CBool hovered_id_allow_overlap;
    CBool hovered_id_is_disabled;
    CBool item_unclip_by_log;
    ImGuiID active_id;
    ImGuiID active_id_is_alive;
    float active_id_timer;
    CBool active_id_is_just_activated;
    CBool active_id_allow_overlap;
    CBool active_id_no_clear_on_focus_loss;
    CBool active_id_has_been_pressed_before;
    CBool active_id_has_been_edited_before;
    CBool active_id_has_been_edited_this_frame;
    CBool active_id_from_shortcut;
    CInt active_id_mouse_button;
    ImVec2 active_id_click_offset;
    ImGuiWindow* active_id_window;
    ImGuiInputSource active_id_source;
    ImGuiID active_id_previous_frame;
    CBool active_id_previous_frame_is_alive;
    CBool active_id_previous_frame_has_been_edited_before;
    ImGuiWindow* active_id_previous_frame_window;
    ImGuiID last_active_id;
    float last_active_id_timer;
    double last_key_mods_change_time;
    double last_key_mods_change_from_none_time;
    double last_keyboard_key_press_time;
    ImBitArrayForNamedKeys keys_may_be_char_input;
    ImGuiKeyOwnerData[(usz)key::NAMED_KEY_COUNT] keys_owner_data;
    ImGuiKeyRoutingTable keys_routing_table;
    ImU32 active_id_using_nav_dir_mask;
    CBool active_id_using_all_keyboard_keys;
    ImGuiKeyChord debug_break_in_shortcut_routing;
    ImGuiID current_focus_scope_id;
    ImGuiItemFlags current_item_flags;
    ImGuiID debug_locate_id;
    ImGuiNextItemData next_item_data;
    ImGuiLastItemData last_item_data;
    ImGuiNextWindowData next_window_data;
    CBool debug_show_group_rects;
    ImGuiCol debug_flash_style_color_idx;
    ImVector color_stack;
    ImVector style_var_stack;
    ImVector font_stack;
    ImVector focus_scope_stack;
    ImVector item_flags_stack;
    ImVector group_stack;
    ImVector open_popup_stack;
    ImVector begin_popup_stack;
    ImVector tree_node_stack;
    ImVector viewports;
    ImGuiViewportP* current_viewport;
    ImGuiViewportP* mouse_viewport;
    ImGuiViewportP* mouse_last_hovered_viewport;
    ImGuiID platform_last_focused_viewport_id;
    ImGuiPlatformMonitor fallback_monitor;
    ImRect platform_monitors_full_work_rect;
    CInt viewport_created_count;
    CInt platform_windows_created_count;
    CInt viewport_focused_stamp_count;
    CBool nav_cursor_visible;
    CBool nav_highlight_item_under_nav;
    CBool nav_mouse_pos_dirty;
    CBool nav_id_is_alive;
    ImGuiID nav_id;
    ImGuiWindow* nav_window;
    ImGuiID nav_focus_scope_id;
    ImGuiNavLayer nav_layer;
    ImGuiID nav_activate_id;
    ImGuiID nav_activate_down_id;
    ImGuiID nav_activate_pressed_id;
    ImGuiActivateFlags nav_activate_flags;
    ImVector nav_focus_route;
    ImGuiID nav_highlight_activated_id;
    float nav_highlight_activated_timer;
    ImGuiID nav_next_activate_id;
    ImGuiActivateFlags nav_next_activate_flags;
    ImGuiInputSource nav_input_source;
    ImGuiSelectionUserData nav_last_valid_selection_user_data;
    ImS8 nav_cursor_hide_frames;
    CBool nav_any_request;
    CBool nav_init_request;
    CBool nav_init_request_from_move;
    ImGuiNavItemData nav_init_result;
    CBool nav_move_submitted;
    CBool nav_move_scoring_items;
    CBool nav_move_forward_to_next_frame;
    ImGuiNavMoveFlags nav_move_flags;
    ImGuiScrollFlags nav_move_scroll_flags;
    ImGuiKeyChord nav_move_key_mods;
    ImGuiDir nav_move_dir;
    ImGuiDir nav_move_dir_for_debug;
    ImGuiDir nav_move_clip_dir;
    ImRect nav_scoring_rect;
    ImRect nav_scoring_no_clip_rect;
    CInt nav_scoring_debug_count;
    CInt nav_tabbing_dir;
    CInt nav_tabbing_counter;
    ImGuiNavItemData nav_move_result_local;
    ImGuiNavItemData nav_move_result_local_visible;
    ImGuiNavItemData nav_move_result_other;
    ImGuiNavItemData nav_tabbing_result_first;
    ImGuiID nav_just_moved_from_focus_scope_id;
    ImGuiID nav_just_moved_to_id;
    ImGuiID nav_just_moved_to_focus_scope_id;
    ImGuiKeyChord nav_just_moved_to_key_mods;
    CBool nav_just_moved_to_is_tabbing;
    CBool nav_just_moved_to_has_selection_data;
    ImGuiKeyChord config_nav_windowing_key_next;
    ImGuiKeyChord config_nav_windowing_key_prev;
    ImGuiWindow* nav_windowing_target;
    ImGuiWindow* nav_windowing_target_anim;
    ImGuiWindow* nav_windowing_list_window;
    float nav_windowing_timer;
    float nav_windowing_highlight_alpha;
    CBool nav_windowing_toggle_layer;
    ImGuiKey nav_windowing_toggle_key;
    ImVec2 nav_windowing_accum_delta_pos;
    ImVec2 nav_windowing_accum_delta_size;
    float dim_bg_ratio;
    CBool drag_drop_active;
    CBool drag_drop_within_source;
    CBool drag_drop_within_target;
    ImGuiDragDropFlags drag_drop_source_flags;
    CInt drag_drop_source_frame_count;
    CInt drag_drop_mouse_button;
    ImGuiPayload drag_drop_payload;
    ImRect drag_drop_target_rect;
    ImRect drag_drop_target_clip_rect;
    ImGuiID drag_drop_target_id;
    ImGuiDragDropFlags drag_drop_accept_flags;
    float drag_drop_accept_id_curr_rect_surface;
    ImGuiID drag_drop_accept_id_curr;
    ImGuiID drag_drop_accept_id_prev;
    CInt drag_drop_accept_frame_count;
    ImGuiID drag_drop_hold_just_pressed_id;
    ImVector drag_drop_payload_buf_heap;
    char[16] drag_drop_payload_buf_local;
    CInt clipper_temp_data_stacked;
    ImVector clipper_temp_data;
    ImGuiTable* current_table;
    ImGuiID debug_break_in_table;
    CInt tables_temp_data_stacked;
    ImVector tables_temp_data;
    ImPool tables;
    ImVector tables_last_time_active;
    ImVector draw_channels_temp_merge_buffer;
    ImGuiTabBar* current_tab_bar;
    ImPool tab_bars;
    ImVector current_tab_bar_stack;
    ImVector shrink_width_buffer;
    ImGuiBoxSelectState box_select_state;
    ImGuiMultiSelectTempData* current_multi_select;
    CInt multi_select_temp_data_stacked;
    ImVector multi_select_temp_data;
    ImPool multi_select_storage;
    ImGuiID hover_item_delay_id;
    ImGuiID hover_item_delay_id_previous_frame;
    float hover_item_delay_timer;
    float hover_item_delay_clear_timer;
    ImGuiID hover_item_unlocked_stationary_id;
    ImGuiID hover_window_unlocked_stationary_id;
    ImGuiMouseCursor mouse_cursor;
    float mouse_stationary_timer;
    ImVec2 mouse_last_valid_pos;
    ImGuiInputTextState input_text_state;
    ImGuiInputTextDeactivatedState input_text_deactivated_state;
    ImFont input_text_password_font;
    ImGuiID temp_input_id;
    ImGuiDataTypeStorage data_type_zero_value;
    CInt begin_menu_depth;
    CInt begin_combo_depth;
    ImGuiColorEditFlags color_edit_options;
    ImGuiID color_edit_current_id;
    ImGuiID color_edit_saved_id;
    float color_edit_saved_hue;
    float color_edit_saved_sat;
    ImU32 color_edit_saved_color;
    ImVec4 color_picker_ref;
    ImGuiComboPreviewData combo_preview_data;
    ImRect window_resize_border_expected_rect;
    CBool window_resize_relative_mode;
    CShort scrollbar_seek_mode;
    float scrollbar_click_delta_to_grab_center;
    float slider_grab_click_offset;
    float slider_current_accum;
    CBool slider_current_accum_dirty;
    CBool drag_current_accum_dirty;
    float drag_current_accum;
    float drag_speed_default_ratio;
    float disabled_alpha_backup;
    CShort disabled_stack_size;
    CShort tooltip_override_count;
    ImGuiWindow* tooltip_previous_window;
    ImVector clipboard_handler_data;
    ImVector menus_id_submitted_this_frame;
    ImGuiTypingSelectState typing_select_state;
    ImGuiPlatformImeData platform_ime_data;
    ImGuiPlatformImeData platform_ime_data_prev;
    ImGuiID platform_ime_viewport;
    ImGuiDockContext dock_context;
    Context_DockNodeWindowMenuHandler dock_node_window_menu_handler;
    CBool settings_loaded;
    float settings_dirty_timer;
    ImGuiTextBuffer settings_ini_data;
    ImVector settings_handlers;
    ImChunkStream settings_windows;
    ImChunkStream settings_tables;
    ImVector hooks;
    ImGuiID hook_id_next;
    ZString[(usz)loc_key::COUNT] localization_table;
    CBool log_enabled;
    ImGuiLogFlags log_flags;
    ImGuiWindow* log_window;
    ImFileHandle log_file;
    ImGuiTextBuffer log_buffer;
    ZString log_next_prefix;
    ZString log_next_suffix;
    float log_line_pos_y;
    CBool log_line_first_item;
    CInt log_depth_ref;
    CInt log_depth_to_expand;
    CInt log_depth_to_expand_default;
    ImGuiErrorCallback error_callback;
    void* error_callback_user_data;
    ImVec2 error_tooltip_locked_pos;
    CBool error_first;
    CInt error_count_current_frame;
    ImGuiErrorRecoveryState stack_sizes_in_new_frame;
    ImGuiErrorRecoveryState* stack_sizes_in_begin_for_current_window;
    CInt debug_draw_id_conflicts_count;
    ImGuiDebugLogFlags debug_log_flags;
    ImGuiTextBuffer debug_log_buf;
    ImGuiTextIndex debug_log_index;
    CInt debug_log_skipped_errors;
    ImGuiDebugLogFlags debug_log_auto_disable_flags;
    ImU8 debug_log_auto_disable_frames;
    ImU8 debug_locate_frames;
    CBool debug_break_in_locate_id;
    ImGuiKeyChord debug_break_key_chord;
    ImS8 debug_begin_return_value_cull_depth;
    CBool debug_item_picker_active;
    ImU8 debug_item_picker_mouse_button;
    ImGuiID debug_item_picker_break_id;
    float debug_flash_style_color_time;
    ImVec4 debug_flash_style_color_backup;
    ImGuiMetricsConfig debug_metrics_config;
    ImGuiIDStackTool debug_idstack_tool;
    ImGuiDebugAllocInfo debug_alloc_info;
    ImGuiDockNode* debug_hovered_dock_node;
    float[60] framerate_sec_per_frame;
    CInt framerate_sec_per_frame_idx;
    CInt framerate_sec_per_frame_count;
    float framerate_sec_per_frame_accum;
    CInt want_capture_mouse_next_frame;
    CInt want_capture_keyboard_next_frame;
    CInt want_text_input_next_frame;
    ImVector temp_buffer;
    char[64] temp_keychord_name;
}
struct ImGuiContextHook
{
    ImGuiID hook_id;
    ImGuiContextHookType type;
    ImGuiID owner;
    ImGuiContextHookCallback callback;
    void* user_data;
}
struct ImGuiDataTypeInfo
{
    usz size;
    ZString name;
    ZString print_fmt;
    ZString scan_fmt;
}
struct ImGuiDataTypeStorage
{
    ImU8[8] data;
}
struct ImGuiDataVarInfo
{
    ImGuiDataType type;
    ImU32 count;
    ImU32 offset;
}
struct ImGuiDebugAllocEntry
{
    CInt frame_count;
    ImS16 alloc_count;
    ImS16 free_count;
}
struct ImGuiDebugAllocInfo
{
    CInt total_alloc_count;
    CInt total_free_count;
    ImS16 last_entries_idx;
    ImGuiDebugAllocEntry[6] last_entries_buf;
}
struct ImGuiDockContext
{
    ImGuiStorage nodes;
    ImVector requests;
    ImVector nodes_settings;
    CBool want_full_rebuild;
}
struct ImGuiDockNode
{
    ImGuiID id;
    ImGuiDockNodeFlags shared_flags;
    ImGuiDockNodeFlags local_flags;
    ImGuiDockNodeFlags local_flags_in_windows;
    ImGuiDockNodeFlags merged_flags;
    ImGuiDockNodeState state;
    ImGuiDockNode* parent_node;
    ImGuiDockNode*[2] child_nodes;
    ImVector windows;
    ImGuiTabBar* tab_bar;
    ImVec2 pos;
    ImVec2 size;
    ImVec2 size_ref;
    ImGuiAxis split_axis;
    ImGuiWindowClass window_class;
    ImU32 last_bg_color;
    ImGuiWindow* host_window;
    ImGuiWindow* visible_window;
    ImGuiDockNode* central_node;
    ImGuiDockNode* only_node_with_windows;
    CInt count_node_with_windows;
    CInt last_frame_alive;
    CInt last_frame_active;
    CInt last_frame_focused;
    ImGuiID last_focused_node_id;
    ImGuiID selected_tab_id;
    ImGuiID want_close_tab_id;
    ImGuiID ref_viewport_id;
    ImGuiDataAuthority authority_for_pos;
    ImGuiDataAuthority authority_for_size;
    ImGuiDataAuthority authority_for_viewport;
    CBool is_visible;
    CBool is_focused;
    CBool is_bg_drawn_this_frame;
    CBool has_close_button;
    CBool has_window_menu_button;
    CBool has_central_node_child;
    CBool want_close_all;
    CBool want_lock_size_once;
    CBool want_mouse_move;
    CBool want_hidden_tab_bar_update;
    CBool want_hidden_tab_bar_toggle;
}
struct ImGuiErrorRecoveryState
{
    CShort size_of_window_stack;
    CShort size_of_idstack;
    CShort size_of_tree_stack;
    CShort size_of_color_stack;
    CShort size_of_style_var_stack;
    CShort size_of_font_stack;
    CShort size_of_focus_scope_stack;
    CShort size_of_group_stack;
    CShort size_of_item_flags_stack;
    CShort size_of_begin_popup_stack;
    CShort size_of_disabled_stack;
}
struct ImGuiFocusScopeData
{
    ImGuiID id;
    ImGuiID window_id;
}
struct ImGuiGroupData
{
    ImGuiID window_id;
    ImVec2 backup_cursor_pos;
    ImVec2 backup_cursor_max_pos;
    ImVec2 backup_cursor_pos_prev_line;
    ImVec1 backup_indent;
    ImVec1 backup_group_offset;
    ImVec2 backup_curr_line_size;
    float backup_curr_line_text_base_offset;
    ImGuiID backup_active_id_is_alive;
    CBool backup_active_id_previous_frame_is_alive;
    CBool backup_hovered_id_is_alive;
    CBool backup_is_same_line;
    CBool emit_item;
}
struct ImGuiIDStackTool
{
    CInt last_active_frame;
    CInt stack_level;
    ImGuiID query_id;
    ImVector results;
    CBool copy_to_clipboard_on_ctrl_c;
    float copy_to_clipboard_last_time;
}
struct ImGuiIO
{
    ImGuiConfigFlags config_flags;
    ImGuiBackendFlags backend_flags;
    ImVec2 display_size;
    float delta_time;
    float ini_saving_rate;
    ZString ini_filename;
    ZString log_filename;
    void* user_data;
    ImFontAtlas* fonts;
    float font_global_scale;
    CBool font_allow_user_scaling;
    ImFont* font_default;
    ImVec2 display_framebuffer_scale;
    CBool config_nav_swap_gamepad_buttons;
    CBool config_nav_move_set_mouse_pos;
    CBool config_nav_capture_keyboard;
    CBool config_nav_escape_clear_focus_item;
    CBool config_nav_escape_clear_focus_window;
    CBool config_nav_cursor_visible_auto;
    CBool config_nav_cursor_visible_always;
    CBool config_docking_no_split;
    CBool config_docking_with_shift;
    CBool config_docking_always_tab_bar;
    CBool config_docking_transparent_payload;
    CBool config_viewports_no_auto_merge;
    CBool config_viewports_no_task_bar_icon;
    CBool config_viewports_no_decoration;
    CBool config_viewports_no_default_parent;
    CBool mouse_draw_cursor;
    CBool config_mac_osxbehaviors;
    CBool config_input_trickle_event_queue;
    CBool config_input_text_cursor_blink;
    CBool config_input_text_enter_keep_active;
    CBool config_drag_click_to_input_text;
    CBool config_windows_resize_from_edges;
    CBool config_windows_move_from_title_bar_only;
    CBool config_windows_copy_contents_with_ctrl_c;
    CBool config_scrollbar_scroll_by_page;
    float config_memory_compact_timer;
    float mouse_double_click_time;
    float mouse_double_click_max_dist;
    float mouse_drag_threshold;
    float key_repeat_delay;
    float key_repeat_rate;
    CBool config_error_recovery;
    CBool config_error_recovery_enable_assert;
    CBool config_error_recovery_enable_debug_log;
    CBool config_error_recovery_enable_tooltip;
    CBool config_debug_is_debugger_present;
    CBool config_debug_highlight_id_conflicts;
    CBool config_debug_begin_return_value_once;
    CBool config_debug_begin_return_value_loop;
    CBool config_debug_ignore_focus_loss;
    CBool config_debug_ini_settings;
    ZString backend_platform_name;
    ZString backend_renderer_name;
    void* backend_platform_user_data;
    void* backend_renderer_user_data;
    void* backend_language_user_data;
    CBool want_capture_mouse;
    CBool want_capture_keyboard;
    CBool want_text_input;
    CBool want_set_mouse_pos;
    CBool want_save_ini_settings;
    CBool nav_active;
    CBool nav_visible;
    float framerate;
    CInt metrics_render_vertices;
    CInt metrics_render_indices;
    CInt metrics_render_windows;
    CInt metrics_active_windows;
    ImVec2 mouse_delta;
    ImGuiContext* ctx;
    ImVec2 mouse_pos;
    CBool[5] mouse_down;
    float mouse_wheel;
    float mouse_wheel_h;
    ImGuiMouseSource mouse_source;
    ImGuiID mouse_hovered_viewport;
    CBool key_ctrl;
    CBool key_shift;
    CBool key_alt;
    CBool key_super;
    ImGuiKeyChord key_mods;
    ImGuiKeyData[(usz)key::NAMED_KEY_COUNT] keys_data;
    CBool want_capture_mouse_unless_popup_close;
    ImVec2 mouse_pos_prev;
    ImVec2[5] mouse_clicked_pos;
    double[5] mouse_clicked_time;
    CBool[5] mouse_clicked;
    CBool[5] mouse_double_clicked;
    ImU16[5] mouse_clicked_count;
    ImU16[5] mouse_clicked_last_count;
    CBool[5] mouse_released;
    CBool[5] mouse_down_owned;
    CBool[5] mouse_down_owned_unless_popup_close;
    CBool mouse_wheel_request_axis_swap;
    CBool mouse_ctrl_left_as_right_click;
    float[5] mouse_down_duration;
    float[5] mouse_down_duration_prev;
    ImVec2[5] mouse_drag_max_distance_abs;
    float[5] mouse_drag_max_distance_sqr;
    float pen_pressure;
    CBool app_focus_lost;
    CBool app_accepting_events;
    ImWchar16 input_queue_surrogate;
    ImVector input_queue_characters;
}
struct ImGuiInputEvent
{
    ImGuiInputEventType type;
    ImGuiInputSource source;
    ImU32 event_id;
    union { ImGuiInputEventMousePos mouse_pos; ImGuiInputEventMouseWheel mouse_wheel; ImGuiInputEventMouseButton mouse_button; ImGuiInputEventMouseViewport mouse_viewport; ImGuiInputEventKey key; ImGuiInputEventText text; ImGuiInputEventAppFocused app_focused; }
    CBool added_by_test_engine;
}
struct ImGuiInputEventAppFocused
{
    CBool focused;
}
struct ImGuiInputEventKey
{
    ImGuiKey key;
    CBool down;
    float analog_value;
}
struct ImGuiInputEventMouseButton
{
    CInt button;
    CBool down;
    ImGuiMouseSource mouse_source;
}
struct ImGuiInputEventMousePos
{
    float pos_x;
    float pos_y;
    ImGuiMouseSource mouse_source;
}
struct ImGuiInputEventMouseViewport
{
    ImGuiID hovered_viewport_id;
}
struct ImGuiInputEventMouseWheel
{
    float wheel_x;
    float wheel_y;
    ImGuiMouseSource mouse_source;
}
struct ImGuiInputEventText
{
    CUInt char_;
}
struct ImGuiInputTextCallbackData
{
    ImGuiContext* ctx;
    ImGuiInputTextFlags event_flag;
    ImGuiInputTextFlags flags;
    void* user_data;
    ImWchar event_char;
    ImGuiKey event_key;
    ZString buf;
    CInt buf_text_len;
    CInt buf_size;
    CBool buf_dirty;
    CInt cursor_pos;
    CInt selection_start;
    CInt selection_end;
}
struct ImGuiInputTextDeactivatedState
{
    ImGuiID id;
    ImVector text_a;
}
struct ImGuiInputTextState
{
    ImGuiContext* ctx;
    ImStbTexteditState* stb;
    ImGuiID id;
    CInt text_len;
    ImVector text_a;
    ImVector text_to_revert_to;
    ImVector callback_text_backup;
    CInt buf_capacity;
    ImVec2 scroll;
    float cursor_anim;
    CBool cursor_follow;
    CBool selected_all_mouse_lock;
    CBool edited;
    ImGuiInputTextFlags flags;
    CBool reload_user_buf;
    CInt reload_selection_start;
    CInt reload_selection_end;
}
struct ImGuiKeyData
{
    CBool down;
    float down_duration;
    float down_duration_prev;
    float analog_value;
}
struct ImGuiKeyOwnerData
{
    ImGuiID owner_curr;
    ImGuiID owner_next;
    CBool lock_this_frame;
    CBool lock_until_release;
}
struct ImGuiKeyRoutingData
{
    ImGuiKeyRoutingIndex next_entry_index;
    ImU16 mods;
    ImU8 routing_curr_score;
    ImU8 routing_next_score;
    ImGuiID routing_curr;
    ImGuiID routing_next;
}
struct ImGuiKeyRoutingTable
{
    ImGuiKeyRoutingIndex[(usz)key::NAMED_KEY_COUNT] index;
    ImVector entries;
    ImVector entries_next;
}
struct ImGuiLastItemData
{
    ImGuiID id;
    ImGuiItemFlags item_flags;
    ImGuiItemStatusFlags status_flags;
    ImRect rect;
    ImRect nav_rect;
    ImRect display_rect;
    ImRect clip_rect;
    ImGuiKeyChord shortcut;
}
struct ImGuiListClipper
{
    ImGuiContext* ctx;
    CInt display_start;
    CInt display_end;
    CInt items_count;
    float items_height;
    float start_pos_y;
    double start_seek_offset_y;
    void* temp_data;
}
struct ImGuiListClipperData
{
    ImGuiListClipper* list_clipper;
    float lossyness_offset;
    CInt step_no;
    CInt items_frozen;
    ImVector ranges;
}
struct ImGuiListClipperRange
{
    CInt min;
    CInt max;
    CBool pos_to_index_convert;
    ImS8 pos_to_index_offset_min;
    ImS8 pos_to_index_offset_max;
}
struct ImGuiLocEntry
{
    ImGuiLocKey key;
    ZString text;
}
struct ImGuiMenuColumns
{
    ImU32 total_width;
    ImU32 next_total_width;
    ImU16 spacing;
    ImU16 offset_icon;
    ImU16 offset_label;
    ImU16 offset_shortcut;
    ImU16 offset_mark;
    ImU16[4] widths;
}
struct ImGuiMetricsConfig
{
    CBool show_debug_log;
    CBool show_idstack_tool;
    CBool show_windows_rects;
    CBool show_windows_begin_order;
    CBool show_tables_rects;
    CBool show_draw_cmd_mesh;
    CBool show_draw_cmd_bounding_boxes;
    CBool show_text_encoding_viewer;
    CBool show_atlas_tinted_with_text_color;
    CBool show_docking_nodes;
    CInt show_windows_rects_type;
    CInt show_tables_rects_type;
    CInt highlight_monitor_idx;
    ImGuiID highlight_viewport_id;
}
struct ImGuiMultiSelectIO
{
    ImVector requests;
    ImGuiSelectionUserData range_src_item;
    ImGuiSelectionUserData nav_id_item;
    CBool nav_id_selected;
    CBool range_src_reset;
    CInt items_count;
}
struct ImGuiMultiSelectState
{
    ImGuiWindow* window;
    ImGuiID id;
    CInt last_frame_active;
    CInt last_selection_size;
    ImS8 range_selected;
    ImS8 nav_id_selected;
    ImGuiSelectionUserData range_src_item;
    ImGuiSelectionUserData nav_id_item;
}
struct ImGuiMultiSelectTempData
{
    ImGuiMultiSelectIO io;
    ImGuiMultiSelectState* storage;
    ImGuiID focus_scope_id;
    ImGuiMultiSelectFlags flags;
    ImVec2 scope_rect_min;
    ImVec2 backup_cursor_max_pos;
    ImGuiSelectionUserData last_submitted_item;
    ImGuiID box_select_id;
    ImGuiKeyChord key_mods;
    ImS8 loop_request_set_all;
    CBool is_end_io;
    CBool is_focused;
    CBool is_keyboard_set_range;
    CBool nav_id_passed_by;
    CBool range_src_passed_by;
    CBool range_dst_passed_by;
}
struct ImGuiNavItemData
{
    ImGuiWindow* window;
    ImGuiID id;
    ImGuiID focus_scope_id;
    ImRect rect_rel;
    ImGuiItemFlags item_flags;
    float dist_box;
    float dist_center;
    float dist_axial;
    ImGuiSelectionUserData selection_user_data;
}
struct ImGuiNextItemData
{
    ImGuiNextItemDataFlags has_flags;
    ImGuiItemFlags item_flags;
    ImGuiID focus_scope_id;
    ImGuiSelectionUserData selection_user_data;
    float width;
    ImGuiKeyChord shortcut;
    ImGuiInputFlags shortcut_flags;
    CBool open_val;
    ImU8 open_cond;
    ImGuiDataTypeStorage ref_val;
    ImGuiID storage_id;
}
struct ImGuiNextWindowData
{
    ImGuiNextWindowDataFlags flags;
    ImGuiCond pos_cond;
    ImGuiCond size_cond;
    ImGuiCond collapsed_cond;
    ImGuiCond dock_cond;
    ImVec2 pos_val;
    ImVec2 pos_pivot_val;
    ImVec2 size_val;
    ImVec2 content_size_val;
    ImVec2 scroll_val;
    ImGuiChildFlags child_flags;
    CBool pos_undock;
    CBool collapsed_val;
    ImRect size_constraint_rect;
    ImGuiSizeCallback size_callback;
    void* size_callback_user_data;
    float bg_alpha_val;
    ImGuiID viewport_id;
    ImGuiID dock_id;
    ImGuiWindowClass window_class;
    ImVec2 menu_bar_offset_min_val;
    ImGuiWindowRefreshFlags refresh_flags_val;
}
struct ImGuiOldColumnData
{
    float offset_norm;
    float offset_norm_before_resize;
    ImGuiOldColumnFlags flags;
    ImRect clip_rect;
}
struct ImGuiOldColumns
{
    ImGuiID id;
    ImGuiOldColumnFlags flags;
    CBool is_first_frame;
    CBool is_being_resized;
    CInt current;
    CInt count;
    float off_min_x;
    float off_max_x;
    float line_min_y;
    float line_max_y;
    float host_cursor_pos_y;
    float host_cursor_max_pos_x;
    ImRect host_initial_clip_rect;
    ImRect host_backup_clip_rect;
    ImRect host_backup_parent_work_rect;
    ImVector columns;
    ImDrawListSplitter splitter;
}
struct ImGuiOnceUponAFrame
{
    CInt ref_frame;
}
struct ImGuiPayload
{
    void* data;
    CInt data_size;
    ImGuiID source_id;
    ImGuiID source_parent_id;
    CInt data_frame_count;
    char[32+1] data_type;
    CBool preview;
    CBool delivery;
}
struct ImGuiPlatformIO
{
    Platform_GetClipboardTextFn platform_get_clipboard_text_fn;
    Platform_SetClipboardTextFn platform_set_clipboard_text_fn;
    void* platform_clipboard_user_data;
    Platform_OpenInShellFn platform_open_in_shell_fn;
    void* platform_open_in_shell_user_data;
    Platform_SetImeDataFn platform_set_ime_data_fn;
    void* platform_ime_user_data;
    ImWchar platform_locale_decimal_point;
    void* renderer_render_state;
    Platform_WindowActionFn platform_create_window;
    Platform_WindowActionFn platform_destroy_window;
    Platform_WindowActionFn platform_show_window;
    Platform_SetWindowPosOrSizeFn platform_set_window_pos;
    Platform_GetWindowPosOrSizeFn platform_get_window_pos;
    Platform_SetWindowPosOrSizeFn platform_set_window_size;
    Platform_GetWindowPosOrSizeFn platform_get_window_size;
    Platform_WindowActionFn platform_set_window_focus;
    Platform_GetWindowBoolPropFn platform_get_window_focus;
    Platform_GetWindowBoolPropFn platform_get_window_minimized;
    Platform_SetWindowTitleFn platform_set_window_title;
    Platform_SetWindowAlphaFn platform_set_window_alpha;
    Platform_WindowActionFn platform_update_window;
    Platform_RenderActionFn platform_render_window;
    Platform_RenderActionFn platform_swap_buffers;
    Platform_GetWindowDpiScaleFn platform_get_window_dpi_scale;
    Platform_WindowActionFn platform_on_changed_viewport;
    Platform_GetWindowWorkAreaInsetsFn platform_get_window_work_area_insets;
    Platform_CreateVkSurfaceFn platform_create_vk_surface;
    Platform_WindowActionFn renderer_create_window;
    Platform_WindowActionFn renderer_destroy_window;
    Platform_SetWindowPosOrSizeFn renderer_set_window_size;
    Platform_RenderActionFn renderer_render_window;
    Platform_RenderActionFn renderer_swap_buffers;
    ImVector monitors;
    ImVector viewports;
}
struct ImGuiPlatformImeData
{
    CBool want_visible;
    ImVec2 input_pos;
    float input_line_height;
}
struct ImGuiPlatformMonitor
{
    ImVec2 main_pos;
    ImVec2 main_size;
    ImVec2 work_pos;
    ImVec2 work_size;
    float dpi_scale;
    void* platform_handle;
}
struct ImGuiPopupData
{
    ImGuiID popup_id;
    ImGuiWindow* window;
    ImGuiWindow* restore_nav_window;
    CInt parent_nav_layer;
    CInt open_frame_count;
    ImGuiID open_parent_id;
    ImVec2 open_popup_pos;
    ImVec2 open_mouse_pos;
}
struct ImGuiPtrOrIndex
{
    void* ptr;
    CInt index;
}
struct ImGuiSelectionBasicStorage
{
    CInt size;
    CBool preserve_order;
    void* user_data;
    SelectionStorage_AdapterIndexToStorageIdFn adapter_index_to_storage_id;
    CInt selection_order;
    ImGuiStorage storage;
}
struct ImGuiSelectionExternalStorage
{
    void* user_data;
    SelectionStorage_AdapterSetItemSelectedFn adapter_set_item_selected;
}
struct ImGuiSelectionRequest
{
    ImGuiSelectionRequestType type;
    CBool selected;
    ImS8 range_direction;
    ImGuiSelectionUserData range_first_item;
    ImGuiSelectionUserData range_last_item;
}
struct ImGuiSettingsHandler
{
    ZString type_name;
    ImGuiID type_hash;
    Settings_ClearAllFn clear_all_fn;
    Settings_ReadInitFn read_init_fn;
    Settings_ReadOpenFn read_open_fn;
    Settings_ReadLineFn read_line_fn;
    Settings_ApplyAllFn apply_all_fn;
    Settings_WriteAllFn write_all_fn;
    void* user_data;
}
struct ImGuiShrinkWidthItem
{
    CInt index;
    float width;
    float initial_width;
}
struct ImGuiSizeCallbackData
{
    void* user_data;
    ImVec2 pos;
    ImVec2 current_size;
    ImVec2 desired_size;
}
struct ImGuiStackLevelInfo
{
    ImGuiID id;
    ImS8 query_frame_count;
    CBool query_success;
    ImGuiDataType data_type;
    char[57] desc;
}
struct ImGuiStorage
{
    ImVector data;
}
struct ImGuiStoragePair
{
    ImGuiID key;
    union { int val_i; float val_f; void* val_p; }
}
struct ImGuiStyle
{
    float alpha;
    float disabled_alpha;
    ImVec2 window_padding;
    float window_rounding;
    float window_border_size;
    ImVec2 window_min_size;
    ImVec2 window_title_align;
    ImGuiDir window_menu_button_position;
    float child_rounding;
    float child_border_size;
    float popup_rounding;
    float popup_border_size;
    ImVec2 frame_padding;
    float frame_rounding;
    float frame_border_size;
    ImVec2 item_spacing;
    ImVec2 item_inner_spacing;
    ImVec2 cell_padding;
    ImVec2 touch_extra_padding;
    float indent_spacing;
    float columns_min_spacing;
    float scrollbar_size;
    float scrollbar_rounding;
    float grab_min_size;
    float grab_rounding;
    float log_slider_deadzone;
    float tab_rounding;
    float tab_border_size;
    float tab_min_width_for_close_button;
    float tab_bar_border_size;
    float tab_bar_overline_size;
    float table_angled_headers_angle;
    ImVec2 table_angled_headers_text_align;
    ImGuiDir color_button_position;
    ImVec2 button_text_align;
    ImVec2 selectable_text_align;
    float separator_text_border_size;
    ImVec2 separator_text_align;
    ImVec2 separator_text_padding;
    ImVec2 display_window_padding;
    ImVec2 display_safe_area_padding;
    float docking_separator_size;
    float mouse_cursor_scale;
    CBool anti_aliased_lines;
    CBool anti_aliased_lines_use_tex;
    CBool anti_aliased_fill;
    float curve_tessellation_tol;
    float circle_tessellation_max_error;
    ImVec4[(usz)col::COUNT] colors;
    float hover_stationary_delay;
    float hover_delay_short;
    float hover_delay_normal;
    ImGuiHoveredFlags hover_flags_for_tooltip_mouse;
    ImGuiHoveredFlags hover_flags_for_tooltip_nav;
}
struct ImGuiStyleMod
{
    ImGuiStyleVar var_idx;
    union { CInt[2] backup_int; float[2] backup_float; }
}
struct ImGuiTabBar
{
    ImGuiWindow* window;
    ImVector tabs;
    ImGuiTabBarFlags flags;
    ImGuiID id;
    ImGuiID selected_tab_id;
    ImGuiID next_selected_tab_id;
    ImGuiID visible_tab_id;
    CInt curr_frame_visible;
    CInt prev_frame_visible;
    ImRect bar_rect;
    float curr_tabs_contents_height;
    float prev_tabs_contents_height;
    float width_all_tabs;
    float width_all_tabs_ideal;
    float scrolling_anim;
    float scrolling_target;
    float scrolling_target_dist_to_visibility;
    float scrolling_speed;
    float scrolling_rect_min_x;
    float scrolling_rect_max_x;
    float separator_min_x;
    float separator_max_x;
    ImGuiID reorder_request_tab_id;
    ImS16 reorder_request_offset;
    ImS8 begin_count;
    CBool want_layout;
    CBool visible_tab_was_submitted;
    CBool tabs_added_new;
    ImS16 tabs_active_count;
    ImS16 last_tab_item_idx;
    float item_spacing_y;
    ImVec2 frame_padding;
    ImVec2 backup_cursor_pos;
    ImGuiTextBuffer tabs_names;
}
struct ImGuiTabItem
{
    ImGuiID id;
    ImGuiTabItemFlags flags;
    ImGuiWindow* window;
    CInt last_frame_visible;
    CInt last_frame_selected;
    float offset;
    float width;
    float content_width;
    float requested_width;
    ImS32 name_offset;
    ImS16 begin_order;
    ImS16 index_during_layout;
    CBool want_close;
}
struct ImGuiTable
{
    ImGuiID id;
    ImGuiTableFlags flags;
    void* raw_data;
    ImGuiTableTempData* temp_data;
    ImSpan columns;
    ImSpan display_order_to_index;
    ImSpan row_cell_data;
    ImBitArrayPtr enabled_mask_by_display_order;
    ImBitArrayPtr enabled_mask_by_index;
    ImBitArrayPtr visible_mask_by_index;
    ImGuiTableFlags settings_loaded_flags;
    CInt settings_offset;
    CInt last_frame_active;
    CInt columns_count;
    CInt current_row;
    CInt current_column;
    ImS16 instance_current;
    ImS16 instance_interacted;
    float row_pos_y1;
    float row_pos_y2;
    float row_min_height;
    float row_cell_padding_y;
    float row_text_baseline;
    float row_indent_offset_x;
    ImGuiTableRowFlags row_flags;
    ImGuiTableRowFlags last_row_flags;
    CInt row_bg_color_counter;
    ImU32[2] row_bg_color;
    ImU32 border_color_strong;
    ImU32 border_color_light;
    float border_x1;
    float border_x2;
    float host_indent_x;
    float min_column_width;
    float outer_padding_x;
    float cell_padding_x;
    float cell_spacing_x1;
    float cell_spacing_x2;
    float inner_width;
    float columns_given_width;
    float columns_auto_fit_width;
    float columns_stretch_sum_weights;
    float resized_column_next_width;
    float resize_lock_min_contents_x2;
    float ref_scale;
    float angled_headers_height;
    float angled_headers_slope;
    ImRect outer_rect;
    ImRect inner_rect;
    ImRect work_rect;
    ImRect inner_clip_rect;
    ImRect bg_clip_rect;
    ImRect bg0_clip_rect_for_draw_cmd;
    ImRect bg2_clip_rect_for_draw_cmd;
    ImRect host_clip_rect;
    ImRect host_backup_inner_clip_rect;
    ImGuiWindow* outer_window;
    ImGuiWindow* inner_window;
    ImGuiTextBuffer columns_names;
    ImDrawListSplitter* draw_splitter;
    ImGuiTableInstanceData instance_data_first;
    ImVector instance_data_extra;
    ImGuiTableColumnSortSpecs sort_specs_single;
    ImVector sort_specs_multi;
    ImGuiTableSortSpecs sort_specs;
    ImGuiTableColumnIdx sort_specs_count;
    ImGuiTableColumnIdx columns_enabled_count;
    ImGuiTableColumnIdx columns_enabled_fixed_count;
    ImGuiTableColumnIdx decl_columns_count;
    ImGuiTableColumnIdx angled_headers_count;
    ImGuiTableColumnIdx hovered_column_body;
    ImGuiTableColumnIdx hovered_column_border;
    ImGuiTableColumnIdx highlight_column_header;
    ImGuiTableColumnIdx auto_fit_single_column;
    ImGuiTableColumnIdx resized_column;
    ImGuiTableColumnIdx last_resized_column;
    ImGuiTableColumnIdx held_header_column;
    ImGuiTableColumnIdx reorder_column;
    ImGuiTableColumnIdx reorder_column_dir;
    ImGuiTableColumnIdx left_most_enabled_column;
    ImGuiTableColumnIdx right_most_enabled_column;
    ImGuiTableColumnIdx left_most_stretched_column;
    ImGuiTableColumnIdx right_most_stretched_column;
    ImGuiTableColumnIdx context_popup_column;
    ImGuiTableColumnIdx freeze_rows_request;
    ImGuiTableColumnIdx freeze_rows_count;
    ImGuiTableColumnIdx freeze_columns_request;
    ImGuiTableColumnIdx freeze_columns_count;
    ImGuiTableColumnIdx row_cell_data_current;
    ImGuiTableDrawChannelIdx dummy_draw_channel;
    ImGuiTableDrawChannelIdx bg2_draw_channel_current;
    ImGuiTableDrawChannelIdx bg2_draw_channel_unfrozen;
    CBool is_layout_locked;
    CBool is_inside_row;
    CBool is_initializing;
    CBool is_sort_specs_dirty;
    CBool is_using_headers;
    CBool is_context_popup_open;
    CBool disable_default_context_menu;
    CBool is_settings_request_load;
    CBool is_settings_dirty;
    CBool is_default_display_order;
    CBool is_reset_all_request;
    CBool is_reset_display_order_request;
    CBool is_unfrozen_rows;
    CBool is_default_sizing_policy;
    CBool is_active_id_alive_before_table;
    CBool is_active_id_in_table;
    CBool has_scrollbar_ycurr;
    CBool has_scrollbar_yprev;
    CBool memory_compacted;
    CBool host_skip_items;
}
struct ImGuiTableCellData
{
    ImU32 bg_color;
    ImGuiTableColumnIdx column;
}
struct ImGuiTableColumn
{
    ImGuiTableColumnFlags flags;
    float width_given;
    float min_x;
    float max_x;
    float width_request;
    float width_auto;
    float width_max;
    float stretch_weight;
    float init_stretch_weight_or_width;
    ImRect clip_rect;
    ImGuiID user_id;
    float work_min_x;
    float work_max_x;
    float item_width;
    float content_max_xfrozen;
    float content_max_xunfrozen;
    float content_max_xheaders_used;
    float content_max_xheaders_ideal;
    ImS16 name_offset;
    ImGuiTableColumnIdx display_order;
    ImGuiTableColumnIdx index_within_enabled_set;
    ImGuiTableColumnIdx prev_enabled_column;
    ImGuiTableColumnIdx next_enabled_column;
    ImGuiTableColumnIdx sort_order;
    ImGuiTableDrawChannelIdx draw_channel_current;
    ImGuiTableDrawChannelIdx draw_channel_frozen;
    ImGuiTableDrawChannelIdx draw_channel_unfrozen;
    CBool is_enabled;
    CBool is_user_enabled;
    CBool is_user_enabled_next_frame;
    CBool is_visible_x;
    CBool is_visible_y;
    CBool is_request_output;
    CBool is_skip_items;
    CBool is_preserve_width_auto;
    ImS8 nav_layer_current;
    ImU8 auto_fit_queue;
    ImU8 cannot_skip_items_queue;
    ImU8 sort_direction;
    ImU8 sort_directions_avail_count;
    ImU8 sort_directions_avail_mask;
    ImU8 sort_directions_avail_list;
}
struct ImGuiTableColumnSettings
{
    float width_or_weight;
    ImGuiID user_id;
    ImGuiTableColumnIdx index;
    ImGuiTableColumnIdx display_order;
    ImGuiTableColumnIdx sort_order;
    ImU8 sort_direction;
    ImU8 is_enabled;
    ImU8 is_stretch;
}
struct ImGuiTableColumnSortSpecs
{
    ImGuiID column_user_id;
    ImS16 column_index;
    ImS16 sort_order;
    ImGuiSortDirection sort_direction;
}
struct ImGuiTableHeaderData
{
    ImGuiTableColumnIdx index;
    ImU32 text_color;
    ImU32 bg_color0;
    ImU32 bg_color1;
}
struct ImGuiTableInstanceData
{
    ImGuiID table_instance_id;
    float last_outer_height;
    float last_top_headers_row_height;
    float last_frozen_height;
    CInt hovered_row_last;
    CInt hovered_row_next;
}
struct ImGuiTableSettings
{
    ImGuiID id;
    ImGuiTableFlags save_flags;
    float ref_scale;
    ImGuiTableColumnIdx columns_count;
    ImGuiTableColumnIdx columns_count_max;
    CBool want_apply;
}
struct ImGuiTableSortSpecs
{
    ImGuiTableColumnSortSpecs* specs;
    CInt specs_count;
    CBool specs_dirty;
}
struct ImGuiTableTempData
{
    CInt table_index;
    float last_time_active;
    float angled_headers_extra_width;
    ImVector angled_headers_requests;
    ImVec2 user_outer_size;
    ImDrawListSplitter draw_splitter;
    ImRect host_backup_work_rect;
    ImRect host_backup_parent_work_rect;
    ImVec2 host_backup_prev_line_size;
    ImVec2 host_backup_curr_line_size;
    ImVec2 host_backup_cursor_max_pos;
    ImVec1 host_backup_columns_offset;
    float host_backup_item_width;
    CInt host_backup_item_width_stack_size;
}
struct ImGuiTextBuffer
{
    ImVector buf;
}
struct ImGuiTextFilter
{
    char[256] input_buf;
    ImVector filters;
    CInt count_grep;
}
struct ImGuiTextIndex
{
    ImVector line_offsets;
    CInt end_offset;
}
struct ImGuiTextRange
{
    ZString b;
    ZString e;
}
struct ImGuiTreeNodeStackData
{
    ImGuiID id;
    ImGuiTreeNodeFlags tree_flags;
    ImGuiItemFlags item_flags;
    ImRect nav_rect;
}
struct ImGuiTypingSelectRequest
{
    ImGuiTypingSelectFlags flags;
    CInt search_buffer_len;
    ZString search_buffer;
    CBool select_request;
    CBool single_char_mode;
    ImS8 single_char_size;
}
struct ImGuiTypingSelectState
{
    ImGuiTypingSelectRequest request;
    char[64] search_buffer;
    ImGuiID focus_scope;
    CInt last_request_frame;
    float last_request_time;
    CBool single_char_mode_lock;
}
struct ImGuiViewport
{
    ImGuiID id;
    ImGuiViewportFlags flags;
    ImVec2 pos;
    ImVec2 size;
    ImVec2 work_pos;
    ImVec2 work_size;
    float dpi_scale;
    ImGuiID parent_viewport_id;
    ImDrawData* draw_data;
    void* renderer_user_data;
    void* platform_user_data;
    void* platform_handle;
    void* platform_handle_raw;
    CBool platform_window_created;
    CBool platform_request_move;
    CBool platform_request_resize;
    CBool platform_request_close;
}
struct ImGuiViewportP
{
    ImGuiViewport im_gui_viewport;
    ImGuiWindow* window;
    CInt idx;
    CInt last_frame_active;
    CInt last_focused_stamp_count;
    ImGuiID last_name_hash;
    ImVec2 last_pos;
    ImVec2 last_size;
    float alpha;
    float last_alpha;
    CBool last_focused_had_nav_window;
    CShort platform_monitor;
    CInt[2] bg_fg_draw_lists_last_frame;
    ImDrawList*[2] bg_fg_draw_lists;
    ImDrawData draw_data_p;
    ImDrawDataBuilder draw_data_builder;
    ImVec2 last_platform_pos;
    ImVec2 last_platform_size;
    ImVec2 last_renderer_size;
    ImVec2 work_inset_min;
    ImVec2 work_inset_max;
    ImVec2 build_work_inset_min;
    ImVec2 build_work_inset_max;
}
struct ImGuiWindow
{
    ImGuiContext* ctx;
    ZString name;
    ImGuiID id;
    ImGuiWindowFlags flags;
    ImGuiWindowFlags flags_previous_frame;
    ImGuiChildFlags child_flags;
    ImGuiWindowClass window_class;
    ImGuiViewportP* viewport;
    ImGuiID viewport_id;
    ImVec2 viewport_pos;
    CInt viewport_allow_platform_monitor_extend;
    ImVec2 pos;
    ImVec2 size;
    ImVec2 size_full;
    ImVec2 content_size;
    ImVec2 content_size_ideal;
    ImVec2 content_size_explicit;
    ImVec2 window_padding;
    float window_rounding;
    float window_border_size;
    float title_bar_height;
    float menu_bar_height;
    float deco_outer_size_x1;
    float deco_outer_size_y1;
    float deco_outer_size_x2;
    float deco_outer_size_y2;
    float deco_inner_size_x1;
    float deco_inner_size_y1;
    CInt name_buf_len;
    ImGuiID move_id;
    ImGuiID tab_id;
    ImGuiID child_id;
    ImGuiID popup_id;
    ImVec2 scroll;
    ImVec2 scroll_max;
    ImVec2 scroll_target;
    ImVec2 scroll_target_center_ratio;
    ImVec2 scroll_target_edge_snap_dist;
    ImVec2 scrollbar_sizes;
    CBool scrollbar_x;
    CBool scrollbar_y;
    CBool viewport_owned;
    CBool active;
    CBool was_active;
    CBool write_accessed;
    CBool collapsed;
    CBool want_collapse_toggle;
    CBool skip_items;
    CBool skip_refresh;
    CBool appearing;
    CBool hidden;
    CBool is_fallback_window;
    CBool is_explicit_child;
    CBool has_close_button;
    ichar resize_border_hovered;
    ichar resize_border_held;
    CShort begin_count;
    CShort begin_count_previous_frame;
    CShort begin_order_within_parent;
    CShort begin_order_within_context;
    CShort focus_order;
    ImS8 auto_fit_frames_x;
    ImS8 auto_fit_frames_y;
    CBool auto_fit_only_grows;
    ImGuiDir auto_pos_last_direction;
    ImS8 hidden_frames_can_skip_items;
    ImS8 hidden_frames_cannot_skip_items;
    ImS8 hidden_frames_for_render_only;
    ImS8 disable_inputs_frames;
    ImGuiCond set_window_pos_allow_flags;
    ImGuiCond set_window_size_allow_flags;
    ImGuiCond set_window_collapsed_allow_flags;
    ImGuiCond set_window_dock_allow_flags;
    ImVec2 set_window_pos_val;
    ImVec2 set_window_pos_pivot;
    ImVector idstack;
    ImGuiWindowTempData dc;
    ImRect outer_rect_clipped;
    ImRect inner_rect;
    ImRect inner_clip_rect;
    ImRect work_rect;
    ImRect parent_work_rect;
    ImRect clip_rect;
    ImRect content_region_rect;
    ImVec2ih hit_test_hole_size;
    ImVec2ih hit_test_hole_offset;
    CInt last_frame_active;
    CInt last_frame_just_focused;
    float last_time_active;
    float item_width_default;
    ImGuiStorage state_storage;
    ImVector columns_storage;
    float font_window_scale;
    float font_dpi_scale;
    CInt settings_offset;
    ImDrawList* draw_list;
    ImDrawList draw_list_inst;
    ImGuiWindow* parent_window;
    ImGuiWindow* parent_window_in_begin_stack;
    ImGuiWindow* root_window;
    ImGuiWindow* root_window_popup_tree;
    ImGuiWindow* root_window_dock_tree;
    ImGuiWindow* root_window_for_title_bar_highlight;
    ImGuiWindow* root_window_for_nav;
    ImGuiWindow* parent_window_for_focus_route;
    ImGuiWindow* nav_last_child_nav_window;
    ImGuiID[(usz)nav_layer::COUNT] nav_last_ids;
    ImRect[(usz)nav_layer::COUNT] nav_rect_rel;
    ImVec2[(usz)nav_layer::COUNT] nav_preferred_scoring_pos_rel;
    ImGuiID nav_root_focus_scope_id;
    CInt memory_draw_list_idx_capacity;
    CInt memory_draw_list_vtx_capacity;
    CBool memory_compacted;
    CBool dock_is_active;
    CBool dock_node_is_visible;
    CBool dock_tab_is_visible;
    CBool dock_tab_want_close;
    CShort dock_order;
    ImGuiWindowDockStyle dock_style;
    ImGuiDockNode* dock_node;
    ImGuiDockNode* dock_node_as_host;
    ImGuiID dock_id;
    ImGuiItemStatusFlags dock_tab_item_status_flags;
    ImRect dock_tab_item_rect;
}
struct ImGuiWindowClass
{
    ImGuiID class_id;
    ImGuiID parent_viewport_id;
    ImGuiID focus_route_parent_window_id;
    ImGuiViewportFlags viewport_flags_override_set;
    ImGuiViewportFlags viewport_flags_override_clear;
    ImGuiTabItemFlags tab_item_flags_override_set;
    ImGuiDockNodeFlags dock_node_flags_override_set;
    CBool docking_always_tab_bar;
    CBool docking_allow_unclassed;
}
struct ImGuiWindowDockStyle
{
    ImU32[(usz)window_dock_style_col::COUNT] colors;
}
struct ImGuiWindowSettings
{
    ImGuiID id;
    ImVec2ih pos;
    ImVec2ih size;
    ImVec2ih viewport_pos;
    ImGuiID viewport_id;
    ImGuiID dock_id;
    ImGuiID class_id;
    CShort dock_order;
    CBool collapsed;
    CBool is_child;
    CBool want_apply;
    CBool want_delete;
}
struct ImGuiWindowStackData
{
    ImGuiWindow* window;
    ImGuiLastItemData parent_last_item_data_backup;
    ImGuiErrorRecoveryState stack_sizes_in_begin;
    CBool disabled_override_reenable;
}
struct ImGuiWindowTempData
{
    ImVec2 cursor_pos;
    ImVec2 cursor_pos_prev_line;
    ImVec2 cursor_start_pos;
    ImVec2 cursor_max_pos;
    ImVec2 ideal_max_pos;
    ImVec2 curr_line_size;
    ImVec2 prev_line_size;
    float curr_line_text_base_offset;
    float prev_line_text_base_offset;
    CBool is_same_line;
    CBool is_set_pos;
    ImVec1 indent;
    ImVec1 columns_offset;
    ImVec1 group_offset;
    ImVec2 cursor_start_pos_lossyness;
    ImGuiNavLayer nav_layer_current;
    CShort nav_layers_active_mask;
    CShort nav_layers_active_mask_next;
    CBool nav_is_scroll_pushable_x;
    CBool nav_hide_highlight_one_frame;
    CBool nav_window_has_scroll_y;
    CBool menu_bar_appending;
    ImVec2 menu_bar_offset;
    ImGuiMenuColumns menu_columns;
    CInt tree_depth;
    ImU32 tree_has_stack_data_depth_mask;
    ImVector child_windows;
    ImGuiStorage* state_storage;
    ImGuiOldColumns* current_columns;
    CInt current_table_idx;
    ImGuiLayoutType layout_type;
    ImGuiLayoutType parent_layout_type;
    ImU32 modal_dim_bg_color;
    float item_width;
    float text_wrap_pos;
    ImVector item_width_stack;
    ImVector text_wrap_pos_stack;
}
struct ImRect
{
    ImVec2 min;
    ImVec2 max;
}
struct Old_ImVec1
{
    float x;
}
struct Old_ImVec2
{
    float x;
    float y;
}
struct ImVec2ih
{
    CShort x;
    CShort y;
}
struct Old_ImVec4
{
    float x;
    float y;
    float z;
    float w;
}
