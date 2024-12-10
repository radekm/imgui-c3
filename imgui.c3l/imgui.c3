module ig;
import libc;
distinct ImStbTexteditState = void;
// Manually translated from cimgui.h.
// It should be kept in sync.
struct ImBitArrayForNamedKeys
{
    ImU32[((usz)key::NAMED_KEY_COUNT + 31) >> 5] storage;
}
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
def FontBuilder_Build = fn bool(ImFontAtlas* atlas);
def Platform_GetClipboardTextFn = fn ZString(ImGuiContext* ctx);
def Platform_SetClipboardTextFn = fn void(ImGuiContext* ctx, ZString text);
def Platform_OpenInShellFn = fn bool(ImGuiContext* ctx, ZString path);
def Platform_SetImeDataFn = fn void(ImGuiContext* ctx, ImGuiViewport* viewport, ImGuiPlatformImeData* data);
def Platform_WindowActionFn = fn void(ImGuiViewport* vp);
def Platform_SetWindowPosOrSizeFn = fn void(ImGuiViewport* vp, ImVec2 pos_or_size);
def Platform_GetWindowPosOrSizeFn = fn ImVec2(ImGuiViewport* vp);
def Platform_GetWindowWorkAreaInsetsFn = fn ImVec4(ImGuiViewport* vp);
def Platform_GetWindowBoolPropFn = fn bool(ImGuiViewport* vp);
def Platform_SetWindowTitleFn = fn void(ImGuiViewport* vp, ZString str);
def Platform_SetWindowAlphaFn = fn void(ImGuiViewport* vp, float alpha);
def Platform_RenderActionFn = fn void(ImGuiViewport* vp, void* render_arg);
def Platform_GetWindowDpiScaleFn = fn float(ImGuiViewport* vp);
def Platform_CreateVkSurfaceFn = fn CInt(ImGuiViewport* vp, ImU64 vk_inst, void* vk_allocators, ImU64* out_vk_surface);
def SelectionStorage_AdapterIndexToStorageIdFn = fn ImGuiID(ImGuiSelectionBasicStorage* self, CInt idx);
def SelectionStorage_AdapterSetItemSelectedFn = fn void(ImGuiSelectionExternalStorage* self, CInt idx, bool selected);
def GetZStringByIndexFn = fn ZString(void* user_data, CInt idx);
def CompareFn = fn CInt(void*, void*);
def GetFloatByIndexFn = fn float(void* data, CInt idx);
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
    bool valid;
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
    bool dirty_lookup_tables;
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
    bool locked;
    void* user_data;
    bool tex_ready;
    bool tex_pixels_use_colors;
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
    bool font_data_owned_by_atlas;
    CInt font_no;
    float size_pixels;
    CInt oversample_h;
    CInt oversample_v;
    bool pixel_snap_h;
    ImVec2 glyph_extra_spacing;
    ImVec2 glyph_offset;
    ImWchar* glyph_ranges;
    float glyph_min_advance_x;
    float glyph_max_advance_x;
    bool merge_mode;
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
    bool is_active;
    bool is_starting;
    bool is_started_from_void;
    bool is_started_set_nav_id_once;
    bool request_clear;
    ImGuiKeyChord key_mods;
    ImVec2 start_pos_rel;
    ImVec2 end_pos_rel;
    ImVec2 scroll_accum;
    ImGuiWindow* window;
    bool unclip_mode;
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
    bool initialized;
    bool font_atlas_owned_by_context;
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
    bool within_frame_scope;
    bool within_frame_scope_with_implicit_window;
    bool within_end_child;
    bool gc_compact_all;
    bool test_engine_hook_items;
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
    bool hovered_id_allow_overlap;
    bool hovered_id_is_disabled;
    bool item_unclip_by_log;
    ImGuiID active_id;
    ImGuiID active_id_is_alive;
    float active_id_timer;
    bool active_id_is_just_activated;
    bool active_id_allow_overlap;
    bool active_id_no_clear_on_focus_loss;
    bool active_id_has_been_pressed_before;
    bool active_id_has_been_edited_before;
    bool active_id_has_been_edited_this_frame;
    bool active_id_from_shortcut;
    CInt active_id_mouse_button;
    ImVec2 active_id_click_offset;
    ImGuiWindow* active_id_window;
    ImGuiInputSource active_id_source;
    ImGuiID active_id_previous_frame;
    bool active_id_previous_frame_is_alive;
    bool active_id_previous_frame_has_been_edited_before;
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
    bool active_id_using_all_keyboard_keys;
    ImGuiKeyChord debug_break_in_shortcut_routing;
    ImGuiID current_focus_scope_id;
    ImGuiItemFlags current_item_flags;
    ImGuiID debug_locate_id;
    ImGuiNextItemData next_item_data;
    ImGuiLastItemData last_item_data;
    ImGuiNextWindowData next_window_data;
    bool debug_show_group_rects;
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
    bool nav_cursor_visible;
    bool nav_highlight_item_under_nav;
    bool nav_mouse_pos_dirty;
    bool nav_id_is_alive;
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
    bool nav_any_request;
    bool nav_init_request;
    bool nav_init_request_from_move;
    ImGuiNavItemData nav_init_result;
    bool nav_move_submitted;
    bool nav_move_scoring_items;
    bool nav_move_forward_to_next_frame;
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
    bool nav_just_moved_to_is_tabbing;
    bool nav_just_moved_to_has_selection_data;
    ImGuiKeyChord config_nav_windowing_key_next;
    ImGuiKeyChord config_nav_windowing_key_prev;
    ImGuiWindow* nav_windowing_target;
    ImGuiWindow* nav_windowing_target_anim;
    ImGuiWindow* nav_windowing_list_window;
    float nav_windowing_timer;
    float nav_windowing_highlight_alpha;
    bool nav_windowing_toggle_layer;
    ImGuiKey nav_windowing_toggle_key;
    ImVec2 nav_windowing_accum_delta_pos;
    ImVec2 nav_windowing_accum_delta_size;
    float dim_bg_ratio;
    bool drag_drop_active;
    bool drag_drop_within_source;
    bool drag_drop_within_target;
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
    bool window_resize_relative_mode;
    CShort scrollbar_seek_mode;
    float scrollbar_click_delta_to_grab_center;
    float slider_grab_click_offset;
    float slider_current_accum;
    bool slider_current_accum_dirty;
    bool drag_current_accum_dirty;
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
    bool settings_loaded;
    float settings_dirty_timer;
    ImGuiTextBuffer settings_ini_data;
    ImVector settings_handlers;
    ImChunkStream settings_windows;
    ImChunkStream settings_tables;
    ImVector hooks;
    ImGuiID hook_id_next;
    ZString[(usz)loc_key::COUNT] localization_table;
    bool log_enabled;
    ImGuiLogFlags log_flags;
    ImGuiWindow* log_window;
    ImFileHandle log_file;
    ImGuiTextBuffer log_buffer;
    ZString log_next_prefix;
    ZString log_next_suffix;
    float log_line_pos_y;
    bool log_line_first_item;
    CInt log_depth_ref;
    CInt log_depth_to_expand;
    CInt log_depth_to_expand_default;
    ImGuiErrorCallback error_callback;
    void* error_callback_user_data;
    ImVec2 error_tooltip_locked_pos;
    bool error_first;
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
    bool debug_break_in_locate_id;
    ImGuiKeyChord debug_break_key_chord;
    ImS8 debug_begin_return_value_cull_depth;
    bool debug_item_picker_active;
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
    bool want_full_rebuild;
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
    bool is_visible;
    bool is_focused;
    bool is_bg_drawn_this_frame;
    bool has_close_button;
    bool has_window_menu_button;
    bool has_central_node_child;
    bool want_close_all;
    bool want_lock_size_once;
    bool want_mouse_move;
    bool want_hidden_tab_bar_update;
    bool want_hidden_tab_bar_toggle;
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
    bool backup_active_id_previous_frame_is_alive;
    bool backup_hovered_id_is_alive;
    bool backup_is_same_line;
    bool emit_item;
}
struct ImGuiIDStackTool
{
    CInt last_active_frame;
    CInt stack_level;
    ImGuiID query_id;
    ImVector results;
    bool copy_to_clipboard_on_ctrl_c;
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
    bool font_allow_user_scaling;
    ImFont* font_default;
    ImVec2 display_framebuffer_scale;
    bool config_nav_swap_gamepad_buttons;
    bool config_nav_move_set_mouse_pos;
    bool config_nav_capture_keyboard;
    bool config_nav_escape_clear_focus_item;
    bool config_nav_escape_clear_focus_window;
    bool config_nav_cursor_visible_auto;
    bool config_nav_cursor_visible_always;
    bool config_docking_no_split;
    bool config_docking_with_shift;
    bool config_docking_always_tab_bar;
    bool config_docking_transparent_payload;
    bool config_viewports_no_auto_merge;
    bool config_viewports_no_task_bar_icon;
    bool config_viewports_no_decoration;
    bool config_viewports_no_default_parent;
    bool mouse_draw_cursor;
    bool config_mac_osxbehaviors;
    bool config_input_trickle_event_queue;
    bool config_input_text_cursor_blink;
    bool config_input_text_enter_keep_active;
    bool config_drag_click_to_input_text;
    bool config_windows_resize_from_edges;
    bool config_windows_move_from_title_bar_only;
    bool config_windows_copy_contents_with_ctrl_c;
    bool config_scrollbar_scroll_by_page;
    float config_memory_compact_timer;
    float mouse_double_click_time;
    float mouse_double_click_max_dist;
    float mouse_drag_threshold;
    float key_repeat_delay;
    float key_repeat_rate;
    bool config_error_recovery;
    bool config_error_recovery_enable_assert;
    bool config_error_recovery_enable_debug_log;
    bool config_error_recovery_enable_tooltip;
    bool config_debug_is_debugger_present;
    bool config_debug_highlight_id_conflicts;
    bool config_debug_begin_return_value_once;
    bool config_debug_begin_return_value_loop;
    bool config_debug_ignore_focus_loss;
    bool config_debug_ini_settings;
    ZString backend_platform_name;
    ZString backend_renderer_name;
    void* backend_platform_user_data;
    void* backend_renderer_user_data;
    void* backend_language_user_data;
    bool want_capture_mouse;
    bool want_capture_keyboard;
    bool want_text_input;
    bool want_set_mouse_pos;
    bool want_save_ini_settings;
    bool nav_active;
    bool nav_visible;
    float framerate;
    CInt metrics_render_vertices;
    CInt metrics_render_indices;
    CInt metrics_render_windows;
    CInt metrics_active_windows;
    ImVec2 mouse_delta;
    ImGuiContext* ctx;
    ImVec2 mouse_pos;
    bool[5] mouse_down;
    float mouse_wheel;
    float mouse_wheel_h;
    ImGuiMouseSource mouse_source;
    ImGuiID mouse_hovered_viewport;
    bool key_ctrl;
    bool key_shift;
    bool key_alt;
    bool key_super;
    ImGuiKeyChord key_mods;
    ImGuiKeyData[(usz)key::NAMED_KEY_COUNT] keys_data;
    bool want_capture_mouse_unless_popup_close;
    ImVec2 mouse_pos_prev;
    ImVec2[5] mouse_clicked_pos;
    double[5] mouse_clicked_time;
    bool[5] mouse_clicked;
    bool[5] mouse_double_clicked;
    ImU16[5] mouse_clicked_count;
    ImU16[5] mouse_clicked_last_count;
    bool[5] mouse_released;
    bool[5] mouse_down_owned;
    bool[5] mouse_down_owned_unless_popup_close;
    bool mouse_wheel_request_axis_swap;
    bool mouse_ctrl_left_as_right_click;
    float[5] mouse_down_duration;
    float[5] mouse_down_duration_prev;
    ImVec2[5] mouse_drag_max_distance_abs;
    float[5] mouse_drag_max_distance_sqr;
    float pen_pressure;
    bool app_focus_lost;
    bool app_accepting_events;
    ImWchar16 input_queue_surrogate;
    ImVector input_queue_characters;
}
struct ImGuiInputEvent
{
    ImGuiInputEventType type;
    ImGuiInputSource source;
    ImU32 event_id;
    union { ImGuiInputEventMousePos mouse_pos; ImGuiInputEventMouseWheel mouse_wheel; ImGuiInputEventMouseButton mouse_button; ImGuiInputEventMouseViewport mouse_viewport; ImGuiInputEventKey key; ImGuiInputEventText text; ImGuiInputEventAppFocused app_focused; }
    bool added_by_test_engine;
}
struct ImGuiInputEventAppFocused
{
    bool focused;
}
struct ImGuiInputEventKey
{
    ImGuiKey key;
    bool down;
    float analog_value;
}
struct ImGuiInputEventMouseButton
{
    CInt button;
    bool down;
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
    bool buf_dirty;
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
    bool cursor_follow;
    bool selected_all_mouse_lock;
    bool edited;
    ImGuiInputTextFlags flags;
    bool reload_user_buf;
    CInt reload_selection_start;
    CInt reload_selection_end;
}
struct ImGuiKeyData
{
    bool down;
    float down_duration;
    float down_duration_prev;
    float analog_value;
}
struct ImGuiKeyOwnerData
{
    ImGuiID owner_curr;
    ImGuiID owner_next;
    bool lock_this_frame;
    bool lock_until_release;
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
    bool pos_to_index_convert;
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
    bool show_debug_log;
    bool show_idstack_tool;
    bool show_windows_rects;
    bool show_windows_begin_order;
    bool show_tables_rects;
    bool show_draw_cmd_mesh;
    bool show_draw_cmd_bounding_boxes;
    bool show_text_encoding_viewer;
    bool show_atlas_tinted_with_text_color;
    bool show_docking_nodes;
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
    bool nav_id_selected;
    bool range_src_reset;
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
    bool is_end_io;
    bool is_focused;
    bool is_keyboard_set_range;
    bool nav_id_passed_by;
    bool range_src_passed_by;
    bool range_dst_passed_by;
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
    bool open_val;
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
    bool pos_undock;
    bool collapsed_val;
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
    bool is_first_frame;
    bool is_being_resized;
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
    bool preview;
    bool delivery;
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
    bool want_visible;
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
    bool preserve_order;
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
    bool selected;
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
    bool query_success;
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
    bool anti_aliased_lines;
    bool anti_aliased_lines_use_tex;
    bool anti_aliased_fill;
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
    bool want_layout;
    bool visible_tab_was_submitted;
    bool tabs_added_new;
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
    bool want_close;
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
    bool is_layout_locked;
    bool is_inside_row;
    bool is_initializing;
    bool is_sort_specs_dirty;
    bool is_using_headers;
    bool is_context_popup_open;
    bool disable_default_context_menu;
    bool is_settings_request_load;
    bool is_settings_dirty;
    bool is_default_display_order;
    bool is_reset_all_request;
    bool is_reset_display_order_request;
    bool is_unfrozen_rows;
    bool is_default_sizing_policy;
    bool is_active_id_alive_before_table;
    bool is_active_id_in_table;
    bool has_scrollbar_ycurr;
    bool has_scrollbar_yprev;
    bool memory_compacted;
    bool host_skip_items;
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
    bool is_enabled;
    bool is_user_enabled;
    bool is_user_enabled_next_frame;
    bool is_visible_x;
    bool is_visible_y;
    bool is_request_output;
    bool is_skip_items;
    bool is_preserve_width_auto;
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
    bool want_apply;
}
struct ImGuiTableSortSpecs
{
    ImGuiTableColumnSortSpecs* specs;
    CInt specs_count;
    bool specs_dirty;
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
    bool select_request;
    bool single_char_mode;
    ImS8 single_char_size;
}
struct ImGuiTypingSelectState
{
    ImGuiTypingSelectRequest request;
    char[64] search_buffer;
    ImGuiID focus_scope;
    CInt last_request_frame;
    float last_request_time;
    bool single_char_mode_lock;
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
    bool platform_window_created;
    bool platform_request_move;
    bool platform_request_resize;
    bool platform_request_close;
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
    bool last_focused_had_nav_window;
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
    bool scrollbar_x;
    bool scrollbar_y;
    bool viewport_owned;
    bool active;
    bool was_active;
    bool write_accessed;
    bool collapsed;
    bool want_collapse_toggle;
    bool skip_items;
    bool skip_refresh;
    bool appearing;
    bool hidden;
    bool is_fallback_window;
    bool is_explicit_child;
    bool has_close_button;
    ichar resize_border_hovered;
    ichar resize_border_held;
    CShort begin_count;
    CShort begin_count_previous_frame;
    CShort begin_order_within_parent;
    CShort begin_order_within_context;
    CShort focus_order;
    ImS8 auto_fit_frames_x;
    ImS8 auto_fit_frames_y;
    bool auto_fit_only_grows;
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
    bool memory_compacted;
    bool dock_is_active;
    bool dock_node_is_visible;
    bool dock_tab_is_visible;
    bool dock_tab_want_close;
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
    bool docking_always_tab_bar;
    bool docking_allow_unclassed;
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
    bool collapsed;
    bool is_child;
    bool want_apply;
    bool want_delete;
}
struct ImGuiWindowStackData
{
    ImGuiWindow* window;
    ImGuiLastItemData parent_last_item_data_backup;
    ImGuiErrorRecoveryState stack_sizes_in_begin;
    bool disabled_override_reenable;
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
    bool is_same_line;
    bool is_set_pos;
    ImVec1 indent;
    ImVec1 columns_offset;
    ImVec1 group_offset;
    ImVec2 cursor_start_pos_lossyness;
    ImGuiNavLayer nav_layer_current;
    CShort nav_layers_active_mask;
    CShort nav_layers_active_mask_next;
    bool nav_is_scroll_pushable_x;
    bool nav_hide_highlight_one_frame;
    bool nav_window_has_scroll_y;
    bool menu_bar_appending;
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
struct ImVec1
{
    float x;
}
struct ImVec2
{
    float x;
    float y;
}
struct ImVec2ih
{
    CShort x;
    CShort y;
}
struct ImVec4
{
    float x;
    float y;
    float z;
    float w;
}
// Skipping templated: ImBitArray_ClearAllBits
// Skipping templated: ImBitArray_ClearBit
// Skipping templated: ImBitArray_ImBitArray
// Skipping templated: ImBitArray_SetAllBits
// Skipping templated: ImBitArray_SetBit
// Skipping templated: ImBitArray_SetBitRange
// Skipping templated: ImBitArray_TestBit
// Skipping templated: ImBitArray_destroy
extern fn void ImBitVector.clear(ImBitVector* self) @extern("ImBitVector_Clear");
extern fn void ImBitVector.clear_bit(ImBitVector* self, CInt n) @extern("ImBitVector_ClearBit");
extern fn void ImBitVector.create(ImBitVector* self, CInt sz) @extern("ImBitVector_Create");
extern fn void ImBitVector.set_bit(ImBitVector* self, CInt n) @extern("ImBitVector_SetBit");
extern fn bool ImBitVector.test_bit(ImBitVector* self, CInt n) @extern("ImBitVector_TestBit");
// Skipping templated: ImChunkStream_alloc_chunk
// Skipping templated: ImChunkStream_begin
// Skipping templated: ImChunkStream_chunk_size
// Skipping templated: ImChunkStream_clear
// Skipping templated: ImChunkStream_empty
// Skipping templated: ImChunkStream_end
// Skipping templated: ImChunkStream_next_chunk
// Skipping templated: ImChunkStream_offset_from_ptr
// Skipping templated: ImChunkStream_ptr_from_offset
// Skipping templated: ImChunkStream_size
// Skipping templated: ImChunkStream_swap
extern fn void im_color_hsv(ImColor* p_out, float h, float s, float v, float a = 1.0f) @extern("ImColor_HSV");
extern fn ImColor* im_color_im_color_nil() @extern("ImColor_ImColor_Nil");
extern fn ImColor* im_color_im_color_float(float r, float g, float b, float a = 1.0f) @extern("ImColor_ImColor_Float");
extern fn ImColor* im_color_im_color_vec4(ImVec4 col) @extern("ImColor_ImColor_Vec4");
extern fn ImColor* im_color_im_color_int(CInt r, CInt g, CInt b, CInt a = 255) @extern("ImColor_ImColor_Int");
extern fn ImColor* im_color_im_color_u32(ImU32 rgba) @extern("ImColor_ImColor_U32");
extern fn void ImColor.set_hsv(ImColor* self, float h, float s, float v, float a = 1.0f) @extern("ImColor_SetHSV");
extern fn void ImColor.destroy(ImColor* self) @extern("ImColor_destroy");
extern fn ImTextureID ImDrawCmd.get_tex_id(ImDrawCmd* self) @extern("ImDrawCmd_GetTexID");
extern fn ImDrawCmd* im_draw_cmd_im_draw_cmd() @extern("ImDrawCmd_ImDrawCmd");
extern fn void ImDrawCmd.destroy(ImDrawCmd* self) @extern("ImDrawCmd_destroy");
extern fn ImDrawDataBuilder* im_draw_data_builder_im_draw_data_builder() @extern("ImDrawDataBuilder_ImDrawDataBuilder");
extern fn void ImDrawDataBuilder.destroy(ImDrawDataBuilder* self) @extern("ImDrawDataBuilder_destroy");
extern fn void ImDrawData.add_draw_list(ImDrawData* self, ImDrawList* draw_list) @extern("ImDrawData_AddDrawList");
extern fn void ImDrawData.clear(ImDrawData* self) @extern("ImDrawData_Clear");
extern fn void ImDrawData.de_index_all_buffers(ImDrawData* self) @extern("ImDrawData_DeIndexAllBuffers");
extern fn ImDrawData* im_draw_data_im_draw_data() @extern("ImDrawData_ImDrawData");
extern fn void ImDrawData.scale_clip_rects(ImDrawData* self, ImVec2 fb_scale) @extern("ImDrawData_ScaleClipRects");
extern fn void ImDrawData.destroy(ImDrawData* self) @extern("ImDrawData_destroy");
extern fn ImDrawListSharedData* im_draw_list_shared_data_im_draw_list_shared_data() @extern("ImDrawListSharedData_ImDrawListSharedData");
extern fn void ImDrawListSharedData.set_circle_tessellation_max_error(ImDrawListSharedData* self, float max_error) @extern("ImDrawListSharedData_SetCircleTessellationMaxError");
extern fn void ImDrawListSharedData.destroy(ImDrawListSharedData* self) @extern("ImDrawListSharedData_destroy");
extern fn void ImDrawListSplitter.clear(ImDrawListSplitter* self) @extern("ImDrawListSplitter_Clear");
extern fn void ImDrawListSplitter.clear_free_memory(ImDrawListSplitter* self) @extern("ImDrawListSplitter_ClearFreeMemory");
extern fn ImDrawListSplitter* im_draw_list_splitter_im_draw_list_splitter() @extern("ImDrawListSplitter_ImDrawListSplitter");
extern fn void ImDrawListSplitter.merge(ImDrawListSplitter* self, ImDrawList* draw_list) @extern("ImDrawListSplitter_Merge");
extern fn void ImDrawListSplitter.set_current_channel(ImDrawListSplitter* self, ImDrawList* draw_list, CInt channel_idx) @extern("ImDrawListSplitter_SetCurrentChannel");
extern fn void ImDrawListSplitter.split(ImDrawListSplitter* self, ImDrawList* draw_list, CInt count) @extern("ImDrawListSplitter_Split");
extern fn void ImDrawListSplitter.destroy(ImDrawListSplitter* self) @extern("ImDrawListSplitter_destroy");
extern fn void ImDrawList.add_bezier_cubic(ImDrawList* self, ImVec2 p1, ImVec2 p2, ImVec2 p3, ImVec2 p4, ImU32 col, float thickness, CInt num_segments = 0) @extern("ImDrawList_AddBezierCubic");
extern fn void ImDrawList.add_bezier_quadratic(ImDrawList* self, ImVec2 p1, ImVec2 p2, ImVec2 p3, ImU32 col, float thickness, CInt num_segments = 0) @extern("ImDrawList_AddBezierQuadratic");
extern fn void ImDrawList.add_callback(ImDrawList* self, ImDrawCallback callback, void* userdata, usz userdata_size = 0) @extern("ImDrawList_AddCallback");
extern fn void ImDrawList.add_circle(ImDrawList* self, ImVec2 center, float radius, ImU32 col, CInt num_segments = 0, float thickness = 1.0f) @extern("ImDrawList_AddCircle");
extern fn void ImDrawList.add_circle_filled(ImDrawList* self, ImVec2 center, float radius, ImU32 col, CInt num_segments = 0) @extern("ImDrawList_AddCircleFilled");
extern fn void ImDrawList.add_concave_poly_filled(ImDrawList* self, ImVec2* points, CInt num_points, ImU32 col) @extern("ImDrawList_AddConcavePolyFilled");
extern fn void ImDrawList.add_convex_poly_filled(ImDrawList* self, ImVec2* points, CInt num_points, ImU32 col) @extern("ImDrawList_AddConvexPolyFilled");
extern fn void ImDrawList.add_draw_cmd(ImDrawList* self) @extern("ImDrawList_AddDrawCmd");
extern fn void ImDrawList.add_ellipse(ImDrawList* self, ImVec2 center, ImVec2 radius, ImU32 col, float rot = 0.0f, CInt num_segments = 0, float thickness = 1.0f) @extern("ImDrawList_AddEllipse");
extern fn void ImDrawList.add_ellipse_filled(ImDrawList* self, ImVec2 center, ImVec2 radius, ImU32 col, float rot = 0.0f, CInt num_segments = 0) @extern("ImDrawList_AddEllipseFilled");
extern fn void ImDrawList.add_image(ImDrawList* self, ImTextureID user_texture_id, ImVec2 p_min, ImVec2 p_max, ImVec2 uv_min = {}, ImVec2 uv_max = {1, 1}, ImU32 col = 4294967295) @extern("ImDrawList_AddImage");
extern fn void ImDrawList.add_image_quad(ImDrawList* self, ImTextureID user_texture_id, ImVec2 p1, ImVec2 p2, ImVec2 p3, ImVec2 p4, ImVec2 uv1 = {}, ImVec2 uv2 = {1, 0}, ImVec2 uv3 = {1, 1}, ImVec2 uv4 = {1, 1}, ImU32 col = 4294967295) @extern("ImDrawList_AddImageQuad");
extern fn void ImDrawList.add_image_rounded(ImDrawList* self, ImTextureID user_texture_id, ImVec2 p_min, ImVec2 p_max, ImVec2 uv_min, ImVec2 uv_max, ImU32 col, float rounding, ImDrawFlags flags = 0) @extern("ImDrawList_AddImageRounded");
extern fn void ImDrawList.add_line(ImDrawList* self, ImVec2 p1, ImVec2 p2, ImU32 col, float thickness = 1.0f) @extern("ImDrawList_AddLine");
extern fn void ImDrawList.add_ngon(ImDrawList* self, ImVec2 center, float radius, ImU32 col, CInt num_segments, float thickness = 1.0f) @extern("ImDrawList_AddNgon");
extern fn void ImDrawList.add_ngon_filled(ImDrawList* self, ImVec2 center, float radius, ImU32 col, CInt num_segments) @extern("ImDrawList_AddNgonFilled");
extern fn void ImDrawList.add_polyline(ImDrawList* self, ImVec2* points, CInt num_points, ImU32 col, ImDrawFlags flags, float thickness) @extern("ImDrawList_AddPolyline");
extern fn void ImDrawList.add_quad(ImDrawList* self, ImVec2 p1, ImVec2 p2, ImVec2 p3, ImVec2 p4, ImU32 col, float thickness = 1.0f) @extern("ImDrawList_AddQuad");
extern fn void ImDrawList.add_quad_filled(ImDrawList* self, ImVec2 p1, ImVec2 p2, ImVec2 p3, ImVec2 p4, ImU32 col) @extern("ImDrawList_AddQuadFilled");
extern fn void ImDrawList.add_rect(ImDrawList* self, ImVec2 p_min, ImVec2 p_max, ImU32 col, float rounding = 0.0f, ImDrawFlags flags = 0, float thickness = 1.0f) @extern("ImDrawList_AddRect");
extern fn void ImDrawList.add_rect_filled(ImDrawList* self, ImVec2 p_min, ImVec2 p_max, ImU32 col, float rounding = 0.0f, ImDrawFlags flags = 0) @extern("ImDrawList_AddRectFilled");
extern fn void ImDrawList.add_rect_filled_multi_color(ImDrawList* self, ImVec2 p_min, ImVec2 p_max, ImU32 col_upr_left, ImU32 col_upr_right, ImU32 col_bot_right, ImU32 col_bot_left) @extern("ImDrawList_AddRectFilledMultiColor");
extern fn void ImDrawList.add_text_vec2(ImDrawList* self, ImVec2 pos, ImU32 col, ZString text_begin, ZString text_end = null) @extern("ImDrawList_AddText_Vec2");
extern fn void ImDrawList.add_text_font_ptr(ImDrawList* self, ImFont* font, float font_size, ImVec2 pos, ImU32 col, ZString text_begin, ZString text_end = null, float wrap_width = 0.0f, ImVec4* cpu_fine_clip_rect = null) @extern("ImDrawList_AddText_FontPtr");
extern fn void ImDrawList.add_triangle(ImDrawList* self, ImVec2 p1, ImVec2 p2, ImVec2 p3, ImU32 col, float thickness = 1.0f) @extern("ImDrawList_AddTriangle");
extern fn void ImDrawList.add_triangle_filled(ImDrawList* self, ImVec2 p1, ImVec2 p2, ImVec2 p3, ImU32 col) @extern("ImDrawList_AddTriangleFilled");
extern fn void ImDrawList.channels_merge(ImDrawList* self) @extern("ImDrawList_ChannelsMerge");
extern fn void ImDrawList.channels_set_current(ImDrawList* self, CInt n) @extern("ImDrawList_ChannelsSetCurrent");
extern fn void ImDrawList.channels_split(ImDrawList* self, CInt count) @extern("ImDrawList_ChannelsSplit");
extern fn ImDrawList* ImDrawList.clone_output(ImDrawList* self) @extern("ImDrawList_CloneOutput");
extern fn void im_draw_list_get_clip_rect_max(ImVec2* p_out, ImDrawList* self) @extern("ImDrawList_GetClipRectMax");
extern fn void im_draw_list_get_clip_rect_min(ImVec2* p_out, ImDrawList* self) @extern("ImDrawList_GetClipRectMin");
extern fn ImDrawList* im_draw_list_im_draw_list(ImDrawListSharedData* shared_data) @extern("ImDrawList_ImDrawList");
extern fn void ImDrawList.path_arc_to(ImDrawList* self, ImVec2 center, float radius, float a_min, float a_max, CInt num_segments = 0) @extern("ImDrawList_PathArcTo");
extern fn void ImDrawList.path_arc_to_fast(ImDrawList* self, ImVec2 center, float radius, CInt a_min_of_12, CInt a_max_of_12) @extern("ImDrawList_PathArcToFast");
extern fn void ImDrawList.path_bezier_cubic_curve_to(ImDrawList* self, ImVec2 p2, ImVec2 p3, ImVec2 p4, CInt num_segments = 0) @extern("ImDrawList_PathBezierCubicCurveTo");
extern fn void ImDrawList.path_bezier_quadratic_curve_to(ImDrawList* self, ImVec2 p2, ImVec2 p3, CInt num_segments = 0) @extern("ImDrawList_PathBezierQuadraticCurveTo");
extern fn void ImDrawList.path_clear(ImDrawList* self) @extern("ImDrawList_PathClear");
extern fn void ImDrawList.path_elliptical_arc_to(ImDrawList* self, ImVec2 center, ImVec2 radius, float rot, float a_min, float a_max, CInt num_segments = 0) @extern("ImDrawList_PathEllipticalArcTo");
extern fn void ImDrawList.path_fill_concave(ImDrawList* self, ImU32 col) @extern("ImDrawList_PathFillConcave");
extern fn void ImDrawList.path_fill_convex(ImDrawList* self, ImU32 col) @extern("ImDrawList_PathFillConvex");
extern fn void ImDrawList.path_line_to(ImDrawList* self, ImVec2 pos) @extern("ImDrawList_PathLineTo");
extern fn void ImDrawList.path_line_to_merge_duplicate(ImDrawList* self, ImVec2 pos) @extern("ImDrawList_PathLineToMergeDuplicate");
extern fn void ImDrawList.path_rect(ImDrawList* self, ImVec2 rect_min, ImVec2 rect_max, float rounding = 0.0f, ImDrawFlags flags = 0) @extern("ImDrawList_PathRect");
extern fn void ImDrawList.path_stroke(ImDrawList* self, ImU32 col, ImDrawFlags flags = 0, float thickness = 1.0f) @extern("ImDrawList_PathStroke");
extern fn void ImDrawList.pop_clip_rect(ImDrawList* self) @extern("ImDrawList_PopClipRect");
extern fn void ImDrawList.pop_texture_id(ImDrawList* self) @extern("ImDrawList_PopTextureID");
extern fn void ImDrawList.prim_quad_uv(ImDrawList* self, ImVec2 a, ImVec2 b, ImVec2 c, ImVec2 d, ImVec2 uv_a, ImVec2 uv_b, ImVec2 uv_c, ImVec2 uv_d, ImU32 col) @extern("ImDrawList_PrimQuadUV");
extern fn void ImDrawList.prim_rect(ImDrawList* self, ImVec2 a, ImVec2 b, ImU32 col) @extern("ImDrawList_PrimRect");
extern fn void ImDrawList.prim_rect_uv(ImDrawList* self, ImVec2 a, ImVec2 b, ImVec2 uv_a, ImVec2 uv_b, ImU32 col) @extern("ImDrawList_PrimRectUV");
extern fn void ImDrawList.prim_reserve(ImDrawList* self, CInt idx_count, CInt vtx_count) @extern("ImDrawList_PrimReserve");
extern fn void ImDrawList.prim_unreserve(ImDrawList* self, CInt idx_count, CInt vtx_count) @extern("ImDrawList_PrimUnreserve");
extern fn void ImDrawList.prim_vtx(ImDrawList* self, ImVec2 pos, ImVec2 uv, ImU32 col) @extern("ImDrawList_PrimVtx");
extern fn void ImDrawList.prim_write_idx(ImDrawList* self, ImDrawIdx idx) @extern("ImDrawList_PrimWriteIdx");
extern fn void ImDrawList.prim_write_vtx(ImDrawList* self, ImVec2 pos, ImVec2 uv, ImU32 col) @extern("ImDrawList_PrimWriteVtx");
extern fn void ImDrawList.push_clip_rect(ImDrawList* self, ImVec2 clip_rect_min, ImVec2 clip_rect_max, bool intersect_with_current_clip_rect = false) @extern("ImDrawList_PushClipRect");
extern fn void ImDrawList.push_clip_rect_full_screen(ImDrawList* self) @extern("ImDrawList_PushClipRectFullScreen");
extern fn void ImDrawList.push_texture_id(ImDrawList* self, ImTextureID texture_id) @extern("ImDrawList_PushTextureID");
extern fn CInt ImDrawList.calc_circle_auto_segment_count(ImDrawList* self, float radius) @extern("ImDrawList__CalcCircleAutoSegmentCount");
extern fn void ImDrawList.clear_free_memory(ImDrawList* self) @extern("ImDrawList__ClearFreeMemory");
extern fn void ImDrawList.on_changed_clip_rect(ImDrawList* self) @extern("ImDrawList__OnChangedClipRect");
extern fn void ImDrawList.on_changed_texture_id(ImDrawList* self) @extern("ImDrawList__OnChangedTextureID");
extern fn void ImDrawList.on_changed_vtx_offset(ImDrawList* self) @extern("ImDrawList__OnChangedVtxOffset");
extern fn void ImDrawList.path_arc_to_fast_ex(ImDrawList* self, ImVec2 center, float radius, CInt a_min_sample, CInt a_max_sample, CInt a_step) @extern("ImDrawList__PathArcToFastEx");
extern fn void ImDrawList.path_arc_to_n(ImDrawList* self, ImVec2 center, float radius, float a_min, float a_max, CInt num_segments) @extern("ImDrawList__PathArcToN");
extern fn void ImDrawList.pop_unused_draw_cmd(ImDrawList* self) @extern("ImDrawList__PopUnusedDrawCmd");
extern fn void ImDrawList.reset_for_new_frame(ImDrawList* self) @extern("ImDrawList__ResetForNewFrame");
extern fn void ImDrawList.set_texture_id(ImDrawList* self, ImTextureID texture_id) @extern("ImDrawList__SetTextureID");
extern fn void ImDrawList.try_merge_draw_cmds(ImDrawList* self) @extern("ImDrawList__TryMergeDrawCmds");
extern fn void ImDrawList.destroy(ImDrawList* self) @extern("ImDrawList_destroy");
extern fn ImFontAtlasCustomRect* im_font_atlas_custom_rect_im_font_atlas_custom_rect() @extern("ImFontAtlasCustomRect_ImFontAtlasCustomRect");
extern fn bool ImFontAtlasCustomRect.is_packed(ImFontAtlasCustomRect* self) @extern("ImFontAtlasCustomRect_IsPacked");
extern fn void ImFontAtlasCustomRect.destroy(ImFontAtlasCustomRect* self) @extern("ImFontAtlasCustomRect_destroy");
extern fn CInt ImFontAtlas.add_custom_rect_font_glyph(ImFontAtlas* self, ImFont* font, ImWchar id, CInt width, CInt height, float advance_x, ImVec2 offset = {}) @extern("ImFontAtlas_AddCustomRectFontGlyph");
extern fn CInt ImFontAtlas.add_custom_rect_regular(ImFontAtlas* self, CInt width, CInt height) @extern("ImFontAtlas_AddCustomRectRegular");
extern fn ImFont* ImFontAtlas.add_font(ImFontAtlas* self, ImFontConfig* font_cfg) @extern("ImFontAtlas_AddFont");
extern fn ImFont* ImFontAtlas.add_font_default(ImFontAtlas* self, ImFontConfig* font_cfg = null) @extern("ImFontAtlas_AddFontDefault");
extern fn ImFont* ImFontAtlas.add_font_from_file_ttf(ImFontAtlas* self, ZString filename, float size_pixels, ImFontConfig* font_cfg = null, ImWchar* glyph_ranges = null) @extern("ImFontAtlas_AddFontFromFileTTF");
extern fn ImFont* ImFontAtlas.add_font_from_memory_compressed_base85_ttf(ImFontAtlas* self, ZString compressed_font_data_base85, float size_pixels, ImFontConfig* font_cfg = null, ImWchar* glyph_ranges = null) @extern("ImFontAtlas_AddFontFromMemoryCompressedBase85TTF");
extern fn ImFont* ImFontAtlas.add_font_from_memory_compressed_ttf(ImFontAtlas* self, void* compressed_font_data, CInt compressed_font_data_size, float size_pixels, ImFontConfig* font_cfg = null, ImWchar* glyph_ranges = null) @extern("ImFontAtlas_AddFontFromMemoryCompressedTTF");
extern fn ImFont* ImFontAtlas.add_font_from_memory_ttf(ImFontAtlas* self, void* font_data, CInt font_data_size, float size_pixels, ImFontConfig* font_cfg = null, ImWchar* glyph_ranges = null) @extern("ImFontAtlas_AddFontFromMemoryTTF");
extern fn bool ImFontAtlas.build(ImFontAtlas* self) @extern("ImFontAtlas_Build");
extern fn void ImFontAtlas.calc_custom_rect_uv(ImFontAtlas* self, ImFontAtlasCustomRect* rect, ImVec2* out_uv_min, ImVec2* out_uv_max) @extern("ImFontAtlas_CalcCustomRectUV");
extern fn void ImFontAtlas.clear(ImFontAtlas* self) @extern("ImFontAtlas_Clear");
extern fn void ImFontAtlas.clear_fonts(ImFontAtlas* self) @extern("ImFontAtlas_ClearFonts");
extern fn void ImFontAtlas.clear_input_data(ImFontAtlas* self) @extern("ImFontAtlas_ClearInputData");
extern fn void ImFontAtlas.clear_tex_data(ImFontAtlas* self) @extern("ImFontAtlas_ClearTexData");
extern fn ImFontAtlasCustomRect* ImFontAtlas.get_custom_rect_by_index(ImFontAtlas* self, CInt index) @extern("ImFontAtlas_GetCustomRectByIndex");
extern fn ImWchar* ImFontAtlas.get_glyph_ranges_chinese_full(ImFontAtlas* self) @extern("ImFontAtlas_GetGlyphRangesChineseFull");
extern fn ImWchar* ImFontAtlas.get_glyph_ranges_chinese_simplified_common(ImFontAtlas* self) @extern("ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon");
extern fn ImWchar* ImFontAtlas.get_glyph_ranges_cyrillic(ImFontAtlas* self) @extern("ImFontAtlas_GetGlyphRangesCyrillic");
extern fn ImWchar* ImFontAtlas.get_glyph_ranges_default(ImFontAtlas* self) @extern("ImFontAtlas_GetGlyphRangesDefault");
extern fn ImWchar* ImFontAtlas.get_glyph_ranges_greek(ImFontAtlas* self) @extern("ImFontAtlas_GetGlyphRangesGreek");
extern fn ImWchar* ImFontAtlas.get_glyph_ranges_japanese(ImFontAtlas* self) @extern("ImFontAtlas_GetGlyphRangesJapanese");
extern fn ImWchar* ImFontAtlas.get_glyph_ranges_korean(ImFontAtlas* self) @extern("ImFontAtlas_GetGlyphRangesKorean");
extern fn ImWchar* ImFontAtlas.get_glyph_ranges_thai(ImFontAtlas* self) @extern("ImFontAtlas_GetGlyphRangesThai");
extern fn ImWchar* ImFontAtlas.get_glyph_ranges_vietnamese(ImFontAtlas* self) @extern("ImFontAtlas_GetGlyphRangesVietnamese");
extern fn bool ImFontAtlas.get_mouse_cursor_tex_data(ImFontAtlas* self, ImGuiMouseCursor cursor, ImVec2* out_offset, ImVec2* out_size, ImVec2[2] out_uv_border, ImVec2[2] out_uv_fill) @extern("ImFontAtlas_GetMouseCursorTexData");
extern fn void ImFontAtlas.get_tex_data_as_alpha8(ImFontAtlas* self, char** out_pixels, CInt* out_width, CInt* out_height, CInt* out_bytes_per_pixel = null) @extern("ImFontAtlas_GetTexDataAsAlpha8");
extern fn void ImFontAtlas.get_tex_data_as_rgba32(ImFontAtlas* self, char** out_pixels, CInt* out_width, CInt* out_height, CInt* out_bytes_per_pixel = null) @extern("ImFontAtlas_GetTexDataAsRGBA32");
extern fn ImFontAtlas* im_font_atlas_im_font_atlas() @extern("ImFontAtlas_ImFontAtlas");
extern fn bool ImFontAtlas.is_built(ImFontAtlas* self) @extern("ImFontAtlas_IsBuilt");
extern fn void ImFontAtlas.set_tex_id(ImFontAtlas* self, ImTextureID id) @extern("ImFontAtlas_SetTexID");
extern fn void ImFontAtlas.destroy(ImFontAtlas* self) @extern("ImFontAtlas_destroy");
extern fn ImFontConfig* im_font_config_im_font_config() @extern("ImFontConfig_ImFontConfig");
extern fn void ImFontConfig.destroy(ImFontConfig* self) @extern("ImFontConfig_destroy");
extern fn void ImFontGlyphRangesBuilder.add_char(ImFontGlyphRangesBuilder* self, ImWchar c) @extern("ImFontGlyphRangesBuilder_AddChar");
extern fn void ImFontGlyphRangesBuilder.add_ranges(ImFontGlyphRangesBuilder* self, ImWchar* ranges) @extern("ImFontGlyphRangesBuilder_AddRanges");
extern fn void ImFontGlyphRangesBuilder.add_text(ImFontGlyphRangesBuilder* self, ZString text, ZString text_end = null) @extern("ImFontGlyphRangesBuilder_AddText");
extern fn void ImFontGlyphRangesBuilder.build_ranges(ImFontGlyphRangesBuilder* self, ImVector out_ranges) @extern("ImFontGlyphRangesBuilder_BuildRanges");
extern fn void ImFontGlyphRangesBuilder.clear(ImFontGlyphRangesBuilder* self) @extern("ImFontGlyphRangesBuilder_Clear");
extern fn bool ImFontGlyphRangesBuilder.get_bit(ImFontGlyphRangesBuilder* self, usz n) @extern("ImFontGlyphRangesBuilder_GetBit");
extern fn ImFontGlyphRangesBuilder* im_font_glyph_ranges_builder_im_font_glyph_ranges_builder() @extern("ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder");
extern fn void ImFontGlyphRangesBuilder.set_bit(ImFontGlyphRangesBuilder* self, usz n) @extern("ImFontGlyphRangesBuilder_SetBit");
extern fn void ImFontGlyphRangesBuilder.destroy(ImFontGlyphRangesBuilder* self) @extern("ImFontGlyphRangesBuilder_destroy");
extern fn void ImFont.add_glyph(ImFont* self, ImFontConfig* src_cfg, ImWchar c, float x0, float y0, float x1, float y1, float u0, float v0, float u1, float v1, float advance_x) @extern("ImFont_AddGlyph");
extern fn void ImFont.add_remap_char(ImFont* self, ImWchar dst, ImWchar src, bool overwrite_dst = true) @extern("ImFont_AddRemapChar");
extern fn void ImFont.build_lookup_table(ImFont* self) @extern("ImFont_BuildLookupTable");
extern fn void im_font_calc_text_size_a(ImVec2* p_out, ImFont* self, float size, float max_width, float wrap_width, ZString text_begin, ZString text_end = null, char** remaining = null) @extern("ImFont_CalcTextSizeA");
extern fn ZString ImFont.calc_word_wrap_position_a(ImFont* self, float scale, ZString text, ZString text_end, float wrap_width) @extern("ImFont_CalcWordWrapPositionA");
extern fn void ImFont.clear_output_data(ImFont* self) @extern("ImFont_ClearOutputData");
extern fn ImFontGlyph* ImFont.find_glyph(ImFont* self, ImWchar c) @extern("ImFont_FindGlyph");
extern fn ImFontGlyph* ImFont.find_glyph_no_fallback(ImFont* self, ImWchar c) @extern("ImFont_FindGlyphNoFallback");
extern fn float ImFont.get_char_advance(ImFont* self, ImWchar c) @extern("ImFont_GetCharAdvance");
extern fn ZString ImFont.get_debug_name(ImFont* self) @extern("ImFont_GetDebugName");
extern fn void ImFont.grow_index(ImFont* self, CInt new_size) @extern("ImFont_GrowIndex");
extern fn ImFont* im_font_im_font() @extern("ImFont_ImFont");
extern fn bool ImFont.is_glyph_range_unused(ImFont* self, CUInt c_begin, CUInt c_last) @extern("ImFont_IsGlyphRangeUnused");
extern fn bool ImFont.is_loaded(ImFont* self) @extern("ImFont_IsLoaded");
extern fn void ImFont.render_char(ImFont* self, ImDrawList* draw_list, float size, ImVec2 pos, ImU32 col, ImWchar c) @extern("ImFont_RenderChar");
extern fn void ImFont.render_text(ImFont* self, ImDrawList* draw_list, float size, ImVec2 pos, ImU32 col, ImVec4 clip_rect, ZString text_begin, ZString text_end, float wrap_width = 0.0f, bool cpu_fine_clip = false) @extern("ImFont_RenderText");
extern fn void ImFont.set_glyph_visible(ImFont* self, ImWchar c, bool visible) @extern("ImFont_SetGlyphVisible");
extern fn void ImFont.destroy(ImFont* self) @extern("ImFont_destroy");
extern fn ImGuiBoxSelectState* im_gui_box_select_state_im_gui_box_select_state() @extern("ImGuiBoxSelectState_ImGuiBoxSelectState");
extern fn void ImGuiBoxSelectState.destroy(ImGuiBoxSelectState* self) @extern("ImGuiBoxSelectState_destroy");
extern fn ImGuiComboPreviewData* im_gui_combo_preview_data_im_gui_combo_preview_data() @extern("ImGuiComboPreviewData_ImGuiComboPreviewData");
extern fn void ImGuiComboPreviewData.destroy(ImGuiComboPreviewData* self) @extern("ImGuiComboPreviewData_destroy");
extern fn ImGuiContextHook* im_gui_context_hook_im_gui_context_hook() @extern("ImGuiContextHook_ImGuiContextHook");
extern fn void ImGuiContextHook.destroy(ImGuiContextHook* self) @extern("ImGuiContextHook_destroy");
extern fn ImGuiContext* im_gui_context_im_gui_context(ImFontAtlas* shared_font_atlas) @extern("ImGuiContext_ImGuiContext");
extern fn void ImGuiContext.destroy(ImGuiContext* self) @extern("ImGuiContext_destroy");
extern fn void* ImGuiDataVarInfo.get_var_ptr(ImGuiDataVarInfo* self, void* parent) @extern("ImGuiDataVarInfo_GetVarPtr");
extern fn ImGuiDebugAllocInfo* im_gui_debug_alloc_info_im_gui_debug_alloc_info() @extern("ImGuiDebugAllocInfo_ImGuiDebugAllocInfo");
extern fn void ImGuiDebugAllocInfo.destroy(ImGuiDebugAllocInfo* self) @extern("ImGuiDebugAllocInfo_destroy");
extern fn ImGuiDockContext* im_gui_dock_context_im_gui_dock_context() @extern("ImGuiDockContext_ImGuiDockContext");
extern fn void ImGuiDockContext.destroy(ImGuiDockContext* self) @extern("ImGuiDockContext_destroy");
extern fn ImGuiDockNode* im_gui_dock_node_im_gui_dock_node(ImGuiID id) @extern("ImGuiDockNode_ImGuiDockNode");
extern fn bool ImGuiDockNode.is_central_node(ImGuiDockNode* self) @extern("ImGuiDockNode_IsCentralNode");
extern fn bool ImGuiDockNode.is_dock_space(ImGuiDockNode* self) @extern("ImGuiDockNode_IsDockSpace");
extern fn bool ImGuiDockNode.is_empty(ImGuiDockNode* self) @extern("ImGuiDockNode_IsEmpty");
extern fn bool ImGuiDockNode.is_floating_node(ImGuiDockNode* self) @extern("ImGuiDockNode_IsFloatingNode");
extern fn bool ImGuiDockNode.is_hidden_tab_bar(ImGuiDockNode* self) @extern("ImGuiDockNode_IsHiddenTabBar");
extern fn bool ImGuiDockNode.is_leaf_node(ImGuiDockNode* self) @extern("ImGuiDockNode_IsLeafNode");
extern fn bool ImGuiDockNode.is_no_tab_bar(ImGuiDockNode* self) @extern("ImGuiDockNode_IsNoTabBar");
extern fn bool ImGuiDockNode.is_root_node(ImGuiDockNode* self) @extern("ImGuiDockNode_IsRootNode");
extern fn bool ImGuiDockNode.is_split_node(ImGuiDockNode* self) @extern("ImGuiDockNode_IsSplitNode");
extern fn void im_gui_dock_node_rect(ImRect* p_out, ImGuiDockNode* self) @extern("ImGuiDockNode_Rect");
extern fn void ImGuiDockNode.set_local_flags(ImGuiDockNode* self, ImGuiDockNodeFlags flags) @extern("ImGuiDockNode_SetLocalFlags");
extern fn void ImGuiDockNode.update_merged_flags(ImGuiDockNode* self) @extern("ImGuiDockNode_UpdateMergedFlags");
extern fn void ImGuiDockNode.destroy(ImGuiDockNode* self) @extern("ImGuiDockNode_destroy");
extern fn ImGuiErrorRecoveryState* im_gui_error_recovery_state_im_gui_error_recovery_state() @extern("ImGuiErrorRecoveryState_ImGuiErrorRecoveryState");
extern fn void ImGuiErrorRecoveryState.destroy(ImGuiErrorRecoveryState* self) @extern("ImGuiErrorRecoveryState_destroy");
extern fn ImFontBuilderIO* im_gui_free_type_get_builder_for_free_type() @extern("ImGuiFreeType_GetBuilderForFreeType");
extern fn void im_gui_free_type_set_allocator_functions(ImGuiMemAllocFunc alloc_func, ImGuiMemFreeFunc free_func, void* user_data = null) @extern("ImGuiFreeType_SetAllocatorFunctions");
extern fn ImGuiIDStackTool* im_gui_idstack_tool_im_gui_idstack_tool() @extern("ImGuiIDStackTool_ImGuiIDStackTool");
extern fn void ImGuiIDStackTool.destroy(ImGuiIDStackTool* self) @extern("ImGuiIDStackTool_destroy");
extern fn void ImGuiIO.add_focus_event(ImGuiIO* self, bool focused) @extern("ImGuiIO_AddFocusEvent");
extern fn void ImGuiIO.add_input_character(ImGuiIO* self, CUInt c) @extern("ImGuiIO_AddInputCharacter");
extern fn void ImGuiIO.add_input_character_utf16(ImGuiIO* self, ImWchar16 c) @extern("ImGuiIO_AddInputCharacterUTF16");
extern fn void ImGuiIO.add_input_characters_utf8(ImGuiIO* self, ZString str) @extern("ImGuiIO_AddInputCharactersUTF8");
extern fn void ImGuiIO.add_key_analog_event(ImGuiIO* self, ImGuiKey key, bool down, float v) @extern("ImGuiIO_AddKeyAnalogEvent");
extern fn void ImGuiIO.add_key_event(ImGuiIO* self, ImGuiKey key, bool down) @extern("ImGuiIO_AddKeyEvent");
extern fn void ImGuiIO.add_mouse_button_event(ImGuiIO* self, CInt button, bool down) @extern("ImGuiIO_AddMouseButtonEvent");
extern fn void ImGuiIO.add_mouse_pos_event(ImGuiIO* self, float x, float y) @extern("ImGuiIO_AddMousePosEvent");
extern fn void ImGuiIO.add_mouse_source_event(ImGuiIO* self, ImGuiMouseSource source) @extern("ImGuiIO_AddMouseSourceEvent");
extern fn void ImGuiIO.add_mouse_viewport_event(ImGuiIO* self, ImGuiID id) @extern("ImGuiIO_AddMouseViewportEvent");
extern fn void ImGuiIO.add_mouse_wheel_event(ImGuiIO* self, float wheel_x, float wheel_y) @extern("ImGuiIO_AddMouseWheelEvent");
extern fn void ImGuiIO.clear_events_queue(ImGuiIO* self) @extern("ImGuiIO_ClearEventsQueue");
extern fn void ImGuiIO.clear_input_keys(ImGuiIO* self) @extern("ImGuiIO_ClearInputKeys");
extern fn void ImGuiIO.clear_input_mouse(ImGuiIO* self) @extern("ImGuiIO_ClearInputMouse");
extern fn ImGuiIO* im_gui_ioim_gui_io() @extern("ImGuiIO_ImGuiIO");
extern fn void ImGuiIO.set_app_accepting_events(ImGuiIO* self, bool accepting_events) @extern("ImGuiIO_SetAppAcceptingEvents");
extern fn void ImGuiIO.set_key_event_native_data(ImGuiIO* self, ImGuiKey key, CInt native_keycode, CInt native_scancode, CInt native_legacy_index = -1) @extern("ImGuiIO_SetKeyEventNativeData");
extern fn void ImGuiIO.destroy(ImGuiIO* self) @extern("ImGuiIO_destroy");
extern fn ImGuiInputEvent* im_gui_input_event_im_gui_input_event() @extern("ImGuiInputEvent_ImGuiInputEvent");
extern fn void ImGuiInputEvent.destroy(ImGuiInputEvent* self) @extern("ImGuiInputEvent_destroy");
extern fn void ImGuiInputTextCallbackData.clear_selection(ImGuiInputTextCallbackData* self) @extern("ImGuiInputTextCallbackData_ClearSelection");
extern fn void ImGuiInputTextCallbackData.delete_chars(ImGuiInputTextCallbackData* self, CInt pos, CInt bytes_count) @extern("ImGuiInputTextCallbackData_DeleteChars");
extern fn bool ImGuiInputTextCallbackData.has_selection(ImGuiInputTextCallbackData* self) @extern("ImGuiInputTextCallbackData_HasSelection");
extern fn ImGuiInputTextCallbackData* im_gui_input_text_callback_data_im_gui_input_text_callback_data() @extern("ImGuiInputTextCallbackData_ImGuiInputTextCallbackData");
extern fn void ImGuiInputTextCallbackData.insert_chars(ImGuiInputTextCallbackData* self, CInt pos, ZString text, ZString text_end = null) @extern("ImGuiInputTextCallbackData_InsertChars");
extern fn void ImGuiInputTextCallbackData.select_all(ImGuiInputTextCallbackData* self) @extern("ImGuiInputTextCallbackData_SelectAll");
extern fn void ImGuiInputTextCallbackData.destroy(ImGuiInputTextCallbackData* self) @extern("ImGuiInputTextCallbackData_destroy");
extern fn void ImGuiInputTextDeactivatedState.clear_free_memory(ImGuiInputTextDeactivatedState* self) @extern("ImGuiInputTextDeactivatedState_ClearFreeMemory");
extern fn ImGuiInputTextDeactivatedState* im_gui_input_text_deactivated_state_im_gui_input_text_deactivated_state() @extern("ImGuiInputTextDeactivatedState_ImGuiInputTextDeactivatedState");
extern fn void ImGuiInputTextDeactivatedState.destroy(ImGuiInputTextDeactivatedState* self) @extern("ImGuiInputTextDeactivatedState_destroy");
extern fn void ImGuiInputTextState.clear_free_memory(ImGuiInputTextState* self) @extern("ImGuiInputTextState_ClearFreeMemory");
extern fn void ImGuiInputTextState.clear_selection(ImGuiInputTextState* self) @extern("ImGuiInputTextState_ClearSelection");
extern fn void ImGuiInputTextState.clear_text(ImGuiInputTextState* self) @extern("ImGuiInputTextState_ClearText");
extern fn void ImGuiInputTextState.cursor_anim_reset(ImGuiInputTextState* self) @extern("ImGuiInputTextState_CursorAnimReset");
extern fn void ImGuiInputTextState.cursor_clamp(ImGuiInputTextState* self) @extern("ImGuiInputTextState_CursorClamp");
extern fn CInt ImGuiInputTextState.get_cursor_pos(ImGuiInputTextState* self) @extern("ImGuiInputTextState_GetCursorPos");
extern fn CInt ImGuiInputTextState.get_selection_end(ImGuiInputTextState* self) @extern("ImGuiInputTextState_GetSelectionEnd");
extern fn CInt ImGuiInputTextState.get_selection_start(ImGuiInputTextState* self) @extern("ImGuiInputTextState_GetSelectionStart");
extern fn bool ImGuiInputTextState.has_selection(ImGuiInputTextState* self) @extern("ImGuiInputTextState_HasSelection");
extern fn ImGuiInputTextState* im_gui_input_text_state_im_gui_input_text_state() @extern("ImGuiInputTextState_ImGuiInputTextState");
extern fn void ImGuiInputTextState.on_char_pressed(ImGuiInputTextState* self, CUInt c) @extern("ImGuiInputTextState_OnCharPressed");
extern fn void ImGuiInputTextState.on_key_pressed(ImGuiInputTextState* self, CInt key) @extern("ImGuiInputTextState_OnKeyPressed");
extern fn void ImGuiInputTextState.reload_user_buf_and_keep_selection(ImGuiInputTextState* self) @extern("ImGuiInputTextState_ReloadUserBufAndKeepSelection");
extern fn void ImGuiInputTextState.reload_user_buf_and_move_to_end(ImGuiInputTextState* self) @extern("ImGuiInputTextState_ReloadUserBufAndMoveToEnd");
extern fn void ImGuiInputTextState.reload_user_buf_and_select_all(ImGuiInputTextState* self) @extern("ImGuiInputTextState_ReloadUserBufAndSelectAll");
extern fn void ImGuiInputTextState.select_all(ImGuiInputTextState* self) @extern("ImGuiInputTextState_SelectAll");
extern fn void ImGuiInputTextState.destroy(ImGuiInputTextState* self) @extern("ImGuiInputTextState_destroy");
extern fn ImGuiKeyOwnerData* im_gui_key_owner_data_im_gui_key_owner_data() @extern("ImGuiKeyOwnerData_ImGuiKeyOwnerData");
extern fn void ImGuiKeyOwnerData.destroy(ImGuiKeyOwnerData* self) @extern("ImGuiKeyOwnerData_destroy");
extern fn ImGuiKeyRoutingData* im_gui_key_routing_data_im_gui_key_routing_data() @extern("ImGuiKeyRoutingData_ImGuiKeyRoutingData");
extern fn void ImGuiKeyRoutingData.destroy(ImGuiKeyRoutingData* self) @extern("ImGuiKeyRoutingData_destroy");
extern fn void ImGuiKeyRoutingTable.clear(ImGuiKeyRoutingTable* self) @extern("ImGuiKeyRoutingTable_Clear");
extern fn ImGuiKeyRoutingTable* im_gui_key_routing_table_im_gui_key_routing_table() @extern("ImGuiKeyRoutingTable_ImGuiKeyRoutingTable");
extern fn void ImGuiKeyRoutingTable.destroy(ImGuiKeyRoutingTable* self) @extern("ImGuiKeyRoutingTable_destroy");
extern fn ImGuiLastItemData* im_gui_last_item_data_im_gui_last_item_data() @extern("ImGuiLastItemData_ImGuiLastItemData");
extern fn void ImGuiLastItemData.destroy(ImGuiLastItemData* self) @extern("ImGuiLastItemData_destroy");
extern fn ImGuiListClipperData* im_gui_list_clipper_data_im_gui_list_clipper_data() @extern("ImGuiListClipperData_ImGuiListClipperData");
extern fn void ImGuiListClipperData.reset(ImGuiListClipperData* self, ImGuiListClipper* clipper) @extern("ImGuiListClipperData_Reset");
extern fn void ImGuiListClipperData.destroy(ImGuiListClipperData* self) @extern("ImGuiListClipperData_destroy");
extern fn ImGuiListClipperRange im_gui_list_clipper_range_from_indices(CInt min, CInt max) @extern("ImGuiListClipperRange_FromIndices");
extern fn ImGuiListClipperRange im_gui_list_clipper_range_from_positions(float y1, float y2, CInt off_min, CInt off_max) @extern("ImGuiListClipperRange_FromPositions");
extern fn void ImGuiListClipper.begin(ImGuiListClipper* self, CInt items_count, float items_height = -1.0f) @extern("ImGuiListClipper_Begin");
extern fn void ImGuiListClipper.end(ImGuiListClipper* self) @extern("ImGuiListClipper_End");
extern fn ImGuiListClipper* im_gui_list_clipper_im_gui_list_clipper() @extern("ImGuiListClipper_ImGuiListClipper");
extern fn void ImGuiListClipper.include_item_by_index(ImGuiListClipper* self, CInt item_index) @extern("ImGuiListClipper_IncludeItemByIndex");
extern fn void ImGuiListClipper.include_items_by_index(ImGuiListClipper* self, CInt item_begin, CInt item_end) @extern("ImGuiListClipper_IncludeItemsByIndex");
extern fn void ImGuiListClipper.seek_cursor_for_item(ImGuiListClipper* self, CInt item_index) @extern("ImGuiListClipper_SeekCursorForItem");
extern fn bool ImGuiListClipper.step(ImGuiListClipper* self) @extern("ImGuiListClipper_Step");
extern fn void ImGuiListClipper.destroy(ImGuiListClipper* self) @extern("ImGuiListClipper_destroy");
extern fn void ImGuiMenuColumns.calc_next_total_width(ImGuiMenuColumns* self, bool update_offsets) @extern("ImGuiMenuColumns_CalcNextTotalWidth");
extern fn float ImGuiMenuColumns.decl_columns(ImGuiMenuColumns* self, float w_icon, float w_label, float w_shortcut, float w_mark) @extern("ImGuiMenuColumns_DeclColumns");
extern fn ImGuiMenuColumns* im_gui_menu_columns_im_gui_menu_columns() @extern("ImGuiMenuColumns_ImGuiMenuColumns");
extern fn void ImGuiMenuColumns.update(ImGuiMenuColumns* self, float spacing, bool window_reappearing) @extern("ImGuiMenuColumns_Update");
extern fn void ImGuiMenuColumns.destroy(ImGuiMenuColumns* self) @extern("ImGuiMenuColumns_destroy");
extern fn ImGuiMultiSelectState* im_gui_multi_select_state_im_gui_multi_select_state() @extern("ImGuiMultiSelectState_ImGuiMultiSelectState");
extern fn void ImGuiMultiSelectState.destroy(ImGuiMultiSelectState* self) @extern("ImGuiMultiSelectState_destroy");
extern fn void ImGuiMultiSelectTempData.clear(ImGuiMultiSelectTempData* self) @extern("ImGuiMultiSelectTempData_Clear");
extern fn void ImGuiMultiSelectTempData.clear_io(ImGuiMultiSelectTempData* self) @extern("ImGuiMultiSelectTempData_ClearIO");
extern fn ImGuiMultiSelectTempData* im_gui_multi_select_temp_data_im_gui_multi_select_temp_data() @extern("ImGuiMultiSelectTempData_ImGuiMultiSelectTempData");
extern fn void ImGuiMultiSelectTempData.destroy(ImGuiMultiSelectTempData* self) @extern("ImGuiMultiSelectTempData_destroy");
extern fn void ImGuiNavItemData.clear(ImGuiNavItemData* self) @extern("ImGuiNavItemData_Clear");
extern fn ImGuiNavItemData* im_gui_nav_item_data_im_gui_nav_item_data() @extern("ImGuiNavItemData_ImGuiNavItemData");
extern fn void ImGuiNavItemData.destroy(ImGuiNavItemData* self) @extern("ImGuiNavItemData_destroy");
extern fn void ImGuiNextItemData.clear_flags(ImGuiNextItemData* self) @extern("ImGuiNextItemData_ClearFlags");
extern fn ImGuiNextItemData* im_gui_next_item_data_im_gui_next_item_data() @extern("ImGuiNextItemData_ImGuiNextItemData");
extern fn void ImGuiNextItemData.destroy(ImGuiNextItemData* self) @extern("ImGuiNextItemData_destroy");
extern fn void ImGuiNextWindowData.clear_flags(ImGuiNextWindowData* self) @extern("ImGuiNextWindowData_ClearFlags");
extern fn ImGuiNextWindowData* im_gui_next_window_data_im_gui_next_window_data() @extern("ImGuiNextWindowData_ImGuiNextWindowData");
extern fn void ImGuiNextWindowData.destroy(ImGuiNextWindowData* self) @extern("ImGuiNextWindowData_destroy");
extern fn ImGuiOldColumnData* im_gui_old_column_data_im_gui_old_column_data() @extern("ImGuiOldColumnData_ImGuiOldColumnData");
extern fn void ImGuiOldColumnData.destroy(ImGuiOldColumnData* self) @extern("ImGuiOldColumnData_destroy");
extern fn ImGuiOldColumns* im_gui_old_columns_im_gui_old_columns() @extern("ImGuiOldColumns_ImGuiOldColumns");
extern fn void ImGuiOldColumns.destroy(ImGuiOldColumns* self) @extern("ImGuiOldColumns_destroy");
extern fn ImGuiOnceUponAFrame* im_gui_once_upon_aframe_im_gui_once_upon_aframe() @extern("ImGuiOnceUponAFrame_ImGuiOnceUponAFrame");
extern fn void ImGuiOnceUponAFrame.destroy(ImGuiOnceUponAFrame* self) @extern("ImGuiOnceUponAFrame_destroy");
extern fn void ImGuiPayload.clear(ImGuiPayload* self) @extern("ImGuiPayload_Clear");
extern fn ImGuiPayload* im_gui_payload_im_gui_payload() @extern("ImGuiPayload_ImGuiPayload");
extern fn bool ImGuiPayload.is_data_type(ImGuiPayload* self, ZString type) @extern("ImGuiPayload_IsDataType");
extern fn bool ImGuiPayload.is_delivery(ImGuiPayload* self) @extern("ImGuiPayload_IsDelivery");
extern fn bool ImGuiPayload.is_preview(ImGuiPayload* self) @extern("ImGuiPayload_IsPreview");
extern fn void ImGuiPayload.destroy(ImGuiPayload* self) @extern("ImGuiPayload_destroy");
extern fn ImGuiPlatformIO* im_gui_platform_ioim_gui_platform_io() @extern("ImGuiPlatformIO_ImGuiPlatformIO");
extern fn void ImGuiPlatformIO.destroy(ImGuiPlatformIO* self) @extern("ImGuiPlatformIO_destroy");
extern fn ImGuiPlatformImeData* im_gui_platform_ime_data_im_gui_platform_ime_data() @extern("ImGuiPlatformImeData_ImGuiPlatformImeData");
extern fn void ImGuiPlatformImeData.destroy(ImGuiPlatformImeData* self) @extern("ImGuiPlatformImeData_destroy");
extern fn ImGuiPlatformMonitor* im_gui_platform_monitor_im_gui_platform_monitor() @extern("ImGuiPlatformMonitor_ImGuiPlatformMonitor");
extern fn void ImGuiPlatformMonitor.destroy(ImGuiPlatformMonitor* self) @extern("ImGuiPlatformMonitor_destroy");
extern fn ImGuiPopupData* im_gui_popup_data_im_gui_popup_data() @extern("ImGuiPopupData_ImGuiPopupData");
extern fn void ImGuiPopupData.destroy(ImGuiPopupData* self) @extern("ImGuiPopupData_destroy");
extern fn ImGuiPtrOrIndex* im_gui_ptr_or_index_im_gui_ptr_or_index_ptr(void* ptr) @extern("ImGuiPtrOrIndex_ImGuiPtrOrIndex_Ptr");
extern fn ImGuiPtrOrIndex* im_gui_ptr_or_index_im_gui_ptr_or_index_int(CInt index) @extern("ImGuiPtrOrIndex_ImGuiPtrOrIndex_Int");
extern fn void ImGuiPtrOrIndex.destroy(ImGuiPtrOrIndex* self) @extern("ImGuiPtrOrIndex_destroy");
extern fn void ImGuiSelectionBasicStorage.apply_requests(ImGuiSelectionBasicStorage* self, ImGuiMultiSelectIO* ms_io) @extern("ImGuiSelectionBasicStorage_ApplyRequests");
extern fn void ImGuiSelectionBasicStorage.clear(ImGuiSelectionBasicStorage* self) @extern("ImGuiSelectionBasicStorage_Clear");
extern fn bool ImGuiSelectionBasicStorage.contains(ImGuiSelectionBasicStorage* self, ImGuiID id) @extern("ImGuiSelectionBasicStorage_Contains");
extern fn bool ImGuiSelectionBasicStorage.get_next_selected_item(ImGuiSelectionBasicStorage* self, void** opaque_it, ImGuiID* out_id) @extern("ImGuiSelectionBasicStorage_GetNextSelectedItem");
extern fn ImGuiID ImGuiSelectionBasicStorage.get_storage_id_from_index(ImGuiSelectionBasicStorage* self, CInt idx) @extern("ImGuiSelectionBasicStorage_GetStorageIdFromIndex");
extern fn ImGuiSelectionBasicStorage* im_gui_selection_basic_storage_im_gui_selection_basic_storage() @extern("ImGuiSelectionBasicStorage_ImGuiSelectionBasicStorage");
extern fn void ImGuiSelectionBasicStorage.set_item_selected(ImGuiSelectionBasicStorage* self, ImGuiID id, bool selected) @extern("ImGuiSelectionBasicStorage_SetItemSelected");
extern fn void ImGuiSelectionBasicStorage.swap(ImGuiSelectionBasicStorage* self, ImGuiSelectionBasicStorage* r) @extern("ImGuiSelectionBasicStorage_Swap");
extern fn void ImGuiSelectionBasicStorage.destroy(ImGuiSelectionBasicStorage* self) @extern("ImGuiSelectionBasicStorage_destroy");
extern fn void ImGuiSelectionExternalStorage.apply_requests(ImGuiSelectionExternalStorage* self, ImGuiMultiSelectIO* ms_io) @extern("ImGuiSelectionExternalStorage_ApplyRequests");
extern fn ImGuiSelectionExternalStorage* im_gui_selection_external_storage_im_gui_selection_external_storage() @extern("ImGuiSelectionExternalStorage_ImGuiSelectionExternalStorage");
extern fn void ImGuiSelectionExternalStorage.destroy(ImGuiSelectionExternalStorage* self) @extern("ImGuiSelectionExternalStorage_destroy");
extern fn ImGuiSettingsHandler* im_gui_settings_handler_im_gui_settings_handler() @extern("ImGuiSettingsHandler_ImGuiSettingsHandler");
extern fn void ImGuiSettingsHandler.destroy(ImGuiSettingsHandler* self) @extern("ImGuiSettingsHandler_destroy");
extern fn ImGuiStackLevelInfo* im_gui_stack_level_info_im_gui_stack_level_info() @extern("ImGuiStackLevelInfo_ImGuiStackLevelInfo");
extern fn void ImGuiStackLevelInfo.destroy(ImGuiStackLevelInfo* self) @extern("ImGuiStackLevelInfo_destroy");
extern fn ImGuiStoragePair* im_gui_storage_pair_im_gui_storage_pair_int(ImGuiID key, CInt val) @extern("ImGuiStoragePair_ImGuiStoragePair_Int");
extern fn ImGuiStoragePair* im_gui_storage_pair_im_gui_storage_pair_float(ImGuiID key, float val) @extern("ImGuiStoragePair_ImGuiStoragePair_Float");
extern fn ImGuiStoragePair* im_gui_storage_pair_im_gui_storage_pair_ptr(ImGuiID key, void* val) @extern("ImGuiStoragePair_ImGuiStoragePair_Ptr");
extern fn void ImGuiStoragePair.destroy(ImGuiStoragePair* self) @extern("ImGuiStoragePair_destroy");
extern fn void ImGuiStorage.build_sort_by_key(ImGuiStorage* self) @extern("ImGuiStorage_BuildSortByKey");
extern fn void ImGuiStorage.clear(ImGuiStorage* self) @extern("ImGuiStorage_Clear");
extern fn bool ImGuiStorage.get_bool(ImGuiStorage* self, ImGuiID key, bool default_val = false) @extern("ImGuiStorage_GetBool");
extern fn bool* ImGuiStorage.get_bool_ref(ImGuiStorage* self, ImGuiID key, bool default_val = false) @extern("ImGuiStorage_GetBoolRef");
extern fn float ImGuiStorage.get_float(ImGuiStorage* self, ImGuiID key, float default_val = 0.0f) @extern("ImGuiStorage_GetFloat");
extern fn float* ImGuiStorage.get_float_ref(ImGuiStorage* self, ImGuiID key, float default_val = 0.0f) @extern("ImGuiStorage_GetFloatRef");
extern fn CInt ImGuiStorage.get_int(ImGuiStorage* self, ImGuiID key, CInt default_val = 0) @extern("ImGuiStorage_GetInt");
extern fn CInt* ImGuiStorage.get_int_ref(ImGuiStorage* self, ImGuiID key, CInt default_val = 0) @extern("ImGuiStorage_GetIntRef");
extern fn void* ImGuiStorage.get_void_ptr(ImGuiStorage* self, ImGuiID key) @extern("ImGuiStorage_GetVoidPtr");
extern fn void** ImGuiStorage.get_void_ptr_ref(ImGuiStorage* self, ImGuiID key, void* default_val = null) @extern("ImGuiStorage_GetVoidPtrRef");
extern fn void ImGuiStorage.set_all_int(ImGuiStorage* self, CInt val) @extern("ImGuiStorage_SetAllInt");
extern fn void ImGuiStorage.set_bool(ImGuiStorage* self, ImGuiID key, bool val) @extern("ImGuiStorage_SetBool");
extern fn void ImGuiStorage.set_float(ImGuiStorage* self, ImGuiID key, float val) @extern("ImGuiStorage_SetFloat");
extern fn void ImGuiStorage.set_int(ImGuiStorage* self, ImGuiID key, CInt val) @extern("ImGuiStorage_SetInt");
extern fn void ImGuiStorage.set_void_ptr(ImGuiStorage* self, ImGuiID key, void* val) @extern("ImGuiStorage_SetVoidPtr");
extern fn ImGuiStyleMod* im_gui_style_mod_im_gui_style_mod_int(ImGuiStyleVar idx, CInt v) @extern("ImGuiStyleMod_ImGuiStyleMod_Int");
extern fn ImGuiStyleMod* im_gui_style_mod_im_gui_style_mod_float(ImGuiStyleVar idx, float v) @extern("ImGuiStyleMod_ImGuiStyleMod_Float");
extern fn ImGuiStyleMod* im_gui_style_mod_im_gui_style_mod_vec2(ImGuiStyleVar idx, ImVec2 v) @extern("ImGuiStyleMod_ImGuiStyleMod_Vec2");
extern fn void ImGuiStyleMod.destroy(ImGuiStyleMod* self) @extern("ImGuiStyleMod_destroy");
extern fn ImGuiStyle* im_gui_style_im_gui_style() @extern("ImGuiStyle_ImGuiStyle");
extern fn void ImGuiStyle.scale_all_sizes(ImGuiStyle* self, float scale_factor) @extern("ImGuiStyle_ScaleAllSizes");
extern fn void ImGuiStyle.destroy(ImGuiStyle* self) @extern("ImGuiStyle_destroy");
extern fn ImGuiTabBar* im_gui_tab_bar_im_gui_tab_bar() @extern("ImGuiTabBar_ImGuiTabBar");
extern fn void ImGuiTabBar.destroy(ImGuiTabBar* self) @extern("ImGuiTabBar_destroy");
extern fn ImGuiTabItem* im_gui_tab_item_im_gui_tab_item() @extern("ImGuiTabItem_ImGuiTabItem");
extern fn void ImGuiTabItem.destroy(ImGuiTabItem* self) @extern("ImGuiTabItem_destroy");
extern fn ImGuiTableColumnSettings* im_gui_table_column_settings_im_gui_table_column_settings() @extern("ImGuiTableColumnSettings_ImGuiTableColumnSettings");
extern fn void ImGuiTableColumnSettings.destroy(ImGuiTableColumnSettings* self) @extern("ImGuiTableColumnSettings_destroy");
extern fn ImGuiTableColumnSortSpecs* im_gui_table_column_sort_specs_im_gui_table_column_sort_specs() @extern("ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs");
extern fn void ImGuiTableColumnSortSpecs.destroy(ImGuiTableColumnSortSpecs* self) @extern("ImGuiTableColumnSortSpecs_destroy");
extern fn ImGuiTableColumn* im_gui_table_column_im_gui_table_column() @extern("ImGuiTableColumn_ImGuiTableColumn");
extern fn void ImGuiTableColumn.destroy(ImGuiTableColumn* self) @extern("ImGuiTableColumn_destroy");
extern fn ImGuiTableInstanceData* im_gui_table_instance_data_im_gui_table_instance_data() @extern("ImGuiTableInstanceData_ImGuiTableInstanceData");
extern fn void ImGuiTableInstanceData.destroy(ImGuiTableInstanceData* self) @extern("ImGuiTableInstanceData_destroy");
extern fn ImGuiTableColumnSettings* ImGuiTableSettings.get_column_settings(ImGuiTableSettings* self) @extern("ImGuiTableSettings_GetColumnSettings");
extern fn ImGuiTableSettings* im_gui_table_settings_im_gui_table_settings() @extern("ImGuiTableSettings_ImGuiTableSettings");
extern fn void ImGuiTableSettings.destroy(ImGuiTableSettings* self) @extern("ImGuiTableSettings_destroy");
extern fn ImGuiTableSortSpecs* im_gui_table_sort_specs_im_gui_table_sort_specs() @extern("ImGuiTableSortSpecs_ImGuiTableSortSpecs");
extern fn void ImGuiTableSortSpecs.destroy(ImGuiTableSortSpecs* self) @extern("ImGuiTableSortSpecs_destroy");
extern fn ImGuiTableTempData* im_gui_table_temp_data_im_gui_table_temp_data() @extern("ImGuiTableTempData_ImGuiTableTempData");
extern fn void ImGuiTableTempData.destroy(ImGuiTableTempData* self) @extern("ImGuiTableTempData_destroy");
extern fn ImGuiTable* im_gui_table_im_gui_table() @extern("ImGuiTable_ImGuiTable");
extern fn void ImGuiTable.destroy(ImGuiTable* self) @extern("ImGuiTable_destroy");
extern fn ImGuiTextBuffer* im_gui_text_buffer_im_gui_text_buffer() @extern("ImGuiTextBuffer_ImGuiTextBuffer");
extern fn void ImGuiTextBuffer.append(ImGuiTextBuffer* self, ZString str, ZString str_end = null) @extern("ImGuiTextBuffer_append");
extern fn void im_gui_text_buffer_appendf(ImGuiTextBuffer* buffer, ZString fmt, ...) @extern("ImGuiTextBuffer_appendf");
extern fn ZString ImGuiTextBuffer.begin(ImGuiTextBuffer* self) @extern("ImGuiTextBuffer_begin");
extern fn ZString ImGuiTextBuffer.c_str(ImGuiTextBuffer* self) @extern("ImGuiTextBuffer_c_str");
extern fn void ImGuiTextBuffer.clear(ImGuiTextBuffer* self) @extern("ImGuiTextBuffer_clear");
extern fn void ImGuiTextBuffer.destroy(ImGuiTextBuffer* self) @extern("ImGuiTextBuffer_destroy");
extern fn bool ImGuiTextBuffer.empty(ImGuiTextBuffer* self) @extern("ImGuiTextBuffer_empty");
extern fn ZString ImGuiTextBuffer.end(ImGuiTextBuffer* self) @extern("ImGuiTextBuffer_end");
extern fn void ImGuiTextBuffer.reserve(ImGuiTextBuffer* self, CInt capacity) @extern("ImGuiTextBuffer_reserve");
extern fn CInt ImGuiTextBuffer.size(ImGuiTextBuffer* self) @extern("ImGuiTextBuffer_size");
extern fn void ImGuiTextFilter.build(ImGuiTextFilter* self) @extern("ImGuiTextFilter_Build");
extern fn void ImGuiTextFilter.clear(ImGuiTextFilter* self) @extern("ImGuiTextFilter_Clear");
extern fn bool ImGuiTextFilter.draw(ImGuiTextFilter* self, ZString label = "Filter(inc,-exc)", float width = 0.0f) @extern("ImGuiTextFilter_Draw");
extern fn ImGuiTextFilter* im_gui_text_filter_im_gui_text_filter(ZString default_filter = "") @extern("ImGuiTextFilter_ImGuiTextFilter");
extern fn bool ImGuiTextFilter.is_active(ImGuiTextFilter* self) @extern("ImGuiTextFilter_IsActive");
extern fn bool ImGuiTextFilter.pass_filter(ImGuiTextFilter* self, ZString text, ZString text_end = null) @extern("ImGuiTextFilter_PassFilter");
extern fn void ImGuiTextFilter.destroy(ImGuiTextFilter* self) @extern("ImGuiTextFilter_destroy");
extern fn void ImGuiTextIndex.append(ImGuiTextIndex* self, ZString base, CInt old_size, CInt new_size) @extern("ImGuiTextIndex_append");
extern fn void ImGuiTextIndex.clear(ImGuiTextIndex* self) @extern("ImGuiTextIndex_clear");
extern fn ZString ImGuiTextIndex.get_line_begin(ImGuiTextIndex* self, ZString base, CInt n) @extern("ImGuiTextIndex_get_line_begin");
extern fn ZString ImGuiTextIndex.get_line_end(ImGuiTextIndex* self, ZString base, CInt n) @extern("ImGuiTextIndex_get_line_end");
extern fn CInt ImGuiTextIndex.size(ImGuiTextIndex* self) @extern("ImGuiTextIndex_size");
extern fn ImGuiTextRange* im_gui_text_range_im_gui_text_range_nil() @extern("ImGuiTextRange_ImGuiTextRange_Nil");
extern fn ImGuiTextRange* im_gui_text_range_im_gui_text_range_str(ZString b, ZString e) @extern("ImGuiTextRange_ImGuiTextRange_Str");
extern fn void ImGuiTextRange.destroy(ImGuiTextRange* self) @extern("ImGuiTextRange_destroy");
extern fn bool ImGuiTextRange.empty(ImGuiTextRange* self) @extern("ImGuiTextRange_empty");
extern fn void ImGuiTextRange.split(ImGuiTextRange* self, char separator, ImVector out) @extern("ImGuiTextRange_split");
extern fn void ImGuiTypingSelectState.clear(ImGuiTypingSelectState* self) @extern("ImGuiTypingSelectState_Clear");
extern fn ImGuiTypingSelectState* im_gui_typing_select_state_im_gui_typing_select_state() @extern("ImGuiTypingSelectState_ImGuiTypingSelectState");
extern fn void ImGuiTypingSelectState.destroy(ImGuiTypingSelectState* self) @extern("ImGuiTypingSelectState_destroy");
extern fn void im_gui_viewport_pcalc_work_rect_pos(ImVec2* p_out, ImGuiViewportP* self, ImVec2 inset_min) @extern("ImGuiViewportP_CalcWorkRectPos");
extern fn void im_gui_viewport_pcalc_work_rect_size(ImVec2* p_out, ImGuiViewportP* self, ImVec2 inset_min, ImVec2 inset_max) @extern("ImGuiViewportP_CalcWorkRectSize");
extern fn void ImGuiViewportP.clear_request_flags(ImGuiViewportP* self) @extern("ImGuiViewportP_ClearRequestFlags");
extern fn void im_gui_viewport_pget_build_work_rect(ImRect* p_out, ImGuiViewportP* self) @extern("ImGuiViewportP_GetBuildWorkRect");
extern fn void im_gui_viewport_pget_main_rect(ImRect* p_out, ImGuiViewportP* self) @extern("ImGuiViewportP_GetMainRect");
extern fn void im_gui_viewport_pget_work_rect(ImRect* p_out, ImGuiViewportP* self) @extern("ImGuiViewportP_GetWorkRect");
extern fn ImGuiViewportP* im_gui_viewport_pim_gui_viewport_p() @extern("ImGuiViewportP_ImGuiViewportP");
extern fn void ImGuiViewportP.update_work_rect(ImGuiViewportP* self) @extern("ImGuiViewportP_UpdateWorkRect");
extern fn void ImGuiViewportP.destroy(ImGuiViewportP* self) @extern("ImGuiViewportP_destroy");
extern fn void im_gui_viewport_get_center(ImVec2* p_out, ImGuiViewport* self) @extern("ImGuiViewport_GetCenter");
extern fn void im_gui_viewport_get_work_center(ImVec2* p_out, ImGuiViewport* self) @extern("ImGuiViewport_GetWorkCenter");
extern fn ImGuiViewport* im_gui_viewport_im_gui_viewport() @extern("ImGuiViewport_ImGuiViewport");
extern fn void ImGuiViewport.destroy(ImGuiViewport* self) @extern("ImGuiViewport_destroy");
extern fn ImGuiWindowClass* im_gui_window_class_im_gui_window_class() @extern("ImGuiWindowClass_ImGuiWindowClass");
extern fn void ImGuiWindowClass.destroy(ImGuiWindowClass* self) @extern("ImGuiWindowClass_destroy");
extern fn ZString ImGuiWindowSettings.get_name(ImGuiWindowSettings* self) @extern("ImGuiWindowSettings_GetName");
extern fn ImGuiWindowSettings* im_gui_window_settings_im_gui_window_settings() @extern("ImGuiWindowSettings_ImGuiWindowSettings");
extern fn void ImGuiWindowSettings.destroy(ImGuiWindowSettings* self) @extern("ImGuiWindowSettings_destroy");
extern fn float ImGuiWindow.calc_font_size(ImGuiWindow* self) @extern("ImGuiWindow_CalcFontSize");
extern fn ImGuiID ImGuiWindow.get_idstr(ImGuiWindow* self, ZString str, ZString str_end = null) @extern("ImGuiWindow_GetID_Str");
extern fn ImGuiID ImGuiWindow.get_idptr(ImGuiWindow* self, void* ptr) @extern("ImGuiWindow_GetID_Ptr");
extern fn ImGuiID ImGuiWindow.get_idint(ImGuiWindow* self, CInt n) @extern("ImGuiWindow_GetID_Int");
extern fn ImGuiID ImGuiWindow.get_idfrom_pos(ImGuiWindow* self, ImVec2 p_abs) @extern("ImGuiWindow_GetIDFromPos");
extern fn ImGuiID ImGuiWindow.get_idfrom_rectangle(ImGuiWindow* self, ImRect r_abs) @extern("ImGuiWindow_GetIDFromRectangle");
extern fn ImGuiWindow* im_gui_window_im_gui_window(ImGuiContext* context, ZString name) @extern("ImGuiWindow_ImGuiWindow");
extern fn void im_gui_window_menu_bar_rect(ImRect* p_out, ImGuiWindow* self) @extern("ImGuiWindow_MenuBarRect");
extern fn void im_gui_window_rect(ImRect* p_out, ImGuiWindow* self) @extern("ImGuiWindow_Rect");
extern fn void im_gui_window_title_bar_rect(ImRect* p_out, ImGuiWindow* self) @extern("ImGuiWindow_TitleBarRect");
extern fn void ImGuiWindow.destroy(ImGuiWindow* self) @extern("ImGuiWindow_destroy");
// Skipping templated: ImPool_Add
// Skipping templated: ImPool_Clear
// Skipping templated: ImPool_Contains
// Skipping templated: ImPool_GetAliveCount
// Skipping templated: ImPool_GetBufSize
// Skipping templated: ImPool_GetByIndex
// Skipping templated: ImPool_GetByKey
// Skipping templated: ImPool_GetIndex
// Skipping templated: ImPool_GetMapSize
// Skipping templated: ImPool_GetOrAddByKey
// Skipping templated: ImPool_ImPool
// Skipping templated: ImPool_Remove_TPtr
// Skipping templated: ImPool_Remove_PoolIdx
// Skipping templated: ImPool_Reserve
// Skipping templated: ImPool_TryGetMapData
// Skipping templated: ImPool_destroy
extern fn void ImRect.add_vec2(ImRect* self, ImVec2 p) @extern("ImRect_Add_Vec2");
extern fn void ImRect.add_rect(ImRect* self, ImRect r) @extern("ImRect_Add_Rect");
extern fn void ImRect.clip_with(ImRect* self, ImRect r) @extern("ImRect_ClipWith");
extern fn void ImRect.clip_with_full(ImRect* self, ImRect r) @extern("ImRect_ClipWithFull");
extern fn bool ImRect.contains_vec2(ImRect* self, ImVec2 p) @extern("ImRect_Contains_Vec2");
extern fn bool ImRect.contains_rect(ImRect* self, ImRect r) @extern("ImRect_Contains_Rect");
extern fn bool ImRect.contains_with_pad(ImRect* self, ImVec2 p, ImVec2 pad) @extern("ImRect_ContainsWithPad");
extern fn void ImRect.expand_float(ImRect* self, float amount) @extern("ImRect_Expand_Float");
extern fn void ImRect.expand_vec2(ImRect* self, ImVec2 amount) @extern("ImRect_Expand_Vec2");
extern fn void ImRect.floor(ImRect* self) @extern("ImRect_Floor");
extern fn float ImRect.get_area(ImRect* self) @extern("ImRect_GetArea");
extern fn void im_rect_get_bl(ImVec2* p_out, ImRect* self) @extern("ImRect_GetBL");
extern fn void im_rect_get_br(ImVec2* p_out, ImRect* self) @extern("ImRect_GetBR");
extern fn void im_rect_get_center(ImVec2* p_out, ImRect* self) @extern("ImRect_GetCenter");
extern fn float ImRect.get_height(ImRect* self) @extern("ImRect_GetHeight");
extern fn void im_rect_get_size(ImVec2* p_out, ImRect* self) @extern("ImRect_GetSize");
extern fn void im_rect_get_tl(ImVec2* p_out, ImRect* self) @extern("ImRect_GetTL");
extern fn void im_rect_get_tr(ImVec2* p_out, ImRect* self) @extern("ImRect_GetTR");
extern fn float ImRect.get_width(ImRect* self) @extern("ImRect_GetWidth");
extern fn ImRect* im_rect_im_rect_nil() @extern("ImRect_ImRect_Nil");
extern fn ImRect* im_rect_im_rect_vec2(ImVec2 min, ImVec2 max) @extern("ImRect_ImRect_Vec2");
extern fn ImRect* im_rect_im_rect_vec4(ImVec4 v) @extern("ImRect_ImRect_Vec4");
extern fn ImRect* im_rect_im_rect_float(float x1, float y1, float x2, float y2) @extern("ImRect_ImRect_Float");
extern fn bool ImRect.is_inverted(ImRect* self) @extern("ImRect_IsInverted");
extern fn bool ImRect.overlaps(ImRect* self, ImRect r) @extern("ImRect_Overlaps");
extern fn void im_rect_to_vec4(ImVec4* p_out, ImRect* self) @extern("ImRect_ToVec4");
extern fn void ImRect.translate(ImRect* self, ImVec2 d) @extern("ImRect_Translate");
extern fn void ImRect.translate_x(ImRect* self, float dx) @extern("ImRect_TranslateX");
extern fn void ImRect.translate_y(ImRect* self, float dy) @extern("ImRect_TranslateY");
extern fn void ImRect.destroy(ImRect* self) @extern("ImRect_destroy");
// Skipping templated: ImSpanAllocator_GetArenaSizeInBytes
// Skipping templated: ImSpanAllocator_GetSpanPtrBegin
// Skipping templated: ImSpanAllocator_GetSpanPtrEnd
// Skipping templated: ImSpanAllocator_ImSpanAllocator
// Skipping templated: ImSpanAllocator_Reserve
// Skipping templated: ImSpanAllocator_SetArenaBasePtr
// Skipping templated: ImSpanAllocator_destroy
// Skipping templated: ImSpan_ImSpan_Nil
// Skipping templated: ImSpan_ImSpan_TPtrInt
// Skipping templated: ImSpan_ImSpan_TPtrTPtr
// Skipping templated: ImSpan_begin_Nil
// Skipping templated: ImSpan_begin__const
// Skipping templated: ImSpan_destroy
// Skipping templated: ImSpan_end_Nil
// Skipping templated: ImSpan_end__const
// Skipping templated: ImSpan_index_from_ptr
// Skipping templated: ImSpan_set_Int
// Skipping templated: ImSpan_set_TPtr
// Skipping templated: ImSpan_size
// Skipping templated: ImSpan_size_in_bytes
extern fn ImVec1* im_vec1_im_vec1_nil() @extern("ImVec1_ImVec1_Nil");
extern fn ImVec1* im_vec1_im_vec1_float(float x) @extern("ImVec1_ImVec1_Float");
extern fn void ImVec1.destroy(ImVec1* self) @extern("ImVec1_destroy");
extern fn ImVec2* im_vec2_im_vec2_nil() @extern("ImVec2_ImVec2_Nil");
extern fn ImVec2* im_vec2_im_vec2_float(float x, float y) @extern("ImVec2_ImVec2_Float");
extern fn void ImVec2.destroy(ImVec2* self) @extern("ImVec2_destroy");
extern fn ImVec2ih* im_vec2ih_im_vec2ih_nil() @extern("ImVec2ih_ImVec2ih_Nil");
extern fn ImVec2ih* im_vec2ih_im_vec2ih_short(CShort x, CShort y) @extern("ImVec2ih_ImVec2ih_short");
extern fn ImVec2ih* im_vec2ih_im_vec2ih_vec2(ImVec2 rhs) @extern("ImVec2ih_ImVec2ih_Vec2");
extern fn void ImVec2ih.destroy(ImVec2ih* self) @extern("ImVec2ih_destroy");
extern fn ImVec4* im_vec4_im_vec4_nil() @extern("ImVec4_ImVec4_Nil");
extern fn ImVec4* im_vec4_im_vec4_float(float x, float y, float z, float w) @extern("ImVec4_ImVec4_Float");
extern fn void ImVec4.destroy(ImVec4* self) @extern("ImVec4_destroy");
// Skipping templated: ImVector_ImVector_Nil
// Skipping templated: ImVector_ImVector_Vector_T_
// Skipping templated: ImVector__grow_capacity
// Skipping templated: ImVector_back_Nil
// Skipping templated: ImVector_back__const
// Skipping templated: ImVector_begin_Nil
// Skipping templated: ImVector_begin__const
// Skipping templated: ImVector_capacity
// Skipping templated: ImVector_clear
// Skipping templated: ImVector_clear_delete
// Skipping templated: ImVector_clear_destruct
// Skipping templated: ImVector_contains
// Skipping templated: ImVector_destroy
// Skipping templated: ImVector_empty
// Skipping templated: ImVector_end_Nil
// Skipping templated: ImVector_end__const
// Skipping templated: ImVector_erase_Nil
// Skipping templated: ImVector_erase_TPtr
// Skipping templated: ImVector_erase_unsorted
// Skipping templated: ImVector_find_Nil
// Skipping templated: ImVector_find__const
// Skipping templated: ImVector_find_erase
// Skipping templated: ImVector_find_erase_unsorted
// Skipping templated: ImVector_find_index
// Skipping templated: ImVector_front_Nil
// Skipping templated: ImVector_front__const
// Skipping templated: ImVector_index_from_ptr
// Skipping templated: ImVector_insert
// Skipping templated: ImVector_max_size
// Skipping templated: ImVector_pop_back
// Skipping templated: ImVector_push_back
// Skipping templated: ImVector_push_front
// Skipping templated: ImVector_reserve
// Skipping templated: ImVector_reserve_discard
// Skipping templated: ImVector_resize_Nil
// Skipping templated: ImVector_resize_T
// Skipping templated: ImVector_shrink
// Skipping templated: ImVector_size
// Skipping templated: ImVector_size_in_bytes
// Skipping templated: ImVector_swap
extern fn ImGuiPayload* accept_drag_drop_payload(ZString type, ImGuiDragDropFlags flags = 0) @extern("igAcceptDragDropPayload");
extern fn void activate_item_by_id(ImGuiID id) @extern("igActivateItemByID");
extern fn ImGuiID add_context_hook(ImGuiContext* context, ImGuiContextHook* hook) @extern("igAddContextHook");
extern fn void add_draw_list_to_draw_data_ex(ImDrawData* draw_data, ImVector out_list, ImDrawList* draw_list) @extern("igAddDrawListToDrawDataEx");
extern fn void add_settings_handler(ImGuiSettingsHandler* handler) @extern("igAddSettingsHandler");
extern fn void align_text_to_frame_padding() @extern("igAlignTextToFramePadding");
extern fn bool arrow_button(ZString str_id, ImGuiDir dir) @extern("igArrowButton");
extern fn bool arrow_button_ex(ZString str_id, ImGuiDir dir, ImVec2 size_arg, ImGuiButtonFlags flags = 0) @extern("igArrowButtonEx");
extern fn bool begin(ZString name, bool* p_open = null, ImGuiWindowFlags flags = 0) @extern("igBegin");
extern fn bool begin_box_select(ImRect scope_rect, ImGuiWindow* window, ImGuiID box_select_id, ImGuiMultiSelectFlags ms_flags) @extern("igBeginBoxSelect");
extern fn bool begin_child_str(ZString str_id, ImVec2 size = {}, ImGuiChildFlags child_flags = 0, ImGuiWindowFlags window_flags = 0) @extern("igBeginChild_Str");
extern fn bool begin_child_id(ImGuiID id, ImVec2 size = {}, ImGuiChildFlags child_flags = 0, ImGuiWindowFlags window_flags = 0) @extern("igBeginChild_ID");
extern fn bool begin_child_ex(ZString name, ImGuiID id, ImVec2 size_arg, ImGuiChildFlags child_flags, ImGuiWindowFlags window_flags) @extern("igBeginChildEx");
extern fn void begin_columns(ZString str_id, CInt count, ImGuiOldColumnFlags flags = 0) @extern("igBeginColumns");
extern fn bool begin_combo(ZString label, ZString preview_value, ImGuiComboFlags flags = 0) @extern("igBeginCombo");
extern fn bool begin_combo_popup(ImGuiID popup_id, ImRect bb, ImGuiComboFlags flags) @extern("igBeginComboPopup");
extern fn bool begin_combo_preview() @extern("igBeginComboPreview");
extern fn void begin_disabled(bool disabled = true) @extern("igBeginDisabled");
extern fn void begin_disabled_override_reenable() @extern("igBeginDisabledOverrideReenable");
extern fn void begin_dockable_drag_drop_source(ImGuiWindow* window) @extern("igBeginDockableDragDropSource");
extern fn void begin_dockable_drag_drop_target(ImGuiWindow* window) @extern("igBeginDockableDragDropTarget");
extern fn void begin_docked(ImGuiWindow* window, bool* p_open) @extern("igBeginDocked");
extern fn bool begin_drag_drop_source(ImGuiDragDropFlags flags = 0) @extern("igBeginDragDropSource");
extern fn bool begin_drag_drop_target() @extern("igBeginDragDropTarget");
extern fn bool begin_drag_drop_target_custom(ImRect bb, ImGuiID id) @extern("igBeginDragDropTargetCustom");
extern fn bool begin_error_tooltip() @extern("igBeginErrorTooltip");
extern fn void begin_group() @extern("igBeginGroup");
extern fn bool begin_item_tooltip() @extern("igBeginItemTooltip");
extern fn bool begin_list_box(ZString label, ImVec2 size = {}) @extern("igBeginListBox");
extern fn bool begin_main_menu_bar() @extern("igBeginMainMenuBar");
extern fn bool begin_menu(ZString label, bool enabled = true) @extern("igBeginMenu");
extern fn bool begin_menu_bar() @extern("igBeginMenuBar");
extern fn bool begin_menu_ex(ZString label, ZString icon, bool enabled = true) @extern("igBeginMenuEx");
extern fn ImGuiMultiSelectIO* begin_multi_select(ImGuiMultiSelectFlags flags, CInt selection_size = -1, CInt items_count = -1) @extern("igBeginMultiSelect");
extern fn bool begin_popup(ZString str_id, ImGuiWindowFlags flags = 0) @extern("igBeginPopup");
extern fn bool begin_popup_context_item(ZString str_id = null, ImGuiPopupFlags popup_flags = 1) @extern("igBeginPopupContextItem");
extern fn bool begin_popup_context_void(ZString str_id = null, ImGuiPopupFlags popup_flags = 1) @extern("igBeginPopupContextVoid");
extern fn bool begin_popup_context_window(ZString str_id = null, ImGuiPopupFlags popup_flags = 1) @extern("igBeginPopupContextWindow");
extern fn bool begin_popup_ex(ImGuiID id, ImGuiWindowFlags extra_window_flags) @extern("igBeginPopupEx");
extern fn bool begin_popup_modal(ZString name, bool* p_open = null, ImGuiWindowFlags flags = 0) @extern("igBeginPopupModal");
extern fn bool begin_tab_bar(ZString str_id, ImGuiTabBarFlags flags = 0) @extern("igBeginTabBar");
extern fn bool begin_tab_bar_ex(ImGuiTabBar* tab_bar, ImRect bb, ImGuiTabBarFlags flags) @extern("igBeginTabBarEx");
extern fn bool begin_tab_item(ZString label, bool* p_open = null, ImGuiTabItemFlags flags = 0) @extern("igBeginTabItem");
extern fn bool begin_table(ZString str_id, CInt columns, ImGuiTableFlags flags = 0, ImVec2 outer_size = {}, float inner_width = 0.0f) @extern("igBeginTable");
extern fn bool begin_table_ex(ZString name, ImGuiID id, CInt columns_count, ImGuiTableFlags flags = 0, ImVec2 outer_size = {}, float inner_width = 0.0f) @extern("igBeginTableEx");
extern fn bool begin_tooltip() @extern("igBeginTooltip");
extern fn bool begin_tooltip_ex(ImGuiTooltipFlags tooltip_flags, ImGuiWindowFlags extra_window_flags) @extern("igBeginTooltipEx");
extern fn bool begin_tooltip_hidden() @extern("igBeginTooltipHidden");
extern fn bool begin_viewport_side_bar(ZString name, ImGuiViewport* viewport, ImGuiDir dir, float size, ImGuiWindowFlags window_flags) @extern("igBeginViewportSideBar");
extern fn void bring_window_to_display_back(ImGuiWindow* window) @extern("igBringWindowToDisplayBack");
extern fn void bring_window_to_display_behind(ImGuiWindow* window, ImGuiWindow* above_window) @extern("igBringWindowToDisplayBehind");
extern fn void bring_window_to_display_front(ImGuiWindow* window) @extern("igBringWindowToDisplayFront");
extern fn void bring_window_to_focus_front(ImGuiWindow* window) @extern("igBringWindowToFocusFront");
extern fn void bullet() @extern("igBullet");
extern fn void bullet_text(ZString fmt, ...) @extern("igBulletText");
extern fn bool button(ZString label, ImVec2 size = {}) @extern("igButton");
extern fn bool button_behavior(ImRect bb, ImGuiID id, bool* out_hovered, bool* out_held, ImGuiButtonFlags flags = 0) @extern("igButtonBehavior");
extern fn bool button_ex(ZString label, ImVec2 size_arg = {}, ImGuiButtonFlags flags = 0) @extern("igButtonEx");
extern fn void calc_item_size(ImVec2* p_out, ImVec2 size, float default_w, float default_h) @extern("igCalcItemSize");
extern fn float calc_item_width() @extern("igCalcItemWidth");
extern fn ImDrawFlags calc_rounding_flags_for_rect_in_rect(ImRect r_in, ImRect r_outer, float threshold) @extern("igCalcRoundingFlagsForRectInRect");
extern fn void calc_text_size(ImVec2* p_out, ZString text, ZString text_end = null, bool hide_text_after_double_hash = false, float wrap_width = -1.0f) @extern("igCalcTextSize");
extern fn CInt calc_typematic_repeat_amount(float t0, float t1, float repeat_delay, float repeat_rate) @extern("igCalcTypematicRepeatAmount");
extern fn void calc_window_next_auto_fit_size(ImVec2* p_out, ImGuiWindow* window) @extern("igCalcWindowNextAutoFitSize");
extern fn float calc_wrap_width_for_pos(ImVec2 pos, float wrap_pos_x) @extern("igCalcWrapWidthForPos");
extern fn void call_context_hooks(ImGuiContext* context, ImGuiContextHookType type) @extern("igCallContextHooks");
extern fn bool checkbox(ZString label, bool* v) @extern("igCheckbox");
extern fn bool checkbox_flags_int_ptr(ZString label, CInt* flags, CInt flags_value) @extern("igCheckboxFlags_IntPtr");
extern fn bool checkbox_flags_uint_ptr(ZString label, CUInt* flags, CUInt flags_value) @extern("igCheckboxFlags_UintPtr");
extern fn bool checkbox_flags_s64_ptr(ZString label, ImS64* flags, ImS64 flags_value) @extern("igCheckboxFlags_S64Ptr");
extern fn bool checkbox_flags_u64_ptr(ZString label, ImU64* flags, ImU64 flags_value) @extern("igCheckboxFlags_U64Ptr");
extern fn void clear_active_id() @extern("igClearActiveID");
extern fn void clear_drag_drop() @extern("igClearDragDrop");
extern fn void clear_ini_settings() @extern("igClearIniSettings");
extern fn void clear_window_settings(ZString name) @extern("igClearWindowSettings");
extern fn bool close_button(ImGuiID id, ImVec2 pos) @extern("igCloseButton");
extern fn void close_current_popup() @extern("igCloseCurrentPopup");
extern fn void close_popup_to_level(CInt remaining, bool restore_focus_to_window_under_popup) @extern("igClosePopupToLevel");
extern fn void close_popups_except_modals() @extern("igClosePopupsExceptModals");
extern fn void close_popups_over_window(ImGuiWindow* ref_window, bool restore_focus_to_window_under_popup) @extern("igClosePopupsOverWindow");
extern fn bool collapse_button(ImGuiID id, ImVec2 pos, ImGuiDockNode* dock_node) @extern("igCollapseButton");
extern fn bool collapsing_header_tree_node_flags(ZString label, ImGuiTreeNodeFlags flags = 0) @extern("igCollapsingHeader_TreeNodeFlags");
extern fn bool collapsing_header_bool_ptr(ZString label, bool* p_visible, ImGuiTreeNodeFlags flags = 0) @extern("igCollapsingHeader_BoolPtr");
extern fn bool color_button(ZString desc_id, ImVec4 col, ImGuiColorEditFlags flags = 0, ImVec2 size = {}) @extern("igColorButton");
extern fn ImU32 color_convert_float4_to_u32(ImVec4 in) @extern("igColorConvertFloat4ToU32");
extern fn void color_convert_hsvto_rgb(float h, float s, float v, float* out_r, float* out_g, float* out_b) @extern("igColorConvertHSVtoRGB");
extern fn void color_convert_rgbto_hsv(float r, float g, float b, float* out_h, float* out_s, float* out_v) @extern("igColorConvertRGBtoHSV");
extern fn void color_convert_u32_to_float4(ImVec4* p_out, ImU32 in) @extern("igColorConvertU32ToFloat4");
extern fn bool color_edit3(ZString label, float[3]* col, ImGuiColorEditFlags flags = 0) @extern("igColorEdit3");
extern fn bool color_edit4(ZString label, float[4]* col, ImGuiColorEditFlags flags = 0) @extern("igColorEdit4");
extern fn void color_edit_options_popup(float* col, ImGuiColorEditFlags flags) @extern("igColorEditOptionsPopup");
extern fn bool color_picker3(ZString label, float[3]* col, ImGuiColorEditFlags flags = 0) @extern("igColorPicker3");
extern fn bool color_picker4(ZString label, float[4]* col, ImGuiColorEditFlags flags = 0, float* ref_col = null) @extern("igColorPicker4");
extern fn void color_picker_options_popup(float* ref_col, ImGuiColorEditFlags flags) @extern("igColorPickerOptionsPopup");
extern fn void color_tooltip(ZString text, float* col, ImGuiColorEditFlags flags) @extern("igColorTooltip");
extern fn void columns(CInt count = 1, ZString id = null, bool borders = true) @extern("igColumns");
extern fn bool combo_str_arr(ZString label, CInt* current_item, ZString* items, CInt items_count, CInt popup_max_height_in_items = -1) @extern("igCombo_Str_arr");
extern fn bool combo_str(ZString label, CInt* current_item, ZString items_separated_by_zeros, CInt popup_max_height_in_items = -1) @extern("igCombo_Str");
extern fn bool combo_fn_str_ptr(ZString label, CInt* current_item, GetZStringByIndexFn getter, void* user_data, CInt items_count, CInt popup_max_height_in_items = -1) @extern("igCombo_FnStrPtr");
extern fn ImGuiKey convert_single_mod_flag_to_key(ImGuiKey key) @extern("igConvertSingleModFlagToKey");
extern fn ImGuiContext* create_context(ImFontAtlas* shared_font_atlas = null) @extern("igCreateContext");
extern fn ImGuiWindowSettings* create_new_window_settings(ZString name) @extern("igCreateNewWindowSettings");
extern fn bool data_type_apply_from_text(ZString buf, ImGuiDataType data_type, void* p_data, ZString format, void* p_data_when_empty = null) @extern("igDataTypeApplyFromText");
extern fn void data_type_apply_op(ImGuiDataType data_type, CInt op, void* output, void* arg_1, void* arg_2) @extern("igDataTypeApplyOp");
extern fn bool data_type_clamp(ImGuiDataType data_type, void* p_data, void* p_min, void* p_max) @extern("igDataTypeClamp");
extern fn CInt data_type_compare(ImGuiDataType data_type, void* arg_1, void* arg_2) @extern("igDataTypeCompare");
extern fn CInt data_type_format_string(ZString buf, CInt buf_size, ImGuiDataType data_type, void* p_data, ZString format) @extern("igDataTypeFormatString");
extern fn ImGuiDataTypeInfo* data_type_get_info(ImGuiDataType data_type) @extern("igDataTypeGetInfo");
extern fn bool data_type_is_zero(ImGuiDataType data_type, void* p_data) @extern("igDataTypeIsZero");
extern fn void debug_alloc_hook(ImGuiDebugAllocInfo* info, CInt frame_count, void* ptr, usz size) @extern("igDebugAllocHook");
extern fn bool debug_break_button(ZString label, ZString description_of_location) @extern("igDebugBreakButton");
extern fn void debug_break_button_tooltip(bool keyboard_only, ZString description_of_location) @extern("igDebugBreakButtonTooltip");
extern fn void debug_break_clear_data() @extern("igDebugBreakClearData");
extern fn bool debug_check_version_and_data_layout(ZString version_str, usz sz_io, usz sz_style, usz sz_vec2, usz sz_vec4, usz sz_drawvert, usz sz_drawidx) @extern("igDebugCheckVersionAndDataLayout");
extern fn void debug_draw_cursor_pos(ImU32 col = 4278190335) @extern("igDebugDrawCursorPos");
extern fn void debug_draw_item_rect(ImU32 col = 4278190335) @extern("igDebugDrawItemRect");
extern fn void debug_draw_line_extents(ImU32 col = 4278190335) @extern("igDebugDrawLineExtents");
extern fn void debug_flash_style_color(ImGuiCol idx) @extern("igDebugFlashStyleColor");
extern fn void debug_hook_id_info(ImGuiID id, ImGuiDataType data_type, void* data_id, void* data_id_end) @extern("igDebugHookIdInfo");
extern fn void debug_locate_item(ImGuiID target_id) @extern("igDebugLocateItem");
extern fn void debug_locate_item_on_hover(ImGuiID target_id) @extern("igDebugLocateItemOnHover");
extern fn void debug_locate_item_resolve_with_last_item() @extern("igDebugLocateItemResolveWithLastItem");
extern fn void debug_log(ZString fmt, ...) @extern("igDebugLog");
extern fn void debug_node_columns(ImGuiOldColumns* columns) @extern("igDebugNodeColumns");
extern fn void debug_node_dock_node(ImGuiDockNode* node, ZString label) @extern("igDebugNodeDockNode");
extern fn void debug_node_draw_cmd_show_mesh_and_bounding_box(ImDrawList* out_draw_list, ImDrawList* draw_list, ImDrawCmd* draw_cmd, bool show_mesh, bool show_aabb) @extern("igDebugNodeDrawCmdShowMeshAndBoundingBox");
extern fn void debug_node_draw_list(ImGuiWindow* window, ImGuiViewportP* viewport, ImDrawList* draw_list, ZString label) @extern("igDebugNodeDrawList");
extern fn void debug_node_font(ImFont* font) @extern("igDebugNodeFont");
extern fn void debug_node_font_glyph(ImFont* font, ImFontGlyph* glyph) @extern("igDebugNodeFontGlyph");
extern fn void debug_node_input_text_state(ImGuiInputTextState* state) @extern("igDebugNodeInputTextState");
extern fn void debug_node_multi_select_state(ImGuiMultiSelectState* state) @extern("igDebugNodeMultiSelectState");
extern fn void debug_node_platform_monitor(ImGuiPlatformMonitor* monitor, ZString label, CInt idx) @extern("igDebugNodePlatformMonitor");
extern fn void debug_node_storage(ImGuiStorage* storage, ZString label) @extern("igDebugNodeStorage");
extern fn void debug_node_tab_bar(ImGuiTabBar* tab_bar, ZString label) @extern("igDebugNodeTabBar");
extern fn void debug_node_table(ImGuiTable* table) @extern("igDebugNodeTable");
extern fn void debug_node_table_settings(ImGuiTableSettings* settings) @extern("igDebugNodeTableSettings");
extern fn void debug_node_typing_select_state(ImGuiTypingSelectState* state) @extern("igDebugNodeTypingSelectState");
extern fn void debug_node_viewport(ImGuiViewportP* viewport) @extern("igDebugNodeViewport");
extern fn void debug_node_window(ImGuiWindow* window, ZString label) @extern("igDebugNodeWindow");
extern fn void debug_node_window_settings(ImGuiWindowSettings* settings) @extern("igDebugNodeWindowSettings");
extern fn void debug_node_windows_list(ImVector windows, ZString label) @extern("igDebugNodeWindowsList");
extern fn void debug_node_windows_list_by_begin_stack_parent(ImGuiWindow** windows, CInt windows_size, ImGuiWindow* parent_in_begin_stack) @extern("igDebugNodeWindowsListByBeginStackParent");
extern fn void debug_render_keyboard_preview(ImDrawList* draw_list) @extern("igDebugRenderKeyboardPreview");
extern fn void debug_render_viewport_thumbnail(ImDrawList* draw_list, ImGuiViewportP* viewport, ImRect bb) @extern("igDebugRenderViewportThumbnail");
extern fn void debug_start_item_picker() @extern("igDebugStartItemPicker");
extern fn void debug_text_encoding(ZString text) @extern("igDebugTextEncoding");
extern fn void debug_text_unformatted_with_locate_item(ZString line_begin, ZString line_end) @extern("igDebugTextUnformattedWithLocateItem");
extern fn void destroy_context(ImGuiContext* ctx = null) @extern("igDestroyContext");
extern fn void destroy_platform_window(ImGuiViewportP* viewport) @extern("igDestroyPlatformWindow");
extern fn void destroy_platform_windows() @extern("igDestroyPlatformWindows");
extern fn ImGuiID dock_builder_add_node(ImGuiID node_id = 0, ImGuiDockNodeFlags flags = 0) @extern("igDockBuilderAddNode");
extern fn void dock_builder_copy_dock_space(ImGuiID src_dockspace_id, ImGuiID dst_dockspace_id, ImVector in_window_remap_pairs) @extern("igDockBuilderCopyDockSpace");
extern fn void dock_builder_copy_node(ImGuiID src_node_id, ImGuiID dst_node_id, ImVector out_node_remap_pairs) @extern("igDockBuilderCopyNode");
extern fn void dock_builder_copy_window_settings(ZString src_name, ZString dst_name) @extern("igDockBuilderCopyWindowSettings");
extern fn void dock_builder_dock_window(ZString window_name, ImGuiID node_id) @extern("igDockBuilderDockWindow");
extern fn void dock_builder_finish(ImGuiID node_id) @extern("igDockBuilderFinish");
extern fn ImGuiDockNode* dock_builder_get_central_node(ImGuiID node_id) @extern("igDockBuilderGetCentralNode");
extern fn ImGuiDockNode* dock_builder_get_node(ImGuiID node_id) @extern("igDockBuilderGetNode");
extern fn void dock_builder_remove_node(ImGuiID node_id) @extern("igDockBuilderRemoveNode");
extern fn void dock_builder_remove_node_child_nodes(ImGuiID node_id) @extern("igDockBuilderRemoveNodeChildNodes");
extern fn void dock_builder_remove_node_docked_windows(ImGuiID node_id, bool clear_settings_refs = true) @extern("igDockBuilderRemoveNodeDockedWindows");
extern fn void dock_builder_set_node_pos(ImGuiID node_id, ImVec2 pos) @extern("igDockBuilderSetNodePos");
extern fn void dock_builder_set_node_size(ImGuiID node_id, ImVec2 size) @extern("igDockBuilderSetNodeSize");
extern fn ImGuiID dock_builder_split_node(ImGuiID node_id, ImGuiDir split_dir, float size_ratio_for_node_at_dir, ImGuiID* out_id_at_dir, ImGuiID* out_id_at_opposite_dir) @extern("igDockBuilderSplitNode");
extern fn bool dock_context_calc_drop_pos_for_docking(ImGuiWindow* target, ImGuiDockNode* target_node, ImGuiWindow* payload_window, ImGuiDockNode* payload_node, ImGuiDir split_dir, bool split_outer, ImVec2* out_pos) @extern("igDockContextCalcDropPosForDocking");
extern fn void dock_context_clear_nodes(ImGuiContext* ctx, ImGuiID root_id, bool clear_settings_refs) @extern("igDockContextClearNodes");
extern fn void dock_context_end_frame(ImGuiContext* ctx) @extern("igDockContextEndFrame");
extern fn ImGuiDockNode* dock_context_find_node_by_id(ImGuiContext* ctx, ImGuiID id) @extern("igDockContextFindNodeByID");
extern fn ImGuiID dock_context_gen_node_id(ImGuiContext* ctx) @extern("igDockContextGenNodeID");
extern fn void dock_context_initialize(ImGuiContext* ctx) @extern("igDockContextInitialize");
extern fn void dock_context_new_frame_update_docking(ImGuiContext* ctx) @extern("igDockContextNewFrameUpdateDocking");
extern fn void dock_context_new_frame_update_undocking(ImGuiContext* ctx) @extern("igDockContextNewFrameUpdateUndocking");
extern fn void dock_context_process_undock_node(ImGuiContext* ctx, ImGuiDockNode* node) @extern("igDockContextProcessUndockNode");
extern fn void dock_context_process_undock_window(ImGuiContext* ctx, ImGuiWindow* window, bool clear_persistent_docking_ref = true) @extern("igDockContextProcessUndockWindow");
extern fn void dock_context_queue_dock(ImGuiContext* ctx, ImGuiWindow* target, ImGuiDockNode* target_node, ImGuiWindow* payload, ImGuiDir split_dir, float split_ratio, bool split_outer) @extern("igDockContextQueueDock");
extern fn void dock_context_queue_undock_node(ImGuiContext* ctx, ImGuiDockNode* node) @extern("igDockContextQueueUndockNode");
extern fn void dock_context_queue_undock_window(ImGuiContext* ctx, ImGuiWindow* window) @extern("igDockContextQueueUndockWindow");
extern fn void dock_context_rebuild_nodes(ImGuiContext* ctx) @extern("igDockContextRebuildNodes");
extern fn void dock_context_shutdown(ImGuiContext* ctx) @extern("igDockContextShutdown");
extern fn bool dock_node_begin_amend_tab_bar(ImGuiDockNode* node) @extern("igDockNodeBeginAmendTabBar");
extern fn void dock_node_end_amend_tab_bar() @extern("igDockNodeEndAmendTabBar");
extern fn CInt dock_node_get_depth(ImGuiDockNode* node) @extern("igDockNodeGetDepth");
extern fn ImGuiDockNode* dock_node_get_root_node(ImGuiDockNode* node) @extern("igDockNodeGetRootNode");
extern fn ImGuiID dock_node_get_window_menu_button_id(ImGuiDockNode* node) @extern("igDockNodeGetWindowMenuButtonId");
extern fn bool dock_node_is_in_hierarchy_of(ImGuiDockNode* node, ImGuiDockNode* parent) @extern("igDockNodeIsInHierarchyOf");
extern fn void dock_node_window_menu_handler_default(ImGuiContext* ctx, ImGuiDockNode* node, ImGuiTabBar* tab_bar) @extern("igDockNodeWindowMenuHandler_Default");
extern fn ImGuiID dock_space(ImGuiID dockspace_id, ImVec2 size = {}, ImGuiDockNodeFlags flags = 0, ImGuiWindowClass* window_class = null) @extern("igDockSpace");
extern fn ImGuiID dock_space_over_viewport(ImGuiID dockspace_id = 0, ImGuiViewport* viewport = null, ImGuiDockNodeFlags flags = 0, ImGuiWindowClass* window_class = null) @extern("igDockSpaceOverViewport");
extern fn bool drag_behavior(ImGuiID id, ImGuiDataType data_type, void* p_v, float v_speed, void* p_min, void* p_max, ZString format, ImGuiSliderFlags flags) @extern("igDragBehavior");
extern fn bool drag_float(ZString label, float* v, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, ZString format = "%.3f", ImGuiSliderFlags flags = 0) @extern("igDragFloat");
extern fn bool drag_float2(ZString label, float[2]* v, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, ZString format = "%.3f", ImGuiSliderFlags flags = 0) @extern("igDragFloat2");
extern fn bool drag_float3(ZString label, float[3]* v, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, ZString format = "%.3f", ImGuiSliderFlags flags = 0) @extern("igDragFloat3");
extern fn bool drag_float4(ZString label, float[4]* v, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, ZString format = "%.3f", ImGuiSliderFlags flags = 0) @extern("igDragFloat4");
extern fn bool drag_float_range2(ZString label, float* v_current_min, float* v_current_max, float v_speed = 1.0f, float v_min = 0.0f, float v_max = 0.0f, ZString format = "%.3f", ZString format_max = null, ImGuiSliderFlags flags = 0) @extern("igDragFloatRange2");
extern fn bool drag_int(ZString label, CInt* v, float v_speed = 1.0f, CInt v_min = 0, CInt v_max = 0, ZString format = "%d", ImGuiSliderFlags flags = 0) @extern("igDragInt");
extern fn bool drag_int2(ZString label, CInt[2]* v, float v_speed = 1.0f, CInt v_min = 0, CInt v_max = 0, ZString format = "%d", ImGuiSliderFlags flags = 0) @extern("igDragInt2");
extern fn bool drag_int3(ZString label, CInt[3]* v, float v_speed = 1.0f, CInt v_min = 0, CInt v_max = 0, ZString format = "%d", ImGuiSliderFlags flags = 0) @extern("igDragInt3");
extern fn bool drag_int4(ZString label, CInt[4]* v, float v_speed = 1.0f, CInt v_min = 0, CInt v_max = 0, ZString format = "%d", ImGuiSliderFlags flags = 0) @extern("igDragInt4");
extern fn bool drag_int_range2(ZString label, CInt* v_current_min, CInt* v_current_max, float v_speed = 1.0f, CInt v_min = 0, CInt v_max = 0, ZString format = "%d", ZString format_max = null, ImGuiSliderFlags flags = 0) @extern("igDragIntRange2");
extern fn bool drag_scalar(ZString label, ImGuiDataType data_type, void* p_data, float v_speed = 1.0f, void* p_min = null, void* p_max = null, ZString format = null, ImGuiSliderFlags flags = 0) @extern("igDragScalar");
extern fn bool drag_scalar_n(ZString label, ImGuiDataType data_type, void* p_data, CInt components, float v_speed = 1.0f, void* p_min = null, void* p_max = null, ZString format = null, ImGuiSliderFlags flags = 0) @extern("igDragScalarN");
extern fn void dummy(ImVec2 size) @extern("igDummy");
extern fn void end() @extern("igEnd");
extern fn void end_box_select(ImRect scope_rect, ImGuiMultiSelectFlags ms_flags) @extern("igEndBoxSelect");
extern fn void end_child() @extern("igEndChild");
extern fn void end_columns() @extern("igEndColumns");
extern fn void end_combo() @extern("igEndCombo");
extern fn void end_combo_preview() @extern("igEndComboPreview");
extern fn void end_disabled() @extern("igEndDisabled");
extern fn void end_disabled_override_reenable() @extern("igEndDisabledOverrideReenable");
extern fn void end_drag_drop_source() @extern("igEndDragDropSource");
extern fn void end_drag_drop_target() @extern("igEndDragDropTarget");
extern fn void end_error_tooltip() @extern("igEndErrorTooltip");
extern fn void end_frame() @extern("igEndFrame");
extern fn void end_group() @extern("igEndGroup");
extern fn void end_list_box() @extern("igEndListBox");
extern fn void end_main_menu_bar() @extern("igEndMainMenuBar");
extern fn void end_menu() @extern("igEndMenu");
extern fn void end_menu_bar() @extern("igEndMenuBar");
extern fn ImGuiMultiSelectIO* end_multi_select() @extern("igEndMultiSelect");
extern fn void end_popup() @extern("igEndPopup");
extern fn void end_tab_bar() @extern("igEndTabBar");
extern fn void end_tab_item() @extern("igEndTabItem");
extern fn void end_table() @extern("igEndTable");
extern fn void end_tooltip() @extern("igEndTooltip");
extern fn void error_check_end_frame_finalize_error_tooltip() @extern("igErrorCheckEndFrameFinalizeErrorTooltip");
extern fn void error_check_using_set_cursor_pos_to_extend_parent_boundaries() @extern("igErrorCheckUsingSetCursorPosToExtendParentBoundaries");
extern fn bool error_log(ZString msg) @extern("igErrorLog");
extern fn void error_recovery_store_state(ImGuiErrorRecoveryState* state_out) @extern("igErrorRecoveryStoreState");
extern fn void error_recovery_try_to_recover_state(ImGuiErrorRecoveryState* state_in) @extern("igErrorRecoveryTryToRecoverState");
extern fn void error_recovery_try_to_recover_window_state(ImGuiErrorRecoveryState* state_in) @extern("igErrorRecoveryTryToRecoverWindowState");
extern fn void find_best_window_pos_for_popup(ImVec2* p_out, ImGuiWindow* window) @extern("igFindBestWindowPosForPopup");
extern fn void find_best_window_pos_for_popup_ex(ImVec2* p_out, ImVec2 ref_pos, ImVec2 size, ImGuiDir* last_dir, ImRect r_outer, ImRect r_avoid, ImGuiPopupPositionPolicy policy) @extern("igFindBestWindowPosForPopupEx");
extern fn ImGuiWindow* find_blocking_modal(ImGuiWindow* window) @extern("igFindBlockingModal");
extern fn ImGuiWindow* find_bottom_most_visible_window_within_begin_stack(ImGuiWindow* window) @extern("igFindBottomMostVisibleWindowWithinBeginStack");
extern fn ImGuiViewportP* find_hovered_viewport_from_platform_window_stack(ImVec2 mouse_platform_pos) @extern("igFindHoveredViewportFromPlatformWindowStack");
extern fn void find_hovered_window_ex(ImVec2 pos, bool find_first_and_in_any_viewport, ImGuiWindow** out_hovered_window, ImGuiWindow** out_hovered_window_under_moving_window) @extern("igFindHoveredWindowEx");
extern fn ImGuiOldColumns* find_or_create_columns(ImGuiWindow* window, ImGuiID id) @extern("igFindOrCreateColumns");
extern fn ZString find_rendered_text_end(ZString text, ZString text_end = null) @extern("igFindRenderedTextEnd");
extern fn ImGuiSettingsHandler* find_settings_handler(ZString type_name) @extern("igFindSettingsHandler");
extern fn ImGuiViewport* find_viewport_by_id(ImGuiID id) @extern("igFindViewportByID");
extern fn ImGuiViewport* find_viewport_by_platform_handle(void* platform_handle) @extern("igFindViewportByPlatformHandle");
extern fn ImGuiWindow* find_window_by_id(ImGuiID id) @extern("igFindWindowByID");
extern fn ImGuiWindow* find_window_by_name(ZString name) @extern("igFindWindowByName");
extern fn CInt find_window_display_index(ImGuiWindow* window) @extern("igFindWindowDisplayIndex");
extern fn ImGuiWindowSettings* find_window_settings_by_id(ImGuiID id) @extern("igFindWindowSettingsByID");
extern fn ImGuiWindowSettings* find_window_settings_by_window(ImGuiWindow* window) @extern("igFindWindowSettingsByWindow");
extern fn ImGuiKeyChord fixup_key_chord(ImGuiKeyChord key_chord) @extern("igFixupKeyChord");
extern fn void focus_item() @extern("igFocusItem");
extern fn void focus_top_most_window_under_one(ImGuiWindow* under_this_window, ImGuiWindow* ignore_window, ImGuiViewport* filter_viewport, ImGuiFocusRequestFlags flags) @extern("igFocusTopMostWindowUnderOne");
extern fn void focus_window(ImGuiWindow* window, ImGuiFocusRequestFlags flags = 0) @extern("igFocusWindow");
extern fn void gc_awake_transient_window_buffers(ImGuiWindow* window) @extern("igGcAwakeTransientWindowBuffers");
extern fn void gc_compact_transient_misc_buffers() @extern("igGcCompactTransientMiscBuffers");
extern fn void gc_compact_transient_window_buffers(ImGuiWindow* window) @extern("igGcCompactTransientWindowBuffers");
extern fn ImGuiID get_active_id() @extern("igGetActiveID");
extern fn void get_allocator_functions(ImGuiMemAllocFunc* p_alloc_func, ImGuiMemFreeFunc* p_free_func, void** p_user_data) @extern("igGetAllocatorFunctions");
extern fn ImDrawList* get_background_draw_list(ImGuiViewport* viewport = null) @extern("igGetBackgroundDrawList");
extern fn ImGuiBoxSelectState* get_box_select_state(ImGuiID id) @extern("igGetBoxSelectState");
extern fn ZString get_clipboard_text() @extern("igGetClipboardText");
extern fn ImU32 get_color_u32_col(ImGuiCol idx, float alpha_mul = 1.0f) @extern("igGetColorU32_Col");
extern fn ImU32 get_color_u32_vec4(ImVec4 col) @extern("igGetColorU32_Vec4");
extern fn ImU32 get_color_u32_u32(ImU32 col, float alpha_mul = 1.0f) @extern("igGetColorU32_U32");
extern fn CInt get_column_index() @extern("igGetColumnIndex");
extern fn float get_column_norm_from_offset(ImGuiOldColumns* columns, float offset) @extern("igGetColumnNormFromOffset");
extern fn float get_column_offset(CInt column_index = -1) @extern("igGetColumnOffset");
extern fn float get_column_offset_from_norm(ImGuiOldColumns* columns, float offset_norm) @extern("igGetColumnOffsetFromNorm");
extern fn float get_column_width(CInt column_index = -1) @extern("igGetColumnWidth");
extern fn CInt get_columns_count() @extern("igGetColumnsCount");
extern fn ImGuiID get_columns_id(ZString str_id, CInt count) @extern("igGetColumnsID");
extern fn void get_content_region_avail(ImVec2* p_out) @extern("igGetContentRegionAvail");
extern fn ImGuiContext* get_current_context() @extern("igGetCurrentContext");
extern fn ImGuiID get_current_focus_scope() @extern("igGetCurrentFocusScope");
extern fn ImGuiTabBar* get_current_tab_bar() @extern("igGetCurrentTabBar");
extern fn ImGuiTable* get_current_table() @extern("igGetCurrentTable");
extern fn ImGuiWindow* get_current_window() @extern("igGetCurrentWindow");
extern fn ImGuiWindow* get_current_window_read() @extern("igGetCurrentWindowRead");
extern fn void get_cursor_pos(ImVec2* p_out) @extern("igGetCursorPos");
extern fn float get_cursor_pos_x() @extern("igGetCursorPosX");
extern fn float get_cursor_pos_y() @extern("igGetCursorPosY");
extern fn void get_cursor_screen_pos(ImVec2* p_out) @extern("igGetCursorScreenPos");
extern fn void get_cursor_start_pos(ImVec2* p_out) @extern("igGetCursorStartPos");
extern fn ImFont* get_default_font() @extern("igGetDefaultFont");
extern fn ImGuiPayload* get_drag_drop_payload() @extern("igGetDragDropPayload");
extern fn ImDrawData* get_draw_data() @extern("igGetDrawData");
extern fn ImDrawListSharedData* get_draw_list_shared_data() @extern("igGetDrawListSharedData");
extern fn ImGuiID get_focus_id() @extern("igGetFocusID");
extern fn ImFont* get_font() @extern("igGetFont");
extern fn float get_font_size() @extern("igGetFontSize");
extern fn void get_font_tex_uv_white_pixel(ImVec2* p_out) @extern("igGetFontTexUvWhitePixel");
extern fn ImDrawList* get_foreground_draw_list_viewport_ptr(ImGuiViewport* viewport = null) @extern("igGetForegroundDrawList_ViewportPtr");
extern fn ImDrawList* get_foreground_draw_list_window_ptr(ImGuiWindow* window) @extern("igGetForegroundDrawList_WindowPtr");
extern fn CInt get_frame_count() @extern("igGetFrameCount");
extern fn float get_frame_height() @extern("igGetFrameHeight");
extern fn float get_frame_height_with_spacing() @extern("igGetFrameHeightWithSpacing");
extern fn ImGuiID get_hovered_id() @extern("igGetHoveredID");
extern fn ImGuiID get_idstr(ZString str_id) @extern("igGetID_Str");
extern fn ImGuiID get_idstr_str(ZString str_id_begin, ZString str_id_end) @extern("igGetID_StrStr");
extern fn ImGuiID get_idptr(void* ptr_id) @extern("igGetID_Ptr");
extern fn ImGuiID get_idint(CInt int_id) @extern("igGetID_Int");
extern fn ImGuiID get_idwith_seed_str(ZString str_id_begin, ZString str_id_end, ImGuiID seed) @extern("igGetIDWithSeed_Str");
extern fn ImGuiID get_idwith_seed_int(CInt n, ImGuiID seed) @extern("igGetIDWithSeed_Int");
extern fn ImGuiIO* get_io() @extern("igGetIO");
extern fn ImGuiIO* get_ioex(ImGuiContext* ctx) @extern("igGetIOEx");
extern fn ImGuiInputTextState* get_input_text_state(ImGuiID id) @extern("igGetInputTextState");
extern fn ImGuiItemFlags get_item_flags() @extern("igGetItemFlags");
extern fn ImGuiID get_item_id() @extern("igGetItemID");
extern fn void get_item_rect_max(ImVec2* p_out) @extern("igGetItemRectMax");
extern fn void get_item_rect_min(ImVec2* p_out) @extern("igGetItemRectMin");
extern fn void get_item_rect_size(ImVec2* p_out) @extern("igGetItemRectSize");
extern fn ImGuiItemStatusFlags get_item_status_flags() @extern("igGetItemStatusFlags");
extern fn ZString get_key_chord_name(ImGuiKeyChord key_chord) @extern("igGetKeyChordName");
extern fn ImGuiKeyData* get_key_data_context_ptr(ImGuiContext* ctx, ImGuiKey key) @extern("igGetKeyData_ContextPtr");
extern fn ImGuiKeyData* get_key_data_key(ImGuiKey key) @extern("igGetKeyData_Key");
extern fn void get_key_magnitude2d(ImVec2* p_out, ImGuiKey key_left, ImGuiKey key_right, ImGuiKey key_up, ImGuiKey key_down) @extern("igGetKeyMagnitude2d");
extern fn ZString get_key_name(ImGuiKey key) @extern("igGetKeyName");
extern fn ImGuiID get_key_owner(ImGuiKey key) @extern("igGetKeyOwner");
extern fn ImGuiKeyOwnerData* get_key_owner_data(ImGuiContext* ctx, ImGuiKey key) @extern("igGetKeyOwnerData");
extern fn CInt get_key_pressed_amount(ImGuiKey key, float repeat_delay, float rate) @extern("igGetKeyPressedAmount");
extern fn ImGuiViewport* get_main_viewport() @extern("igGetMainViewport");
extern fn CInt get_mouse_clicked_count(ImGuiMouseButton button) @extern("igGetMouseClickedCount");
extern fn ImGuiMouseCursor get_mouse_cursor() @extern("igGetMouseCursor");
extern fn void get_mouse_drag_delta(ImVec2* p_out, ImGuiMouseButton button = 0, float lock_threshold = -1.0f) @extern("igGetMouseDragDelta");
extern fn void get_mouse_pos(ImVec2* p_out) @extern("igGetMousePos");
extern fn void get_mouse_pos_on_opening_current_popup(ImVec2* p_out) @extern("igGetMousePosOnOpeningCurrentPopup");
extern fn ImGuiMultiSelectState* get_multi_select_state(ImGuiID id) @extern("igGetMultiSelectState");
extern fn float get_nav_tweak_pressed_amount(ImGuiAxis axis) @extern("igGetNavTweakPressedAmount");
extern fn ImGuiPlatformIO* get_platform_io() @extern("igGetPlatformIO");
extern fn void get_popup_allowed_extent_rect(ImRect* p_out, ImGuiWindow* window) @extern("igGetPopupAllowedExtentRect");
extern fn float get_scroll_max_x() @extern("igGetScrollMaxX");
extern fn float get_scroll_max_y() @extern("igGetScrollMaxY");
extern fn float get_scroll_x() @extern("igGetScrollX");
extern fn float get_scroll_y() @extern("igGetScrollY");
extern fn ImGuiKeyRoutingData* get_shortcut_routing_data(ImGuiKeyChord key_chord) @extern("igGetShortcutRoutingData");
extern fn ImGuiStorage* get_state_storage() @extern("igGetStateStorage");
extern fn ImGuiStyle* get_style() @extern("igGetStyle");
extern fn ZString get_style_color_name(ImGuiCol idx) @extern("igGetStyleColorName");
extern fn ImVec4* get_style_color_vec4(ImGuiCol idx) @extern("igGetStyleColorVec4");
extern fn ImGuiDataVarInfo* get_style_var_info(ImGuiStyleVar idx) @extern("igGetStyleVarInfo");
extern fn float get_text_line_height() @extern("igGetTextLineHeight");
extern fn float get_text_line_height_with_spacing() @extern("igGetTextLineHeightWithSpacing");
extern fn double get_time() @extern("igGetTime");
extern fn ImGuiWindow* get_top_most_and_visible_popup_modal() @extern("igGetTopMostAndVisiblePopupModal");
extern fn ImGuiWindow* get_top_most_popup_modal() @extern("igGetTopMostPopupModal");
extern fn float get_tree_node_to_label_spacing() @extern("igGetTreeNodeToLabelSpacing");
extern fn void get_typematic_repeat_rate(ImGuiInputFlags flags, float* repeat_delay, float* repeat_rate) @extern("igGetTypematicRepeatRate");
extern fn ImGuiTypingSelectRequest* get_typing_select_request(ImGuiTypingSelectFlags flags = typing_select_flags::NONE) @extern("igGetTypingSelectRequest");
extern fn ZString get_version() @extern("igGetVersion");
extern fn ImGuiPlatformMonitor* get_viewport_platform_monitor(ImGuiViewport* viewport) @extern("igGetViewportPlatformMonitor");
extern fn bool get_window_always_want_own_tab_bar(ImGuiWindow* window) @extern("igGetWindowAlwaysWantOwnTabBar");
extern fn ImGuiID get_window_dock_id() @extern("igGetWindowDockID");
extern fn ImGuiDockNode* get_window_dock_node() @extern("igGetWindowDockNode");
extern fn float get_window_dpi_scale() @extern("igGetWindowDpiScale");
extern fn ImDrawList* get_window_draw_list() @extern("igGetWindowDrawList");
extern fn float get_window_height() @extern("igGetWindowHeight");
extern fn void get_window_pos(ImVec2* p_out) @extern("igGetWindowPos");
extern fn ImGuiID get_window_resize_border_id(ImGuiWindow* window, ImGuiDir dir) @extern("igGetWindowResizeBorderID");
extern fn ImGuiID get_window_resize_corner_id(ImGuiWindow* window, CInt n) @extern("igGetWindowResizeCornerID");
extern fn ImGuiID get_window_scrollbar_id(ImGuiWindow* window, ImGuiAxis axis) @extern("igGetWindowScrollbarID");
extern fn void get_window_scrollbar_rect(ImRect* p_out, ImGuiWindow* window, ImGuiAxis axis) @extern("igGetWindowScrollbarRect");
extern fn void get_window_size(ImVec2* p_out) @extern("igGetWindowSize");
extern fn ImGuiViewport* get_window_viewport() @extern("igGetWindowViewport");
extern fn float get_window_width() @extern("igGetWindowWidth");
extern fn CInt im_abs_int(CInt x) @extern("igImAbs_Int");
extern fn float im_abs_float(float x) @extern("igImAbs_Float");
extern fn double im_abs_double(double x) @extern("igImAbs_double");
extern fn ImU32 im_alpha_blend_colors(ImU32 col_a, ImU32 col_b) @extern("igImAlphaBlendColors");
extern fn void im_bezier_cubic_calc(ImVec2* p_out, ImVec2 p1, ImVec2 p2, ImVec2 p3, ImVec2 p4, float t) @extern("igImBezierCubicCalc");
extern fn void im_bezier_cubic_closest_point(ImVec2* p_out, ImVec2 p1, ImVec2 p2, ImVec2 p3, ImVec2 p4, ImVec2 p, CInt num_segments) @extern("igImBezierCubicClosestPoint");
extern fn void im_bezier_cubic_closest_point_casteljau(ImVec2* p_out, ImVec2 p1, ImVec2 p2, ImVec2 p3, ImVec2 p4, ImVec2 p, float tess_tol) @extern("igImBezierCubicClosestPointCasteljau");
extern fn void im_bezier_quadratic_calc(ImVec2* p_out, ImVec2 p1, ImVec2 p2, ImVec2 p3, float t) @extern("igImBezierQuadraticCalc");
extern fn void im_bit_array_clear_all_bits(ImU32* arr, CInt bitcount) @extern("igImBitArrayClearAllBits");
extern fn void im_bit_array_clear_bit(ImU32* arr, CInt n) @extern("igImBitArrayClearBit");
extern fn usz im_bit_array_get_storage_size_in_bytes(CInt bitcount) @extern("igImBitArrayGetStorageSizeInBytes");
extern fn void im_bit_array_set_bit(ImU32* arr, CInt n) @extern("igImBitArraySetBit");
extern fn void im_bit_array_set_bit_range(ImU32* arr, CInt n, CInt n2) @extern("igImBitArraySetBitRange");
extern fn bool im_bit_array_test_bit(ImU32* arr, CInt n) @extern("igImBitArrayTestBit");
extern fn bool im_char_is_blank_a(char c) @extern("igImCharIsBlankA");
extern fn bool im_char_is_blank_w(CUInt c) @extern("igImCharIsBlankW");
extern fn bool im_char_is_xdigit_a(char c) @extern("igImCharIsXdigitA");
extern fn void im_clamp(ImVec2* p_out, ImVec2 v, ImVec2 mn, ImVec2 mx) @extern("igImClamp");
extern fn float im_dot(ImVec2 a, ImVec2 b) @extern("igImDot");
extern fn float im_exponential_moving_average(float avg, float sample, CInt n) @extern("igImExponentialMovingAverage");
extern fn bool im_file_close(ImFileHandle file) @extern("igImFileClose");
extern fn ImU64 im_file_get_size(ImFileHandle file) @extern("igImFileGetSize");
extern fn void* im_file_load_to_memory(ZString filename, ZString mode, usz* out_file_size = null, CInt padding_bytes = 0) @extern("igImFileLoadToMemory");
extern fn ImFileHandle im_file_open(ZString filename, ZString mode) @extern("igImFileOpen");
extern fn ImU64 im_file_read(void* data, ImU64 size, ImU64 count, ImFileHandle file) @extern("igImFileRead");
extern fn ImU64 im_file_write(void* data, ImU64 size, ImU64 count, ImFileHandle file) @extern("igImFileWrite");
extern fn float im_floor_float(float f) @extern("igImFloor_Float");
extern fn void im_floor_vec2(ImVec2* p_out, ImVec2 v) @extern("igImFloor_Vec2");
extern fn void im_font_atlas_build_finish(ImFontAtlas* atlas) @extern("igImFontAtlasBuildFinish");
extern fn void im_font_atlas_build_init(ImFontAtlas* atlas) @extern("igImFontAtlasBuildInit");
extern fn void im_font_atlas_build_multiply_calc_lookup_table(char[256]* out_table, float in_multiply_factor) @extern("igImFontAtlasBuildMultiplyCalcLookupTable");
extern fn void im_font_atlas_build_multiply_rect_alpha8(char[256]* table, char* pixels, CInt x, CInt y, CInt w, CInt h, CInt stride) @extern("igImFontAtlasBuildMultiplyRectAlpha8");
extern fn void im_font_atlas_build_pack_custom_rects(ImFontAtlas* atlas, void* stbrp_context_opaque) @extern("igImFontAtlasBuildPackCustomRects");
extern fn void im_font_atlas_build_render32bpp_rect_from_string(ImFontAtlas* atlas, CInt x, CInt y, CInt w, CInt h, ZString in_str, char in_marker_char, CUInt in_marker_pixel_value) @extern("igImFontAtlasBuildRender32bppRectFromString");
extern fn void im_font_atlas_build_render8bpp_rect_from_string(ImFontAtlas* atlas, CInt x, CInt y, CInt w, CInt h, ZString in_str, char in_marker_char, char in_marker_pixel_value) @extern("igImFontAtlasBuildRender8bppRectFromString");
extern fn void im_font_atlas_build_setup_font(ImFontAtlas* atlas, ImFont* font, ImFontConfig* font_config, float ascent, float descent) @extern("igImFontAtlasBuildSetupFont");
extern fn ImFontBuilderIO* im_font_atlas_get_builder_for_stb_truetype() @extern("igImFontAtlasGetBuilderForStbTruetype");
extern fn void im_font_atlas_update_config_data_pointers(ImFontAtlas* atlas) @extern("igImFontAtlasUpdateConfigDataPointers");
extern fn CInt im_format_string(ZString buf, usz buf_size, ZString fmt, ...) @extern("igImFormatString");
extern fn void im_format_string_to_temp_buffer(char** out_buf, char** out_buf_end, ZString fmt, ...) @extern("igImFormatStringToTempBuffer");
extern fn ImGuiID im_hash_data(void* data, usz data_size, ImGuiID seed = 0) @extern("igImHashData");
extern fn ImGuiID im_hash_str(ZString data, usz data_size = 0, ImGuiID seed = 0) @extern("igImHashStr");
extern fn float im_inv_length(ImVec2 lhs, float fail_value) @extern("igImInvLength");
extern fn bool im_is_float_above_guaranteed_integer_precision(float f) @extern("igImIsFloatAboveGuaranteedIntegerPrecision");
extern fn bool im_is_power_of_two_int(CInt v) @extern("igImIsPowerOfTwo_Int");
extern fn bool im_is_power_of_two_u64(ImU64 v) @extern("igImIsPowerOfTwo_U64");
extern fn float im_length_sqr_vec2(ImVec2 lhs) @extern("igImLengthSqr_Vec2");
extern fn float im_length_sqr_vec4(ImVec4 lhs) @extern("igImLengthSqr_Vec4");
extern fn void im_lerp_vec2_float(ImVec2* p_out, ImVec2 a, ImVec2 b, float t) @extern("igImLerp_Vec2Float");
extern fn void im_lerp_vec2_vec2(ImVec2* p_out, ImVec2 a, ImVec2 b, ImVec2 t) @extern("igImLerp_Vec2Vec2");
extern fn void im_lerp_vec4(ImVec4* p_out, ImVec4 a, ImVec4 b, float t) @extern("igImLerp_Vec4");
extern fn void im_line_closest_point(ImVec2* p_out, ImVec2 a, ImVec2 b, ImVec2 p) @extern("igImLineClosestPoint");
extern fn float im_linear_remap_clamp(float s0, float s1, float d0, float d1, float x) @extern("igImLinearRemapClamp");
extern fn float im_linear_sweep(float current, float target, float speed) @extern("igImLinearSweep");
extern fn float im_log_float(float x) @extern("igImLog_Float");
extern fn double im_log_double(double x) @extern("igImLog_double");
extern fn ImGuiStoragePair* im_lower_bound(ImGuiStoragePair* in_begin, ImGuiStoragePair* in_end, ImGuiID key) @extern("igImLowerBound");
extern fn void im_max(ImVec2* p_out, ImVec2 lhs, ImVec2 rhs) @extern("igImMax");
extern fn void im_min(ImVec2* p_out, ImVec2 lhs, ImVec2 rhs) @extern("igImMin");
extern fn CInt im_mod_positive(CInt a, CInt b) @extern("igImModPositive");
extern fn void im_mul(ImVec2* p_out, ImVec2 lhs, ImVec2 rhs) @extern("igImMul");
extern fn ZString im_parse_format_find_end(ZString format) @extern("igImParseFormatFindEnd");
extern fn ZString im_parse_format_find_start(ZString format) @extern("igImParseFormatFindStart");
extern fn CInt im_parse_format_precision(ZString format, CInt default_value) @extern("igImParseFormatPrecision");
extern fn void im_parse_format_sanitize_for_printing(ZString fmt_in, ZString fmt_out, usz fmt_out_size) @extern("igImParseFormatSanitizeForPrinting");
extern fn ZString im_parse_format_sanitize_for_scanning(ZString fmt_in, ZString fmt_out, usz fmt_out_size) @extern("igImParseFormatSanitizeForScanning");
extern fn ZString im_parse_format_trim_decorations(ZString format, ZString buf, usz buf_size) @extern("igImParseFormatTrimDecorations");
extern fn float im_pow_float(float x, float y) @extern("igImPow_Float");
extern fn double im_pow_double(double x, double y) @extern("igImPow_double");
extern fn void im_qsort(void* base, usz count, usz size_of_element, CompareFn compare_func) @extern("igImQsort");
extern fn void im_rotate(ImVec2* p_out, ImVec2 v, float cos_a, float sin_a) @extern("igImRotate");
extern fn float im_rsqrt_float(float x) @extern("igImRsqrt_Float");
extern fn double im_rsqrt_double(double x) @extern("igImRsqrt_double");
extern fn float im_saturate(float f) @extern("igImSaturate");
extern fn float im_sign_float(float x) @extern("igImSign_Float");
extern fn double im_sign_double(double x) @extern("igImSign_double");
extern fn ZString im_str_skip_blank(ZString str) @extern("igImStrSkipBlank");
extern fn void im_str_trim_blanks(ZString str) @extern("igImStrTrimBlanks");
extern fn ZString im_strbol(ZString buf_mid_line, ZString buf_begin) @extern("igImStrbol");
extern fn ZString im_strchr_range(ZString str_begin, ZString str_end, char c) @extern("igImStrchrRange");
extern fn ZString im_strdup(ZString str) @extern("igImStrdup");
extern fn ZString im_strdupcpy(ZString dst, usz* p_dst_size, ZString str) @extern("igImStrdupcpy");
extern fn ZString im_streol_range(ZString str, ZString str_end) @extern("igImStreolRange");
extern fn CInt im_stricmp(ZString str1, ZString str2) @extern("igImStricmp");
extern fn ZString im_stristr(ZString haystack, ZString haystack_end, ZString needle, ZString needle_end) @extern("igImStristr");
extern fn CInt im_strlen_w(ImWchar* str) @extern("igImStrlenW");
extern fn void im_strncpy(ZString dst, ZString src, usz count) @extern("igImStrncpy");
extern fn CInt im_strnicmp(ZString str1, ZString str2, usz count) @extern("igImStrnicmp");
extern fn CInt im_text_char_from_utf8(CUInt* out_char, ZString in_text, ZString in_text_end) @extern("igImTextCharFromUtf8");
extern fn ZString im_text_char_to_utf8(char[5]* out_buf, CUInt c) @extern("igImTextCharToUtf8");
extern fn CInt im_text_count_chars_from_utf8(ZString in_text, ZString in_text_end) @extern("igImTextCountCharsFromUtf8");
extern fn CInt im_text_count_lines(ZString in_text, ZString in_text_end) @extern("igImTextCountLines");
extern fn CInt im_text_count_utf8_bytes_from_char(ZString in_text, ZString in_text_end) @extern("igImTextCountUtf8BytesFromChar");
extern fn CInt im_text_count_utf8_bytes_from_str(ImWchar* in_text, ImWchar* in_text_end) @extern("igImTextCountUtf8BytesFromStr");
extern fn ZString im_text_find_previous_utf8_codepoint(ZString in_text_start, ZString in_text_curr) @extern("igImTextFindPreviousUtf8Codepoint");
extern fn CInt im_text_str_from_utf8(ImWchar* out_buf, CInt out_buf_size, ZString in_text, ZString in_text_end, char** in_remaining = null) @extern("igImTextStrFromUtf8");
extern fn CInt im_text_str_to_utf8(ZString out_buf, CInt out_buf_size, ImWchar* in_text, ImWchar* in_text_end) @extern("igImTextStrToUtf8");
extern fn char im_to_upper(char c) @extern("igImToUpper");
extern fn float im_triangle_area(ImVec2 a, ImVec2 b, ImVec2 c) @extern("igImTriangleArea");
extern fn void im_triangle_barycentric_coords(ImVec2 a, ImVec2 b, ImVec2 c, ImVec2 p, float* out_u, float* out_v, float* out_w) @extern("igImTriangleBarycentricCoords");
extern fn void im_triangle_closest_point(ImVec2* p_out, ImVec2 a, ImVec2 b, ImVec2 c, ImVec2 p) @extern("igImTriangleClosestPoint");
extern fn bool im_triangle_contains_point(ImVec2 a, ImVec2 b, ImVec2 c, ImVec2 p) @extern("igImTriangleContainsPoint");
extern fn bool im_triangle_is_clockwise(ImVec2 a, ImVec2 b, ImVec2 c) @extern("igImTriangleIsClockwise");
extern fn float im_trunc_float(float f) @extern("igImTrunc_Float");
extern fn void im_trunc_vec2(ImVec2* p_out, ImVec2 v) @extern("igImTrunc_Vec2");
extern fn CInt im_upper_power_of_two(CInt v) @extern("igImUpperPowerOfTwo");
extern fn void image(ImTextureID user_texture_id, ImVec2 image_size, ImVec2 uv0 = {}, ImVec2 uv1 = {1, 1}, ImVec4 tint_col = {1, 1, 1, 1}, ImVec4 border_col = {}) @extern("igImage");
extern fn bool image_button(ZString str_id, ImTextureID user_texture_id, ImVec2 image_size, ImVec2 uv0 = {}, ImVec2 uv1 = {1, 1}, ImVec4 bg_col = {}, ImVec4 tint_col = {1, 1, 1, 1}) @extern("igImageButton");
extern fn bool image_button_ex(ImGuiID id, ImTextureID texture_id, ImVec2 image_size, ImVec2 uv0, ImVec2 uv1, ImVec4 bg_col, ImVec4 tint_col, ImGuiButtonFlags flags = 0) @extern("igImageButtonEx");
extern fn void indent(float indent_w = 0.0f) @extern("igIndent");
extern fn void initialize() @extern("igInitialize");
extern fn bool input_double(ZString label, double* v, double step = 0.0, double step_fast = 0.0, ZString format = "%.6f", ImGuiInputTextFlags flags = 0) @extern("igInputDouble");
extern fn bool input_float(ZString label, float* v, float step = 0.0f, float step_fast = 0.0f, ZString format = "%.3f", ImGuiInputTextFlags flags = 0) @extern("igInputFloat");
extern fn bool input_float2(ZString label, float[2]* v, ZString format = "%.3f", ImGuiInputTextFlags flags = 0) @extern("igInputFloat2");
extern fn bool input_float3(ZString label, float[3]* v, ZString format = "%.3f", ImGuiInputTextFlags flags = 0) @extern("igInputFloat3");
extern fn bool input_float4(ZString label, float[4]* v, ZString format = "%.3f", ImGuiInputTextFlags flags = 0) @extern("igInputFloat4");
extern fn bool input_int(ZString label, CInt* v, CInt step = 1, CInt step_fast = 100, ImGuiInputTextFlags flags = 0) @extern("igInputInt");
extern fn bool input_int2(ZString label, CInt[2]* v, ImGuiInputTextFlags flags = 0) @extern("igInputInt2");
extern fn bool input_int3(ZString label, CInt[3]* v, ImGuiInputTextFlags flags = 0) @extern("igInputInt3");
extern fn bool input_int4(ZString label, CInt[4]* v, ImGuiInputTextFlags flags = 0) @extern("igInputInt4");
extern fn bool input_scalar(ZString label, ImGuiDataType data_type, void* p_data, void* p_step = null, void* p_step_fast = null, ZString format = null, ImGuiInputTextFlags flags = 0) @extern("igInputScalar");
extern fn bool input_scalar_n(ZString label, ImGuiDataType data_type, void* p_data, CInt components, void* p_step = null, void* p_step_fast = null, ZString format = null, ImGuiInputTextFlags flags = 0) @extern("igInputScalarN");
extern fn bool input_text(ZString label, ZString buf, usz buf_size, ImGuiInputTextFlags flags = 0, ImGuiInputTextCallback callback = null, void* user_data = null) @extern("igInputText");
extern fn void input_text_deactivate_hook(ImGuiID id) @extern("igInputTextDeactivateHook");
extern fn bool input_text_ex(ZString label, ZString hint, ZString buf, CInt buf_size, ImVec2 size_arg, ImGuiInputTextFlags flags, ImGuiInputTextCallback callback = null, void* user_data = null) @extern("igInputTextEx");
extern fn bool input_text_multiline(ZString label, ZString buf, usz buf_size, ImVec2 size = {}, ImGuiInputTextFlags flags = 0, ImGuiInputTextCallback callback = null, void* user_data = null) @extern("igInputTextMultiline");
extern fn bool input_text_with_hint(ZString label, ZString hint, ZString buf, usz buf_size, ImGuiInputTextFlags flags = 0, ImGuiInputTextCallback callback = null, void* user_data = null) @extern("igInputTextWithHint");
extern fn bool invisible_button(ZString str_id, ImVec2 size, ImGuiButtonFlags flags = 0) @extern("igInvisibleButton");
extern fn bool is_active_id_using_nav_dir(ImGuiDir dir) @extern("igIsActiveIdUsingNavDir");
extern fn bool is_alias_key(ImGuiKey key) @extern("igIsAliasKey");
extern fn bool is_any_item_active() @extern("igIsAnyItemActive");
extern fn bool is_any_item_focused() @extern("igIsAnyItemFocused");
extern fn bool is_any_item_hovered() @extern("igIsAnyItemHovered");
extern fn bool is_any_mouse_down() @extern("igIsAnyMouseDown");
extern fn bool is_clipped_ex(ImRect bb, ImGuiID id) @extern("igIsClippedEx");
extern fn bool is_drag_drop_active() @extern("igIsDragDropActive");
extern fn bool is_drag_drop_payload_being_accepted() @extern("igIsDragDropPayloadBeingAccepted");
extern fn bool is_gamepad_key(ImGuiKey key) @extern("igIsGamepadKey");
extern fn bool is_item_activated() @extern("igIsItemActivated");
extern fn bool is_item_active() @extern("igIsItemActive");
extern fn bool is_item_clicked(ImGuiMouseButton mouse_button = 0) @extern("igIsItemClicked");
extern fn bool is_item_deactivated() @extern("igIsItemDeactivated");
extern fn bool is_item_deactivated_after_edit() @extern("igIsItemDeactivatedAfterEdit");
extern fn bool is_item_edited() @extern("igIsItemEdited");
extern fn bool is_item_focused() @extern("igIsItemFocused");
extern fn bool is_item_hovered(ImGuiHoveredFlags flags = 0) @extern("igIsItemHovered");
extern fn bool is_item_toggled_open() @extern("igIsItemToggledOpen");
extern fn bool is_item_toggled_selection() @extern("igIsItemToggledSelection");
extern fn bool is_item_visible() @extern("igIsItemVisible");
extern fn bool is_key_chord_pressed_nil(ImGuiKeyChord key_chord) @extern("igIsKeyChordPressed_Nil");
extern fn bool is_key_chord_pressed_input_flags(ImGuiKeyChord key_chord, ImGuiInputFlags flags, ImGuiID owner_id = 0) @extern("igIsKeyChordPressed_InputFlags");
extern fn bool is_key_down_nil(ImGuiKey key) @extern("igIsKeyDown_Nil");
extern fn bool is_key_down_id(ImGuiKey key, ImGuiID owner_id) @extern("igIsKeyDown_ID");
extern fn bool is_key_pressed_bool(ImGuiKey key, bool repeat = true) @extern("igIsKeyPressed_Bool");
extern fn bool is_key_pressed_input_flags(ImGuiKey key, ImGuiInputFlags flags, ImGuiID owner_id = 0) @extern("igIsKeyPressed_InputFlags");
extern fn bool is_key_released_nil(ImGuiKey key) @extern("igIsKeyReleased_Nil");
extern fn bool is_key_released_id(ImGuiKey key, ImGuiID owner_id) @extern("igIsKeyReleased_ID");
extern fn bool is_keyboard_key(ImGuiKey key) @extern("igIsKeyboardKey");
extern fn bool is_lrmod_key(ImGuiKey key) @extern("igIsLRModKey");
extern fn bool is_legacy_key(ImGuiKey key) @extern("igIsLegacyKey");
extern fn bool is_mouse_clicked_bool(ImGuiMouseButton button, bool repeat = false) @extern("igIsMouseClicked_Bool");
extern fn bool is_mouse_clicked_input_flags(ImGuiMouseButton button, ImGuiInputFlags flags, ImGuiID owner_id = 0) @extern("igIsMouseClicked_InputFlags");
extern fn bool is_mouse_double_clicked_nil(ImGuiMouseButton button) @extern("igIsMouseDoubleClicked_Nil");
extern fn bool is_mouse_double_clicked_id(ImGuiMouseButton button, ImGuiID owner_id) @extern("igIsMouseDoubleClicked_ID");
extern fn bool is_mouse_down_nil(ImGuiMouseButton button) @extern("igIsMouseDown_Nil");
extern fn bool is_mouse_down_id(ImGuiMouseButton button, ImGuiID owner_id) @extern("igIsMouseDown_ID");
extern fn bool is_mouse_drag_past_threshold(ImGuiMouseButton button, float lock_threshold = -1.0f) @extern("igIsMouseDragPastThreshold");
extern fn bool is_mouse_dragging(ImGuiMouseButton button, float lock_threshold = -1.0f) @extern("igIsMouseDragging");
extern fn bool is_mouse_hovering_rect(ImVec2 r_min, ImVec2 r_max, bool clip = true) @extern("igIsMouseHoveringRect");
extern fn bool is_mouse_key(ImGuiKey key) @extern("igIsMouseKey");
extern fn bool is_mouse_pos_valid(ImVec2* mouse_pos = null) @extern("igIsMousePosValid");
extern fn bool is_mouse_released_nil(ImGuiMouseButton button) @extern("igIsMouseReleased_Nil");
extern fn bool is_mouse_released_id(ImGuiMouseButton button, ImGuiID owner_id) @extern("igIsMouseReleased_ID");
extern fn bool is_named_key(ImGuiKey key) @extern("igIsNamedKey");
extern fn bool is_named_key_or_mod(ImGuiKey key) @extern("igIsNamedKeyOrMod");
extern fn bool is_popup_open_str(ZString str_id, ImGuiPopupFlags flags = 0) @extern("igIsPopupOpen_Str");
extern fn bool is_popup_open_id(ImGuiID id, ImGuiPopupFlags popup_flags) @extern("igIsPopupOpen_ID");
extern fn bool is_rect_visible_nil(ImVec2 size) @extern("igIsRectVisible_Nil");
extern fn bool is_rect_visible_vec2(ImVec2 rect_min, ImVec2 rect_max) @extern("igIsRectVisible_Vec2");
extern fn bool is_window_above(ImGuiWindow* potential_above, ImGuiWindow* potential_below) @extern("igIsWindowAbove");
extern fn bool is_window_appearing() @extern("igIsWindowAppearing");
extern fn bool is_window_child_of(ImGuiWindow* window, ImGuiWindow* potential_parent, bool popup_hierarchy, bool dock_hierarchy) @extern("igIsWindowChildOf");
extern fn bool is_window_collapsed() @extern("igIsWindowCollapsed");
extern fn bool is_window_content_hoverable(ImGuiWindow* window, ImGuiHoveredFlags flags = 0) @extern("igIsWindowContentHoverable");
extern fn bool is_window_docked() @extern("igIsWindowDocked");
extern fn bool is_window_focused(ImGuiFocusedFlags flags = 0) @extern("igIsWindowFocused");
extern fn bool is_window_hovered(ImGuiHoveredFlags flags = 0) @extern("igIsWindowHovered");
extern fn bool is_window_nav_focusable(ImGuiWindow* window) @extern("igIsWindowNavFocusable");
extern fn bool is_window_within_begin_stack_of(ImGuiWindow* window, ImGuiWindow* potential_parent) @extern("igIsWindowWithinBeginStackOf");
extern fn bool item_add(ImRect bb, ImGuiID id, ImRect* nav_bb = null, ImGuiItemFlags extra_flags = 0) @extern("igItemAdd");
extern fn bool item_hoverable(ImRect bb, ImGuiID id, ImGuiItemFlags item_flags) @extern("igItemHoverable");
extern fn void item_size_vec2(ImVec2 size, float text_baseline_y = -1.0f) @extern("igItemSize_Vec2");
extern fn void item_size_rect(ImRect bb, float text_baseline_y = -1.0f) @extern("igItemSize_Rect");
extern fn void keep_alive_id(ImGuiID id) @extern("igKeepAliveID");
extern fn void label_text(ZString label, ZString fmt, ...) @extern("igLabelText");
extern fn bool list_box_str_arr(ZString label, CInt* current_item, ZString* items, CInt items_count, CInt height_in_items = -1) @extern("igListBox_Str_arr");
extern fn bool list_box_fn_str_ptr(ZString label, CInt* current_item, GetZStringByIndexFn getter, void* user_data, CInt items_count, CInt height_in_items = -1) @extern("igListBox_FnStrPtr");
extern fn void load_ini_settings_from_disk(ZString ini_filename) @extern("igLoadIniSettingsFromDisk");
extern fn void load_ini_settings_from_memory(ZString ini_data, usz ini_size = 0) @extern("igLoadIniSettingsFromMemory");
extern fn ZString localize_get_msg(ImGuiLocKey key) @extern("igLocalizeGetMsg");
extern fn void localize_register_entries(ImGuiLocEntry* entries, CInt count) @extern("igLocalizeRegisterEntries");
extern fn void log_begin(ImGuiLogFlags flags, CInt auto_open_depth) @extern("igLogBegin");
extern fn void log_buttons() @extern("igLogButtons");
extern fn void log_finish() @extern("igLogFinish");
extern fn void log_rendered_text(ImVec2* ref_pos, ZString text, ZString text_end = null) @extern("igLogRenderedText");
extern fn void log_set_next_text_decoration(ZString prefix, ZString suffix) @extern("igLogSetNextTextDecoration");
extern fn void log_text(ZString fmt, ...) @extern("igLogText");
extern fn void log_to_buffer(CInt auto_open_depth = -1) @extern("igLogToBuffer");
extern fn void log_to_clipboard(CInt auto_open_depth = -1) @extern("igLogToClipboard");
extern fn void log_to_file(CInt auto_open_depth = -1, ZString filename = null) @extern("igLogToFile");
extern fn void log_to_tty(CInt auto_open_depth = -1) @extern("igLogToTTY");
extern fn void mark_ini_settings_dirty_nil() @extern("igMarkIniSettingsDirty_Nil");
extern fn void mark_ini_settings_dirty_window_ptr(ImGuiWindow* window) @extern("igMarkIniSettingsDirty_WindowPtr");
extern fn void mark_item_edited(ImGuiID id) @extern("igMarkItemEdited");
extern fn void* mem_alloc(usz size) @extern("igMemAlloc");
extern fn void mem_free(void* ptr) @extern("igMemFree");
extern fn bool menu_item_bool(ZString label, ZString shortcut = null, bool selected = false, bool enabled = true) @extern("igMenuItem_Bool");
extern fn bool menu_item_bool_ptr(ZString label, ZString shortcut, bool* p_selected, bool enabled = true) @extern("igMenuItem_BoolPtr");
extern fn bool menu_item_ex(ZString label, ZString icon, ZString shortcut = null, bool selected = false, bool enabled = true) @extern("igMenuItemEx");
extern fn ImGuiKey mouse_button_to_key(ImGuiMouseButton button) @extern("igMouseButtonToKey");
extern fn void multi_select_add_set_all(ImGuiMultiSelectTempData* ms, bool selected) @extern("igMultiSelectAddSetAll");
extern fn void multi_select_add_set_range(ImGuiMultiSelectTempData* ms, bool selected, CInt range_dir, ImGuiSelectionUserData first_item, ImGuiSelectionUserData last_item) @extern("igMultiSelectAddSetRange");
extern fn void multi_select_item_footer(ImGuiID id, bool* p_selected, bool* p_pressed) @extern("igMultiSelectItemFooter");
extern fn void multi_select_item_header(ImGuiID id, bool* p_selected, ImGuiButtonFlags* p_button_flags) @extern("igMultiSelectItemHeader");
extern fn void nav_clear_preferred_pos_for_axis(ImGuiAxis axis) @extern("igNavClearPreferredPosForAxis");
extern fn void nav_highlight_activated(ImGuiID id) @extern("igNavHighlightActivated");
extern fn void nav_init_request_apply_result() @extern("igNavInitRequestApplyResult");
extern fn void nav_init_window(ImGuiWindow* window, bool force_reinit) @extern("igNavInitWindow");
extern fn void nav_move_request_apply_result() @extern("igNavMoveRequestApplyResult");
extern fn bool nav_move_request_but_no_result_yet() @extern("igNavMoveRequestButNoResultYet");
extern fn void nav_move_request_cancel() @extern("igNavMoveRequestCancel");
extern fn void nav_move_request_forward(ImGuiDir move_dir, ImGuiDir clip_dir, ImGuiNavMoveFlags move_flags, ImGuiScrollFlags scroll_flags) @extern("igNavMoveRequestForward");
extern fn void nav_move_request_resolve_with_last_item(ImGuiNavItemData* result) @extern("igNavMoveRequestResolveWithLastItem");
extern fn void nav_move_request_resolve_with_past_tree_node(ImGuiNavItemData* result, ImGuiTreeNodeStackData* tree_node_data) @extern("igNavMoveRequestResolveWithPastTreeNode");
extern fn void nav_move_request_submit(ImGuiDir move_dir, ImGuiDir clip_dir, ImGuiNavMoveFlags move_flags, ImGuiScrollFlags scroll_flags) @extern("igNavMoveRequestSubmit");
extern fn void nav_move_request_try_wrapping(ImGuiWindow* window, ImGuiNavMoveFlags move_flags) @extern("igNavMoveRequestTryWrapping");
extern fn void nav_update_current_window_is_scroll_pushable_x() @extern("igNavUpdateCurrentWindowIsScrollPushableX");
extern fn void new_frame() @extern("igNewFrame");
extern fn void new_line() @extern("igNewLine");
extern fn void next_column() @extern("igNextColumn");
extern fn void open_popup_str(ZString str_id, ImGuiPopupFlags popup_flags = 0) @extern("igOpenPopup_Str");
extern fn void open_popup_id(ImGuiID id, ImGuiPopupFlags popup_flags = 0) @extern("igOpenPopup_ID");
extern fn void open_popup_ex(ImGuiID id, ImGuiPopupFlags popup_flags = popup_flags::NONE) @extern("igOpenPopupEx");
extern fn void open_popup_on_item_click(ZString str_id = null, ImGuiPopupFlags popup_flags = 1) @extern("igOpenPopupOnItemClick");
extern fn CInt plot_ex(ImGuiPlotType plot_type, ZString label, GetFloatByIndexFn values_getter, void* data, CInt values_count, CInt values_offset, ZString overlay_text, float scale_min, float scale_max, ImVec2 size_arg) @extern("igPlotEx");
extern fn void plot_histogram_float_ptr(ZString label, float* values, CInt values_count, CInt values_offset = 0, ZString overlay_text = null, float scale_min = math::FLOAT_MAX, float scale_max = math::FLOAT_MAX, ImVec2 graph_size = {}, CInt stride = float.sizeof) @extern("igPlotHistogram_FloatPtr");
extern fn void plot_histogram_fn_float_ptr(ZString label, GetFloatByIndexFn values_getter, void* data, CInt values_count, CInt values_offset = 0, ZString overlay_text = null, float scale_min = math::FLOAT_MAX, float scale_max = math::FLOAT_MAX, ImVec2 graph_size = {}) @extern("igPlotHistogram_FnFloatPtr");
extern fn void plot_lines_float_ptr(ZString label, float* values, CInt values_count, CInt values_offset = 0, ZString overlay_text = null, float scale_min = math::FLOAT_MAX, float scale_max = math::FLOAT_MAX, ImVec2 graph_size = {}, CInt stride = float.sizeof) @extern("igPlotLines_FloatPtr");
extern fn void plot_lines_fn_float_ptr(ZString label, GetFloatByIndexFn values_getter, void* data, CInt values_count, CInt values_offset = 0, ZString overlay_text = null, float scale_min = math::FLOAT_MAX, float scale_max = math::FLOAT_MAX, ImVec2 graph_size = {}) @extern("igPlotLines_FnFloatPtr");
extern fn void pop_clip_rect() @extern("igPopClipRect");
extern fn void pop_columns_background() @extern("igPopColumnsBackground");
extern fn void pop_focus_scope() @extern("igPopFocusScope");
extern fn void pop_font() @extern("igPopFont");
extern fn void pop_id() @extern("igPopID");
extern fn void pop_item_flag() @extern("igPopItemFlag");
extern fn void pop_item_width() @extern("igPopItemWidth");
extern fn void pop_style_color(CInt count = 1) @extern("igPopStyleColor");
extern fn void pop_style_var(CInt count = 1) @extern("igPopStyleVar");
extern fn void pop_text_wrap_pos() @extern("igPopTextWrapPos");
extern fn void progress_bar(float fraction, ImVec2 size_arg = {-math::FLOAT_MIN, 0}, ZString overlay = null) @extern("igProgressBar");
extern fn void push_clip_rect(ImVec2 clip_rect_min, ImVec2 clip_rect_max, bool intersect_with_current_clip_rect) @extern("igPushClipRect");
extern fn void push_column_clip_rect(CInt column_index) @extern("igPushColumnClipRect");
extern fn void push_columns_background() @extern("igPushColumnsBackground");
extern fn void push_focus_scope(ImGuiID id) @extern("igPushFocusScope");
extern fn void push_font(ImFont* font) @extern("igPushFont");
extern fn void push_idstr(ZString str_id) @extern("igPushID_Str");
extern fn void push_idstr_str(ZString str_id_begin, ZString str_id_end) @extern("igPushID_StrStr");
extern fn void push_idptr(void* ptr_id) @extern("igPushID_Ptr");
extern fn void push_idint(CInt int_id) @extern("igPushID_Int");
extern fn void push_item_flag(ImGuiItemFlags option, bool enabled) @extern("igPushItemFlag");
extern fn void push_item_width(float item_width) @extern("igPushItemWidth");
extern fn void push_multi_items_widths(CInt components, float width_full) @extern("igPushMultiItemsWidths");
extern fn void push_override_id(ImGuiID id) @extern("igPushOverrideID");
extern fn void push_style_color_u32(ImGuiCol idx, ImU32 col) @extern("igPushStyleColor_U32");
extern fn void push_style_color_vec4(ImGuiCol idx, ImVec4 col) @extern("igPushStyleColor_Vec4");
extern fn void push_style_var_float(ImGuiStyleVar idx, float val) @extern("igPushStyleVar_Float");
extern fn void push_style_var_vec2(ImGuiStyleVar idx, ImVec2 val) @extern("igPushStyleVar_Vec2");
extern fn void push_style_var_x(ImGuiStyleVar idx, float val_x) @extern("igPushStyleVarX");
extern fn void push_style_var_y(ImGuiStyleVar idx, float val_y) @extern("igPushStyleVarY");
extern fn void push_text_wrap_pos(float wrap_local_pos_x = 0.0f) @extern("igPushTextWrapPos");
extern fn bool radio_button_bool(ZString label, bool active) @extern("igRadioButton_Bool");
extern fn bool radio_button_int_ptr(ZString label, CInt* v, CInt v_button) @extern("igRadioButton_IntPtr");
extern fn void remove_context_hook(ImGuiContext* context, ImGuiID hook_to_remove) @extern("igRemoveContextHook");
extern fn void remove_settings_handler(ZString type_name) @extern("igRemoveSettingsHandler");
extern fn void render() @extern("igRender");
extern fn void render_arrow(ImDrawList* draw_list, ImVec2 pos, ImU32 col, ImGuiDir dir, float scale = 1.0f) @extern("igRenderArrow");
extern fn void render_arrow_dock_menu(ImDrawList* draw_list, ImVec2 p_min, float sz, ImU32 col) @extern("igRenderArrowDockMenu");
extern fn void render_arrow_pointing_at(ImDrawList* draw_list, ImVec2 pos, ImVec2 half_sz, ImGuiDir direction, ImU32 col) @extern("igRenderArrowPointingAt");
extern fn void render_bullet(ImDrawList* draw_list, ImVec2 pos, ImU32 col) @extern("igRenderBullet");
extern fn void render_check_mark(ImDrawList* draw_list, ImVec2 pos, ImU32 col, float sz) @extern("igRenderCheckMark");
extern fn void render_color_rect_with_alpha_checkerboard(ImDrawList* draw_list, ImVec2 p_min, ImVec2 p_max, ImU32 fill_col, float grid_step, ImVec2 grid_off, float rounding = 0.0f, ImDrawFlags flags = 0) @extern("igRenderColorRectWithAlphaCheckerboard");
extern fn void render_drag_drop_target_rect(ImRect bb, ImRect item_clip_rect) @extern("igRenderDragDropTargetRect");
extern fn void render_frame(ImVec2 p_min, ImVec2 p_max, ImU32 fill_col, bool borders = true, float rounding = 0.0f) @extern("igRenderFrame");
extern fn void render_frame_border(ImVec2 p_min, ImVec2 p_max, float rounding = 0.0f) @extern("igRenderFrameBorder");
extern fn void render_mouse_cursor(ImVec2 pos, float scale, ImGuiMouseCursor mouse_cursor, ImU32 col_fill, ImU32 col_border, ImU32 col_shadow) @extern("igRenderMouseCursor");
extern fn void render_nav_cursor(ImRect bb, ImGuiID id, ImGuiNavRenderCursorFlags flags = nav_render_cursor_flags::NONE) @extern("igRenderNavCursor");
extern fn void render_platform_windows_default(void* platform_render_arg = null, void* renderer_render_arg = null) @extern("igRenderPlatformWindowsDefault");
extern fn void render_rect_filled_range_h(ImDrawList* draw_list, ImRect rect, ImU32 col, float x_start_norm, float x_end_norm, float rounding) @extern("igRenderRectFilledRangeH");
extern fn void render_rect_filled_with_hole(ImDrawList* draw_list, ImRect outer, ImRect inner, ImU32 col, float rounding) @extern("igRenderRectFilledWithHole");
extern fn void render_text(ImVec2 pos, ZString text, ZString text_end = null, bool hide_text_after_hash = true) @extern("igRenderText");
extern fn void render_text_clipped(ImVec2 pos_min, ImVec2 pos_max, ZString text, ZString text_end, ImVec2* text_size_if_known, ImVec2 align = {}, ImRect* clip_rect = null) @extern("igRenderTextClipped");
extern fn void render_text_clipped_ex(ImDrawList* draw_list, ImVec2 pos_min, ImVec2 pos_max, ZString text, ZString text_end, ImVec2* text_size_if_known, ImVec2 align = {}, ImRect* clip_rect = null) @extern("igRenderTextClippedEx");
extern fn void render_text_ellipsis(ImDrawList* draw_list, ImVec2 pos_min, ImVec2 pos_max, float clip_max_x, float ellipsis_max_x, ZString text, ZString text_end, ImVec2* text_size_if_known) @extern("igRenderTextEllipsis");
extern fn void render_text_wrapped(ImVec2 pos, ZString text, ZString text_end, float wrap_width) @extern("igRenderTextWrapped");
extern fn void reset_mouse_drag_delta(ImGuiMouseButton button = 0) @extern("igResetMouseDragDelta");
extern fn void same_line(float offset_from_start_x = 0.0f, float spacing = -1.0f) @extern("igSameLine");
extern fn void save_ini_settings_to_disk(ZString ini_filename) @extern("igSaveIniSettingsToDisk");
extern fn ZString save_ini_settings_to_memory(usz* out_ini_size = null) @extern("igSaveIniSettingsToMemory");
extern fn void scale_windows_in_viewport(ImGuiViewportP* viewport, float scale) @extern("igScaleWindowsInViewport");
extern fn void scroll_to_bring_rect_into_view(ImGuiWindow* window, ImRect rect) @extern("igScrollToBringRectIntoView");
extern fn void scroll_to_item(ImGuiScrollFlags flags = 0) @extern("igScrollToItem");
extern fn void scroll_to_rect(ImGuiWindow* window, ImRect rect, ImGuiScrollFlags flags = 0) @extern("igScrollToRect");
extern fn void scroll_to_rect_ex(ImVec2* p_out, ImGuiWindow* window, ImRect rect, ImGuiScrollFlags flags = 0) @extern("igScrollToRectEx");
extern fn void scrollbar(ImGuiAxis axis) @extern("igScrollbar");
extern fn bool scrollbar_ex(ImRect bb, ImGuiID id, ImGuiAxis axis, ImS64* p_scroll_v, ImS64 avail_v, ImS64 contents_v, ImDrawFlags flags) @extern("igScrollbarEx");
extern fn bool selectable_bool(ZString label, bool selected = false, ImGuiSelectableFlags flags = 0, ImVec2 size = {}) @extern("igSelectable_Bool");
extern fn bool selectable_bool_ptr(ZString label, bool* p_selected, ImGuiSelectableFlags flags = 0, ImVec2 size = {}) @extern("igSelectable_BoolPtr");
extern fn void separator() @extern("igSeparator");
extern fn void separator_ex(ImGuiSeparatorFlags flags, float thickness = 1.0f) @extern("igSeparatorEx");
extern fn void separator_text(ZString label) @extern("igSeparatorText");
extern fn void separator_text_ex(ImGuiID id, ZString label, ZString label_end, float extra_width) @extern("igSeparatorTextEx");
extern fn void set_active_id(ImGuiID id, ImGuiWindow* window) @extern("igSetActiveID");
extern fn void set_active_id_using_all_keyboard_keys() @extern("igSetActiveIdUsingAllKeyboardKeys");
extern fn void set_allocator_functions(ImGuiMemAllocFunc alloc_func, ImGuiMemFreeFunc free_func, void* user_data = null) @extern("igSetAllocatorFunctions");
extern fn void set_clipboard_text(ZString text) @extern("igSetClipboardText");
extern fn void set_color_edit_options(ImGuiColorEditFlags flags) @extern("igSetColorEditOptions");
extern fn void set_column_offset(CInt column_index, float offset_x) @extern("igSetColumnOffset");
extern fn void set_column_width(CInt column_index, float width) @extern("igSetColumnWidth");
extern fn void set_current_context(ImGuiContext* ctx) @extern("igSetCurrentContext");
extern fn void set_current_font(ImFont* font) @extern("igSetCurrentFont");
extern fn void set_current_viewport(ImGuiWindow* window, ImGuiViewportP* viewport) @extern("igSetCurrentViewport");
extern fn void set_cursor_pos(ImVec2 local_pos) @extern("igSetCursorPos");
extern fn void set_cursor_pos_x(float local_x) @extern("igSetCursorPosX");
extern fn void set_cursor_pos_y(float local_y) @extern("igSetCursorPosY");
extern fn void set_cursor_screen_pos(ImVec2 pos) @extern("igSetCursorScreenPos");
extern fn bool set_drag_drop_payload(ZString type, void* data, usz sz, ImGuiCond cond = 0) @extern("igSetDragDropPayload");
extern fn void set_focus_id(ImGuiID id, ImGuiWindow* window) @extern("igSetFocusID");
extern fn void set_hovered_id(ImGuiID id) @extern("igSetHoveredID");
extern fn void set_item_default_focus() @extern("igSetItemDefaultFocus");
extern fn void set_item_key_owner_nil(ImGuiKey key) @extern("igSetItemKeyOwner_Nil");
extern fn void set_item_key_owner_input_flags(ImGuiKey key, ImGuiInputFlags flags) @extern("igSetItemKeyOwner_InputFlags");
extern fn void set_item_tooltip(ZString fmt, ...) @extern("igSetItemTooltip");
extern fn void set_key_owner(ImGuiKey key, ImGuiID owner_id, ImGuiInputFlags flags = 0) @extern("igSetKeyOwner");
extern fn void set_key_owners_for_key_chord(ImGuiKeyChord key, ImGuiID owner_id, ImGuiInputFlags flags = 0) @extern("igSetKeyOwnersForKeyChord");
extern fn void set_keyboard_focus_here(CInt offset = 0) @extern("igSetKeyboardFocusHere");
extern fn void set_last_item_data(ImGuiID item_id, ImGuiItemFlags in_flags, ImGuiItemStatusFlags status_flags, ImRect item_rect) @extern("igSetLastItemData");
extern fn void set_mouse_cursor(ImGuiMouseCursor cursor_type) @extern("igSetMouseCursor");
extern fn void set_nav_cursor_visible(bool visible) @extern("igSetNavCursorVisible");
extern fn void set_nav_cursor_visible_after_move() @extern("igSetNavCursorVisibleAfterMove");
extern fn void set_nav_focus_scope(ImGuiID focus_scope_id) @extern("igSetNavFocusScope");
extern fn void set_nav_id(ImGuiID id, ImGuiNavLayer nav_layer, ImGuiID focus_scope_id, ImRect rect_rel) @extern("igSetNavID");
extern fn void set_nav_window(ImGuiWindow* window) @extern("igSetNavWindow");
extern fn void set_next_frame_want_capture_keyboard(bool want_capture_keyboard) @extern("igSetNextFrameWantCaptureKeyboard");
extern fn void set_next_frame_want_capture_mouse(bool want_capture_mouse) @extern("igSetNextFrameWantCaptureMouse");
extern fn void set_next_item_allow_overlap() @extern("igSetNextItemAllowOverlap");
extern fn void set_next_item_open(bool is_open, ImGuiCond cond = 0) @extern("igSetNextItemOpen");
extern fn void set_next_item_ref_val(ImGuiDataType data_type, void* p_data) @extern("igSetNextItemRefVal");
extern fn void set_next_item_selection_user_data(ImGuiSelectionUserData selection_user_data) @extern("igSetNextItemSelectionUserData");
extern fn void set_next_item_shortcut(ImGuiKeyChord key_chord, ImGuiInputFlags flags = 0) @extern("igSetNextItemShortcut");
extern fn void set_next_item_storage_id(ImGuiID storage_id) @extern("igSetNextItemStorageID");
extern fn void set_next_item_width(float item_width) @extern("igSetNextItemWidth");
extern fn void set_next_window_bg_alpha(float alpha) @extern("igSetNextWindowBgAlpha");
extern fn void set_next_window_class(ImGuiWindowClass* window_class) @extern("igSetNextWindowClass");
extern fn void set_next_window_collapsed(bool collapsed, ImGuiCond cond = 0) @extern("igSetNextWindowCollapsed");
extern fn void set_next_window_content_size(ImVec2 size) @extern("igSetNextWindowContentSize");
extern fn void set_next_window_dock_id(ImGuiID dock_id, ImGuiCond cond = 0) @extern("igSetNextWindowDockID");
extern fn void set_next_window_focus() @extern("igSetNextWindowFocus");
extern fn void set_next_window_pos(ImVec2 pos, ImGuiCond cond = 0, ImVec2 pivot = {}) @extern("igSetNextWindowPos");
extern fn void set_next_window_refresh_policy(ImGuiWindowRefreshFlags flags) @extern("igSetNextWindowRefreshPolicy");
extern fn void set_next_window_scroll(ImVec2 scroll) @extern("igSetNextWindowScroll");
extern fn void set_next_window_size(ImVec2 size, ImGuiCond cond = 0) @extern("igSetNextWindowSize");
extern fn void set_next_window_size_constraints(ImVec2 size_min, ImVec2 size_max, ImGuiSizeCallback custom_callback = null, void* custom_callback_data = null) @extern("igSetNextWindowSizeConstraints");
extern fn void set_next_window_viewport(ImGuiID viewport_id) @extern("igSetNextWindowViewport");
extern fn void set_scroll_from_pos_xfloat(float local_x, float center_x_ratio = 0.5f) @extern("igSetScrollFromPosX_Float");
extern fn void set_scroll_from_pos_xwindow_ptr(ImGuiWindow* window, float local_x, float center_x_ratio) @extern("igSetScrollFromPosX_WindowPtr");
extern fn void set_scroll_from_pos_yfloat(float local_y, float center_y_ratio = 0.5f) @extern("igSetScrollFromPosY_Float");
extern fn void set_scroll_from_pos_ywindow_ptr(ImGuiWindow* window, float local_y, float center_y_ratio) @extern("igSetScrollFromPosY_WindowPtr");
extern fn void set_scroll_here_x(float center_x_ratio = 0.5f) @extern("igSetScrollHereX");
extern fn void set_scroll_here_y(float center_y_ratio = 0.5f) @extern("igSetScrollHereY");
extern fn void set_scroll_xfloat(float scroll_x) @extern("igSetScrollX_Float");
extern fn void set_scroll_xwindow_ptr(ImGuiWindow* window, float scroll_x) @extern("igSetScrollX_WindowPtr");
extern fn void set_scroll_yfloat(float scroll_y) @extern("igSetScrollY_Float");
extern fn void set_scroll_ywindow_ptr(ImGuiWindow* window, float scroll_y) @extern("igSetScrollY_WindowPtr");
extern fn bool set_shortcut_routing(ImGuiKeyChord key_chord, ImGuiInputFlags flags, ImGuiID owner_id) @extern("igSetShortcutRouting");
extern fn void set_state_storage(ImGuiStorage* storage) @extern("igSetStateStorage");
extern fn void set_tab_item_closed(ZString tab_or_docked_window_label) @extern("igSetTabItemClosed");
extern fn void set_tooltip(ZString fmt, ...) @extern("igSetTooltip");
extern fn void set_window_clip_rect_before_set_channel(ImGuiWindow* window, ImRect clip_rect) @extern("igSetWindowClipRectBeforeSetChannel");
extern fn void set_window_collapsed_bool(bool collapsed, ImGuiCond cond = 0) @extern("igSetWindowCollapsed_Bool");
extern fn void set_window_collapsed_str(ZString name, bool collapsed, ImGuiCond cond = 0) @extern("igSetWindowCollapsed_Str");
extern fn void set_window_collapsed_window_ptr(ImGuiWindow* window, bool collapsed, ImGuiCond cond = 0) @extern("igSetWindowCollapsed_WindowPtr");
extern fn void set_window_dock(ImGuiWindow* window, ImGuiID dock_id, ImGuiCond cond) @extern("igSetWindowDock");
extern fn void set_window_focus_nil() @extern("igSetWindowFocus_Nil");
extern fn void set_window_focus_str(ZString name) @extern("igSetWindowFocus_Str");
extern fn void set_window_font_scale(float scale) @extern("igSetWindowFontScale");
extern fn void set_window_hidden_and_skip_items_for_current_frame(ImGuiWindow* window) @extern("igSetWindowHiddenAndSkipItemsForCurrentFrame");
extern fn void set_window_hit_test_hole(ImGuiWindow* window, ImVec2 pos, ImVec2 size) @extern("igSetWindowHitTestHole");
extern fn void set_window_parent_window_for_focus_route(ImGuiWindow* window, ImGuiWindow* parent_window) @extern("igSetWindowParentWindowForFocusRoute");
extern fn void set_window_pos_vec2(ImVec2 pos, ImGuiCond cond = 0) @extern("igSetWindowPos_Vec2");
extern fn void set_window_pos_str(ZString name, ImVec2 pos, ImGuiCond cond = 0) @extern("igSetWindowPos_Str");
extern fn void set_window_pos_window_ptr(ImGuiWindow* window, ImVec2 pos, ImGuiCond cond = 0) @extern("igSetWindowPos_WindowPtr");
extern fn void set_window_size_vec2(ImVec2 size, ImGuiCond cond = 0) @extern("igSetWindowSize_Vec2");
extern fn void set_window_size_str(ZString name, ImVec2 size, ImGuiCond cond = 0) @extern("igSetWindowSize_Str");
extern fn void set_window_size_window_ptr(ImGuiWindow* window, ImVec2 size, ImGuiCond cond = 0) @extern("igSetWindowSize_WindowPtr");
extern fn void set_window_viewport(ImGuiWindow* window, ImGuiViewportP* viewport) @extern("igSetWindowViewport");
extern fn void shade_verts_linear_color_gradient_keep_alpha(ImDrawList* draw_list, CInt vert_start_idx, CInt vert_end_idx, ImVec2 gradient_p0, ImVec2 gradient_p1, ImU32 col0, ImU32 col1) @extern("igShadeVertsLinearColorGradientKeepAlpha");
extern fn void shade_verts_linear_uv(ImDrawList* draw_list, CInt vert_start_idx, CInt vert_end_idx, ImVec2 a, ImVec2 b, ImVec2 uv_a, ImVec2 uv_b, bool clamp) @extern("igShadeVertsLinearUV");
extern fn void shade_verts_transform_pos(ImDrawList* draw_list, CInt vert_start_idx, CInt vert_end_idx, ImVec2 pivot_in, float cos_a, float sin_a, ImVec2 pivot_out) @extern("igShadeVertsTransformPos");
extern fn bool shortcut_nil(ImGuiKeyChord key_chord, ImGuiInputFlags flags = 0) @extern("igShortcut_Nil");
extern fn bool shortcut_id(ImGuiKeyChord key_chord, ImGuiInputFlags flags, ImGuiID owner_id) @extern("igShortcut_ID");
extern fn void show_about_window(bool* p_open = null) @extern("igShowAboutWindow");
extern fn void show_debug_log_window(bool* p_open = null) @extern("igShowDebugLogWindow");
extern fn void show_demo_window(bool* p_open = null) @extern("igShowDemoWindow");
extern fn void show_font_atlas(ImFontAtlas* atlas) @extern("igShowFontAtlas");
extern fn void show_font_selector(ZString label) @extern("igShowFontSelector");
extern fn void show_idstack_tool_window(bool* p_open = null) @extern("igShowIDStackToolWindow");
extern fn void show_metrics_window(bool* p_open = null) @extern("igShowMetricsWindow");
extern fn void show_style_editor(ImGuiStyle* ref = null) @extern("igShowStyleEditor");
extern fn bool show_style_selector(ZString label) @extern("igShowStyleSelector");
extern fn void show_user_guide() @extern("igShowUserGuide");
extern fn void shrink_widths(ImGuiShrinkWidthItem* items, CInt count, float width_excess) @extern("igShrinkWidths");
extern fn void shutdown() @extern("igShutdown");
extern fn bool slider_angle(ZString label, float* v_rad, float v_degrees_min = -360.0f, float v_degrees_max = +360.0f, ZString format = "%.0f deg", ImGuiSliderFlags flags = 0) @extern("igSliderAngle");
extern fn bool slider_behavior(ImRect bb, ImGuiID id, ImGuiDataType data_type, void* p_v, void* p_min, void* p_max, ZString format, ImGuiSliderFlags flags, ImRect* out_grab_bb) @extern("igSliderBehavior");
extern fn bool slider_float(ZString label, float* v, float v_min, float v_max, ZString format = "%.3f", ImGuiSliderFlags flags = 0) @extern("igSliderFloat");
extern fn bool slider_float2(ZString label, float[2]* v, float v_min, float v_max, ZString format = "%.3f", ImGuiSliderFlags flags = 0) @extern("igSliderFloat2");
extern fn bool slider_float3(ZString label, float[3]* v, float v_min, float v_max, ZString format = "%.3f", ImGuiSliderFlags flags = 0) @extern("igSliderFloat3");
extern fn bool slider_float4(ZString label, float[4]* v, float v_min, float v_max, ZString format = "%.3f", ImGuiSliderFlags flags = 0) @extern("igSliderFloat4");
extern fn bool slider_int(ZString label, CInt* v, CInt v_min, CInt v_max, ZString format = "%d", ImGuiSliderFlags flags = 0) @extern("igSliderInt");
extern fn bool slider_int2(ZString label, CInt[2]* v, CInt v_min, CInt v_max, ZString format = "%d", ImGuiSliderFlags flags = 0) @extern("igSliderInt2");
extern fn bool slider_int3(ZString label, CInt[3]* v, CInt v_min, CInt v_max, ZString format = "%d", ImGuiSliderFlags flags = 0) @extern("igSliderInt3");
extern fn bool slider_int4(ZString label, CInt[4]* v, CInt v_min, CInt v_max, ZString format = "%d", ImGuiSliderFlags flags = 0) @extern("igSliderInt4");
extern fn bool slider_scalar(ZString label, ImGuiDataType data_type, void* p_data, void* p_min, void* p_max, ZString format = null, ImGuiSliderFlags flags = 0) @extern("igSliderScalar");
extern fn bool slider_scalar_n(ZString label, ImGuiDataType data_type, void* p_data, CInt components, void* p_min, void* p_max, ZString format = null, ImGuiSliderFlags flags = 0) @extern("igSliderScalarN");
extern fn bool small_button(ZString label) @extern("igSmallButton");
extern fn void spacing() @extern("igSpacing");
extern fn bool splitter_behavior(ImRect bb, ImGuiID id, ImGuiAxis axis, float* size1, float* size2, float min_size1, float min_size2, float hover_extend = 0.0f, float hover_visibility_delay = 0.0f, ImU32 bg_col = 0) @extern("igSplitterBehavior");
extern fn void start_mouse_moving_window(ImGuiWindow* window) @extern("igStartMouseMovingWindow");
extern fn void start_mouse_moving_window_or_node(ImGuiWindow* window, ImGuiDockNode* node, bool undock) @extern("igStartMouseMovingWindowOrNode");
extern fn void style_colors_classic(ImGuiStyle* dst = null) @extern("igStyleColorsClassic");
extern fn void style_colors_dark(ImGuiStyle* dst = null) @extern("igStyleColorsDark");
extern fn void style_colors_light(ImGuiStyle* dst = null) @extern("igStyleColorsLight");
extern fn void tab_bar_add_tab(ImGuiTabBar* tab_bar, ImGuiTabItemFlags tab_flags, ImGuiWindow* window) @extern("igTabBarAddTab");
extern fn void tab_bar_close_tab(ImGuiTabBar* tab_bar, ImGuiTabItem* tab) @extern("igTabBarCloseTab");
extern fn ImGuiTabItem* tab_bar_find_most_recently_selected_tab_for_active_window(ImGuiTabBar* tab_bar) @extern("igTabBarFindMostRecentlySelectedTabForActiveWindow");
extern fn ImGuiTabItem* tab_bar_find_tab_by_id(ImGuiTabBar* tab_bar, ImGuiID tab_id) @extern("igTabBarFindTabByID");
extern fn ImGuiTabItem* tab_bar_find_tab_by_order(ImGuiTabBar* tab_bar, CInt order) @extern("igTabBarFindTabByOrder");
extern fn ImGuiTabItem* tab_bar_get_current_tab(ImGuiTabBar* tab_bar) @extern("igTabBarGetCurrentTab");
extern fn ZString tab_bar_get_tab_name(ImGuiTabBar* tab_bar, ImGuiTabItem* tab) @extern("igTabBarGetTabName");
extern fn CInt tab_bar_get_tab_order(ImGuiTabBar* tab_bar, ImGuiTabItem* tab) @extern("igTabBarGetTabOrder");
extern fn bool tab_bar_process_reorder(ImGuiTabBar* tab_bar) @extern("igTabBarProcessReorder");
extern fn void tab_bar_queue_focus_tab_item_ptr(ImGuiTabBar* tab_bar, ImGuiTabItem* tab) @extern("igTabBarQueueFocus_TabItemPtr");
extern fn void tab_bar_queue_focus_str(ImGuiTabBar* tab_bar, ZString tab_name) @extern("igTabBarQueueFocus_Str");
extern fn void tab_bar_queue_reorder(ImGuiTabBar* tab_bar, ImGuiTabItem* tab, CInt offset) @extern("igTabBarQueueReorder");
extern fn void tab_bar_queue_reorder_from_mouse_pos(ImGuiTabBar* tab_bar, ImGuiTabItem* tab, ImVec2 mouse_pos) @extern("igTabBarQueueReorderFromMousePos");
extern fn void tab_bar_remove_tab(ImGuiTabBar* tab_bar, ImGuiID tab_id) @extern("igTabBarRemoveTab");
extern fn void tab_item_background(ImDrawList* draw_list, ImRect bb, ImGuiTabItemFlags flags, ImU32 col) @extern("igTabItemBackground");
extern fn bool tab_item_button(ZString label, ImGuiTabItemFlags flags = 0) @extern("igTabItemButton");
extern fn void tab_item_calc_size_str(ImVec2* p_out, ZString label, bool has_close_button_or_unsaved_marker) @extern("igTabItemCalcSize_Str");
extern fn void tab_item_calc_size_window_ptr(ImVec2* p_out, ImGuiWindow* window) @extern("igTabItemCalcSize_WindowPtr");
extern fn bool tab_item_ex(ImGuiTabBar* tab_bar, ZString label, bool* p_open, ImGuiTabItemFlags flags, ImGuiWindow* docked_window) @extern("igTabItemEx");
extern fn void tab_item_label_and_close_button(ImDrawList* draw_list, ImRect bb, ImGuiTabItemFlags flags, ImVec2 frame_padding, ZString label, ImGuiID tab_id, ImGuiID close_button_id, bool is_contents_visible, bool* out_just_closed, bool* out_text_clipped) @extern("igTabItemLabelAndCloseButton");
extern fn void table_angled_headers_row() @extern("igTableAngledHeadersRow");
extern fn void table_angled_headers_row_ex(ImGuiID row_id, float angle, float max_label_width, ImGuiTableHeaderData* data, CInt data_count) @extern("igTableAngledHeadersRowEx");
extern fn void table_begin_apply_requests(ImGuiTable* table) @extern("igTableBeginApplyRequests");
extern fn void table_begin_cell(ImGuiTable* table, CInt column_n) @extern("igTableBeginCell");
extern fn bool table_begin_context_menu_popup(ImGuiTable* table) @extern("igTableBeginContextMenuPopup");
extern fn void table_begin_init_memory(ImGuiTable* table, CInt columns_count) @extern("igTableBeginInitMemory");
extern fn void table_begin_row(ImGuiTable* table) @extern("igTableBeginRow");
extern fn float table_calc_max_column_width(ImGuiTable* table, CInt column_n) @extern("igTableCalcMaxColumnWidth");
extern fn void table_draw_borders(ImGuiTable* table) @extern("igTableDrawBorders");
extern fn void table_draw_default_context_menu(ImGuiTable* table, ImGuiTableFlags flags_for_section_to_display) @extern("igTableDrawDefaultContextMenu");
extern fn void table_end_cell(ImGuiTable* table) @extern("igTableEndCell");
extern fn void table_end_row(ImGuiTable* table) @extern("igTableEndRow");
extern fn ImGuiTable* table_find_by_id(ImGuiID id) @extern("igTableFindByID");
extern fn void table_fix_column_sort_direction(ImGuiTable* table, ImGuiTableColumn* column) @extern("igTableFixColumnSortDirection");
extern fn void table_gc_compact_settings() @extern("igTableGcCompactSettings");
extern fn void table_gc_compact_transient_buffers_table_ptr(ImGuiTable* table) @extern("igTableGcCompactTransientBuffers_TablePtr");
extern fn void table_gc_compact_transient_buffers_table_temp_data_ptr(ImGuiTableTempData* table) @extern("igTableGcCompactTransientBuffers_TableTempDataPtr");
extern fn ImGuiTableSettings* table_get_bound_settings(ImGuiTable* table) @extern("igTableGetBoundSettings");
extern fn void table_get_cell_bg_rect(ImRect* p_out, ImGuiTable* table, CInt column_n) @extern("igTableGetCellBgRect");
extern fn CInt table_get_column_count() @extern("igTableGetColumnCount");
extern fn ImGuiTableColumnFlags table_get_column_flags(CInt column_n = -1) @extern("igTableGetColumnFlags");
extern fn CInt table_get_column_index() @extern("igTableGetColumnIndex");
extern fn ZString table_get_column_name_int(CInt column_n = -1) @extern("igTableGetColumnName_Int");
extern fn ZString table_get_column_name_table_ptr(ImGuiTable* table, CInt column_n) @extern("igTableGetColumnName_TablePtr");
extern fn ImGuiSortDirection table_get_column_next_sort_direction(ImGuiTableColumn* column) @extern("igTableGetColumnNextSortDirection");
extern fn ImGuiID table_get_column_resize_id(ImGuiTable* table, CInt column_n, CInt instance_no = 0) @extern("igTableGetColumnResizeID");
extern fn float table_get_column_width_auto(ImGuiTable* table, ImGuiTableColumn* column) @extern("igTableGetColumnWidthAuto");
extern fn float table_get_header_angled_max_label_width() @extern("igTableGetHeaderAngledMaxLabelWidth");
extern fn float table_get_header_row_height() @extern("igTableGetHeaderRowHeight");
extern fn CInt table_get_hovered_column() @extern("igTableGetHoveredColumn");
extern fn CInt table_get_hovered_row() @extern("igTableGetHoveredRow");
extern fn ImGuiTableInstanceData* table_get_instance_data(ImGuiTable* table, CInt instance_no) @extern("igTableGetInstanceData");
extern fn ImGuiID table_get_instance_id(ImGuiTable* table, CInt instance_no) @extern("igTableGetInstanceID");
extern fn CInt table_get_row_index() @extern("igTableGetRowIndex");
extern fn ImGuiTableSortSpecs* table_get_sort_specs() @extern("igTableGetSortSpecs");
extern fn void table_header(ZString label) @extern("igTableHeader");
extern fn void table_headers_row() @extern("igTableHeadersRow");
extern fn void table_load_settings(ImGuiTable* table) @extern("igTableLoadSettings");
extern fn void table_merge_draw_channels(ImGuiTable* table) @extern("igTableMergeDrawChannels");
extern fn bool table_next_column() @extern("igTableNextColumn");
extern fn void table_next_row(ImGuiTableRowFlags row_flags = 0, float min_row_height = 0.0f) @extern("igTableNextRow");
extern fn void table_open_context_menu(CInt column_n = -1) @extern("igTableOpenContextMenu");
extern fn void table_pop_background_channel() @extern("igTablePopBackgroundChannel");
extern fn void table_push_background_channel() @extern("igTablePushBackgroundChannel");
extern fn void table_remove(ImGuiTable* table) @extern("igTableRemove");
extern fn void table_reset_settings(ImGuiTable* table) @extern("igTableResetSettings");
extern fn void table_save_settings(ImGuiTable* table) @extern("igTableSaveSettings");
extern fn void table_set_bg_color(ImGuiTableBgTarget target, ImU32 color, CInt column_n = -1) @extern("igTableSetBgColor");
extern fn void table_set_column_enabled(CInt column_n, bool v) @extern("igTableSetColumnEnabled");
extern fn bool table_set_column_index(CInt column_n) @extern("igTableSetColumnIndex");
extern fn void table_set_column_sort_direction(CInt column_n, ImGuiSortDirection sort_direction, bool append_to_sort_specs) @extern("igTableSetColumnSortDirection");
extern fn void table_set_column_width(CInt column_n, float width) @extern("igTableSetColumnWidth");
extern fn void table_set_column_width_auto_all(ImGuiTable* table) @extern("igTableSetColumnWidthAutoAll");
extern fn void table_set_column_width_auto_single(ImGuiTable* table, CInt column_n) @extern("igTableSetColumnWidthAutoSingle");
extern fn void table_settings_add_settings_handler() @extern("igTableSettingsAddSettingsHandler");
extern fn ImGuiTableSettings* table_settings_create(ImGuiID id, CInt columns_count) @extern("igTableSettingsCreate");
extern fn ImGuiTableSettings* table_settings_find_by_id(ImGuiID id) @extern("igTableSettingsFindByID");
extern fn void table_setup_column(ZString label, ImGuiTableColumnFlags flags = 0, float init_width_or_weight = 0.0f, ImGuiID user_id = 0) @extern("igTableSetupColumn");
extern fn void table_setup_draw_channels(ImGuiTable* table) @extern("igTableSetupDrawChannels");
extern fn void table_setup_scroll_freeze(CInt cols, CInt rows) @extern("igTableSetupScrollFreeze");
extern fn void table_sort_specs_build(ImGuiTable* table) @extern("igTableSortSpecsBuild");
extern fn void table_sort_specs_sanitize(ImGuiTable* table) @extern("igTableSortSpecsSanitize");
extern fn void table_update_borders(ImGuiTable* table) @extern("igTableUpdateBorders");
extern fn void table_update_columns_weight_from_width(ImGuiTable* table) @extern("igTableUpdateColumnsWeightFromWidth");
extern fn void table_update_layout(ImGuiTable* table) @extern("igTableUpdateLayout");
extern fn void teleport_mouse_pos(ImVec2 pos) @extern("igTeleportMousePos");
extern fn bool temp_input_is_active(ImGuiID id) @extern("igTempInputIsActive");
extern fn bool temp_input_scalar(ImRect bb, ImGuiID id, ZString label, ImGuiDataType data_type, void* p_data, ZString format, void* p_clamp_min = null, void* p_clamp_max = null) @extern("igTempInputScalar");
extern fn bool temp_input_text(ImRect bb, ImGuiID id, ZString label, ZString buf, CInt buf_size, ImGuiInputTextFlags flags) @extern("igTempInputText");
extern fn bool test_key_owner(ImGuiKey key, ImGuiID owner_id) @extern("igTestKeyOwner");
extern fn bool test_shortcut_routing(ImGuiKeyChord key_chord, ImGuiID owner_id) @extern("igTestShortcutRouting");
extern fn void text(ZString fmt, ...) @extern("igText");
extern fn void text_colored(ImVec4 col, ZString fmt, ...) @extern("igTextColored");
extern fn void text_disabled(ZString fmt, ...) @extern("igTextDisabled");
extern fn void text_ex(ZString text, ZString text_end = null, ImGuiTextFlags flags = 0) @extern("igTextEx");
extern fn bool text_link(ZString label) @extern("igTextLink");
extern fn void text_link_open_url(ZString label, ZString url = null) @extern("igTextLinkOpenURL");
extern fn void text_unformatted(ZString text, ZString text_end = null) @extern("igTextUnformatted");
extern fn void text_wrapped(ZString fmt, ...) @extern("igTextWrapped");
extern fn void translate_windows_in_viewport(ImGuiViewportP* viewport, ImVec2 old_pos, ImVec2 new_pos, ImVec2 old_size, ImVec2 new_size) @extern("igTranslateWindowsInViewport");
extern fn bool tree_node_str(ZString label) @extern("igTreeNode_Str");
extern fn bool tree_node_str_str(ZString str_id, ZString fmt, ...) @extern("igTreeNode_StrStr");
extern fn bool tree_node_ptr(void* ptr_id, ZString fmt, ...) @extern("igTreeNode_Ptr");
extern fn bool tree_node_behavior(ImGuiID id, ImGuiTreeNodeFlags flags, ZString label, ZString label_end = null) @extern("igTreeNodeBehavior");
extern fn bool tree_node_ex_str(ZString label, ImGuiTreeNodeFlags flags = 0) @extern("igTreeNodeEx_Str");
extern fn bool tree_node_ex_str_str(ZString str_id, ImGuiTreeNodeFlags flags, ZString fmt, ...) @extern("igTreeNodeEx_StrStr");
extern fn bool tree_node_ex_ptr(void* ptr_id, ImGuiTreeNodeFlags flags, ZString fmt, ...) @extern("igTreeNodeEx_Ptr");
extern fn bool tree_node_get_open(ImGuiID storage_id) @extern("igTreeNodeGetOpen");
extern fn void tree_node_set_open(ImGuiID storage_id, bool open) @extern("igTreeNodeSetOpen");
extern fn bool tree_node_update_next_open(ImGuiID storage_id, ImGuiTreeNodeFlags flags) @extern("igTreeNodeUpdateNextOpen");
extern fn void tree_pop() @extern("igTreePop");
extern fn void tree_push_str(ZString str_id) @extern("igTreePush_Str");
extern fn void tree_push_ptr(void* ptr_id) @extern("igTreePush_Ptr");
extern fn void tree_push_override_id(ImGuiID id) @extern("igTreePushOverrideID");
extern fn CInt typing_select_find_best_leading_match(ImGuiTypingSelectRequest* req, CInt items_count, GetZStringByIndexFn get_item_name_func, void* user_data) @extern("igTypingSelectFindBestLeadingMatch");
extern fn CInt typing_select_find_match(ImGuiTypingSelectRequest* req, CInt items_count, GetZStringByIndexFn get_item_name_func, void* user_data, CInt nav_item_idx) @extern("igTypingSelectFindMatch");
extern fn CInt typing_select_find_next_single_char_match(ImGuiTypingSelectRequest* req, CInt items_count, GetZStringByIndexFn get_item_name_func, void* user_data, CInt nav_item_idx) @extern("igTypingSelectFindNextSingleCharMatch");
extern fn void unindent(float indent_w = 0.0f) @extern("igUnindent");
extern fn void update_hovered_window_and_capture_flags() @extern("igUpdateHoveredWindowAndCaptureFlags");
extern fn void update_input_events(bool trickle_fast_inputs) @extern("igUpdateInputEvents");
extern fn void update_mouse_moving_window_end_frame() @extern("igUpdateMouseMovingWindowEndFrame");
extern fn void update_mouse_moving_window_new_frame() @extern("igUpdateMouseMovingWindowNewFrame");
extern fn void update_platform_windows() @extern("igUpdatePlatformWindows");
extern fn void update_window_parent_and_root_links(ImGuiWindow* window, ImGuiWindowFlags flags, ImGuiWindow* parent_window) @extern("igUpdateWindowParentAndRootLinks");
extern fn void update_window_skip_refresh(ImGuiWindow* window) @extern("igUpdateWindowSkipRefresh");
extern fn bool vslider_float(ZString label, ImVec2 size, float* v, float v_min, float v_max, ZString format = "%.3f", ImGuiSliderFlags flags = 0) @extern("igVSliderFloat");
extern fn bool vslider_int(ZString label, ImVec2 size, CInt* v, CInt v_min, CInt v_max, ZString format = "%d", ImGuiSliderFlags flags = 0) @extern("igVSliderInt");
extern fn bool vslider_scalar(ZString label, ImVec2 size, ImGuiDataType data_type, void* p_data, void* p_min, void* p_max, ZString format = null, ImGuiSliderFlags flags = 0) @extern("igVSliderScalar");
extern fn void value_bool(ZString prefix, bool b) @extern("igValue_Bool");
extern fn void value_int(ZString prefix, CInt v) @extern("igValue_Int");
extern fn void value_uint(ZString prefix, CUInt v) @extern("igValue_Uint");
extern fn void value_float(ZString prefix, float v, ZString float_format = null) @extern("igValue_Float");
extern fn void window_pos_abs_to_rel(ImVec2* p_out, ImGuiWindow* window, ImVec2 p) @extern("igWindowPosAbsToRel");
extern fn void window_pos_rel_to_abs(ImVec2* p_out, ImGuiWindow* window, ImVec2 p) @extern("igWindowPosRelToAbs");
extern fn void window_rect_abs_to_rel(ImRect* p_out, ImGuiWindow* window, ImRect r) @extern("igWindowRectAbsToRel");
extern fn void window_rect_rel_to_abs(ImRect* p_out, ImGuiWindow* window, ImRect r) @extern("igWindowRectRelToAbs");
