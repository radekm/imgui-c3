module ipl;
enum ImAxis : const CInt
{
    X1 = 0,  // 0
    X2 = 1,  // 1
    X3 = 2,  // 2
    Y1 = 3,  // 3
    Y2 = 4,  // 4
    Y3 = 5,  // 5
    COUNT = 6,  // 6
}
enum ImPlotAxisFlags : const CInt
{
    NONE = 0,  // 0
    NO_LABEL = 1,  // 1 << 0
    NO_GRID_LINES = 2,  // 1 << 1
    NO_TICK_MARKS = 4,  // 1 << 2
    NO_TICK_LABELS = 8,  // 1 << 3
    NO_INITIAL_FIT = 16,  // 1 << 4
    NO_MENUS = 32,  // 1 << 5
    NO_SIDE_SWITCH = 64,  // 1 << 6
    NO_HIGHLIGHT = 128,  // 1 << 7
    OPPOSITE = 256,  // 1 << 8
    FOREGROUND = 512,  // 1 << 9
    INVERT = 1024,  // 1 << 10
    AUTO_FIT = 2048,  // 1 << 11
    RANGE_FIT = 4096,  // 1 << 12
    PAN_STRETCH = 8192,  // 1 << 13
    LOCK_MIN = 16384,  // 1 << 14
    LOCK_MAX = 32768,  // 1 << 15
    LOCK = 49152,  // ImPlotAxisFlags_LockMin | ImPlotAxisFlags_LockMax
    NO_DECORATIONS = 15,  // ImPlotAxisFlags_NoLabel | ImPlotAxisFlags_NoGridLines | ImPlotAxisFlags_NoTickMarks | ImPlotAxisFlags_NoTickLabels
    AUX_DEFAULT = 258,  // ImPlotAxisFlags_NoGridLines | ImPlotAxisFlags_Opposite
}
enum ImPlotBarGroupsFlags : const CInt
{
    NONE = 0,  // 0
    HORIZONTAL = 1024,  // 1 << 10
    STACKED = 2048,  // 1 << 11
}
enum ImPlotBarsFlags : const CInt
{
    NONE = 0,  // 0
    HORIZONTAL = 1024,  // 1 << 10
}
enum ImPlotBin : const CInt
{
    SQRT = -1,  // -1
    STURGES = -2,  // -2
    RICE = -3,  // -3
    SCOTT = -4,  // -4
}
enum ImPlotCol : const CInt
{
    LINE = 0,  // 0
    FILL = 1,  // 1
    MARKER_OUTLINE = 2,  // 2
    MARKER_FILL = 3,  // 3
    ERROR_BAR = 4,  // 4
    FRAME_BG = 5,  // 5
    PLOT_BG = 6,  // 6
    PLOT_BORDER = 7,  // 7
    LEGEND_BG = 8,  // 8
    LEGEND_BORDER = 9,  // 9
    LEGEND_TEXT = 10,  // 10
    TITLE_TEXT = 11,  // 11
    INLAY_TEXT = 12,  // 12
    AXIS_TEXT = 13,  // 13
    AXIS_GRID = 14,  // 14
    AXIS_TICK = 15,  // 15
    AXIS_BG = 16,  // 16
    AXIS_BG_HOVERED = 17,  // 17
    AXIS_BG_ACTIVE = 18,  // 18
    SELECTION = 19,  // 19
    CROSSHAIRS = 20,  // 20
    COUNT = 21,  // 21
}
enum ImPlotColormapScaleFlags : const CInt
{
    NONE = 0,  // 0
    NO_LABEL = 1,  // 1 << 0
    OPPOSITE = 2,  // 1 << 1
    INVERT = 4,  // 1 << 2
}
enum ImPlotColormap : const CInt
{
    DEEP = 0,  // 0
    DARK = 1,  // 1
    PASTEL = 2,  // 2
    PAIRED = 3,  // 3
    VIRIDIS = 4,  // 4
    PLASMA = 5,  // 5
    HOT = 6,  // 6
    COOL = 7,  // 7
    PINK = 8,  // 8
    JET = 9,  // 9
    TWILIGHT = 10,  // 10
    RD_BU = 11,  // 11
    BR_BG = 12,  // 12
    PI_YG = 13,  // 13
    SPECTRAL = 14,  // 14
    GREYS = 15,  // 15
}
enum ImPlotCond : const CInt
{
    NONE = 0,  // ImGuiCond_None
    ALWAYS = 1,  // ImGuiCond_Always
    ONCE = 2,  // ImGuiCond_Once
}
enum ImPlotDateFmt : const CInt
{
    NONE = 0,  // 0
    DAY_MO = 1,  // 1
    DAY_MO_YR = 2,  // 2
    MO_YR = 3,  // 3
    MO = 4,  // 4
    YR = 5,  // 5
}
enum ImPlotDigitalFlags : const CInt
{
    NONE = 0,  // 0
}
enum ImPlotDragToolFlags : const CInt
{
    NONE = 0,  // 0
    NO_CURSORS = 1,  // 1 << 0
    NO_FIT = 2,  // 1 << 1
    NO_INPUTS = 4,  // 1 << 2
    DELAYED = 8,  // 1 << 3
}
enum ImPlotDummyFlags : const CInt
{
    NONE = 0,  // 0
}
enum ImPlotErrorBarsFlags : const CInt
{
    NONE = 0,  // 0
    HORIZONTAL = 1024,  // 1 << 10
}
enum ImPlotFlags : const CInt
{
    NONE = 0,  // 0
    NO_TITLE = 1,  // 1 << 0
    NO_LEGEND = 2,  // 1 << 1
    NO_MOUSE_TEXT = 4,  // 1 << 2
    NO_INPUTS = 8,  // 1 << 3
    NO_MENUS = 16,  // 1 << 4
    NO_BOX_SELECT = 32,  // 1 << 5
    NO_FRAME = 64,  // 1 << 6
    EQUAL = 128,  // 1 << 7
    CROSSHAIRS = 256,  // 1 << 8
    CANVAS_ONLY = 55,  // ImPlotFlags_NoTitle | ImPlotFlags_NoLegend | ImPlotFlags_NoMenus | ImPlotFlags_NoBoxSelect | ImPlotFlags_NoMouseText
}
enum ImPlotHeatmapFlags : const CInt
{
    NONE = 0,  // 0
    COL_MAJOR = 1024,  // 1 << 10
}
enum ImPlotHistogramFlags : const CInt
{
    NONE = 0,  // 0
    HORIZONTAL = 1024,  // 1 << 10
    CUMULATIVE = 2048,  // 1 << 11
    DENSITY = 4096,  // 1 << 12
    NO_OUTLIERS = 8192,  // 1 << 13
    COL_MAJOR = 16384,  // 1 << 14
}
enum ImPlotImageFlags : const CInt
{
    NONE = 0,  // 0
}
enum ImPlotInfLinesFlags : const CInt
{
    NONE = 0,  // 0
    HORIZONTAL = 1024,  // 1 << 10
}
enum ImPlotItemFlags : const CInt
{
    NONE = 0,  // 0
    NO_LEGEND = 1,  // 1 << 0
    NO_FIT = 2,  // 1 << 1
}
enum ImPlotLegendFlags : const CInt
{
    NONE = 0,  // 0
    NO_BUTTONS = 1,  // 1 << 0
    NO_HIGHLIGHT_ITEM = 2,  // 1 << 1
    NO_HIGHLIGHT_AXIS = 4,  // 1 << 2
    NO_MENUS = 8,  // 1 << 3
    OUTSIDE = 16,  // 1 << 4
    HORIZONTAL = 32,  // 1 << 5
    SORT = 64,  // 1 << 6
}
enum ImPlotLineFlags : const CInt
{
    NONE = 0,  // 0
    SEGMENTS = 1024,  // 1 << 10
    LOOP = 2048,  // 1 << 11
    SKIP_NA_N = 4096,  // 1 << 12
    NO_CLIP = 8192,  // 1 << 13
    SHADED = 16384,  // 1 << 14
}
enum ImPlotLocation : const CInt
{
    CENTER = 0,  // 0
    NORTH = 1,  // 1 << 0
    SOUTH = 2,  // 1 << 1
    WEST = 4,  // 1 << 2
    EAST = 8,  // 1 << 3
    NORTH_WEST = 5,  // ImPlotLocation_North | ImPlotLocation_West
    NORTH_EAST = 9,  // ImPlotLocation_North | ImPlotLocation_East
    SOUTH_WEST = 6,  // ImPlotLocation_South | ImPlotLocation_West
    SOUTH_EAST = 10,  // ImPlotLocation_South | ImPlotLocation_East
}
enum ImPlotMarker : const CInt
{
    NONE = -1,  // -1
    CIRCLE = 0,  // 0
    SQUARE = 1,  // 1
    DIAMOND = 2,  // 2
    UP = 3,  // 3
    DOWN = 4,  // 4
    LEFT = 5,  // 5
    RIGHT = 6,  // 6
    CROSS = 7,  // 7
    PLUS = 8,  // 8
    ASTERISK = 9,  // 9
    COUNT = 10,  // 10
}
enum ImPlotMouseTextFlags : const CInt
{
    NONE = 0,  // 0
    NO_AUX_AXES = 1,  // 1 << 0
    NO_FORMAT = 2,  // 1 << 1
    SHOW_ALWAYS = 4,  // 1 << 2
}
enum ImPlotPieChartFlags : const CInt
{
    NONE = 0,  // 0
    NORMALIZE = 1024,  // 1 << 10
    IGNORE_HIDDEN = 2048,  // 1 << 11
    EXPLODING = 4096,  // 1 << 12
}
enum ImPlotScale : const CInt
{
    LINEAR = 0,  // 0
    TIME = 1,  // 1
    LOG10 = 2,  // 2
    SYM_LOG = 3,  // 3
}
enum ImPlotScatterFlags : const CInt
{
    NONE = 0,  // 0
    NO_CLIP = 1024,  // 1 << 10
}
enum ImPlotShadedFlags : const CInt
{
    NONE = 0,  // 0
}
enum ImPlotStairsFlags : const CInt
{
    NONE = 0,  // 0
    PRE_STEP = 1024,  // 1 << 10
    SHADED = 2048,  // 1 << 11
}
enum ImPlotStemsFlags : const CInt
{
    NONE = 0,  // 0
    HORIZONTAL = 1024,  // 1 << 10
}
enum ImPlotStyleVar : const CInt
{
    LINE_WEIGHT = 0,  // 0
    MARKER = 1,  // 1
    MARKER_SIZE = 2,  // 2
    MARKER_WEIGHT = 3,  // 3
    FILL_ALPHA = 4,  // 4
    ERROR_BAR_SIZE = 5,  // 5
    ERROR_BAR_WEIGHT = 6,  // 6
    DIGITAL_BIT_HEIGHT = 7,  // 7
    DIGITAL_BIT_GAP = 8,  // 8
    PLOT_BORDER_SIZE = 9,  // 9
    MINOR_ALPHA = 10,  // 10
    MAJOR_TICK_LEN = 11,  // 11
    MINOR_TICK_LEN = 12,  // 12
    MAJOR_TICK_SIZE = 13,  // 13
    MINOR_TICK_SIZE = 14,  // 14
    MAJOR_GRID_SIZE = 15,  // 15
    MINOR_GRID_SIZE = 16,  // 16
    PLOT_PADDING = 17,  // 17
    LABEL_PADDING = 18,  // 18
    LEGEND_PADDING = 19,  // 19
    LEGEND_INNER_PADDING = 20,  // 20
    LEGEND_SPACING = 21,  // 21
    MOUSE_POS_PADDING = 22,  // 22
    ANNOTATION_PADDING = 23,  // 23
    FIT_PADDING = 24,  // 24
    PLOT_DEFAULT_SIZE = 25,  // 25
    PLOT_MIN_SIZE = 26,  // 26
    COUNT = 27,  // 27
}
enum ImPlotSubplotFlags : const CInt
{
    NONE = 0,  // 0
    NO_TITLE = 1,  // 1 << 0
    NO_LEGEND = 2,  // 1 << 1
    NO_MENUS = 4,  // 1 << 2
    NO_RESIZE = 8,  // 1 << 3
    NO_ALIGN = 16,  // 1 << 4
    SHARE_ITEMS = 32,  // 1 << 5
    LINK_ROWS = 64,  // 1 << 6
    LINK_COLS = 128,  // 1 << 7
    LINK_ALL_X = 256,  // 1 << 8
    LINK_ALL_Y = 512,  // 1 << 9
    COL_MAJOR = 1024,  // 1 << 10
}
enum ImPlotTextFlags : const CInt
{
    NONE = 0,  // 0
    VERTICAL = 1024,  // 1 << 10
}
enum ImPlotTimeFmt : const CInt
{
    NONE = 0,  // 0
    US = 1,  // 1
    SUS = 2,  // 2
    SMS = 3,  // 3
    S = 4,  // 4
    MIN_SMS = 5,  // 5
    HR_MIN_SMS = 6,  // 6
    HR_MIN_S = 7,  // 7
    HR_MIN = 8,  // 8
    HR = 9,  // 9
}
enum ImPlotTimeUnit : const CInt
{
    US = 0,  // 0
    MS = 1,  // 1
    S = 2,  // 2
    MIN = 3,  // 3
    HR = 4,  // 4
    DAY = 5,  // 5
    MO = 6,  // 6
    YR = 7,  // 7
    COUNT = 8,  // 8
}
import libc;
import ig;
struct Formatter_Time_Data
{
    ImPlotTime time;
    ImPlotDateTimeSpec spec;
    ImPlotFormatter user_formatter;
    void* user_formatter_data;
}
struct ImPlotAlignmentData
{
    bool vertical;
    float pad_a;
    float pad_b;
    float pad_amax;
    float pad_bmax;
}
struct ImPlotAnnotation
{
    ImVec2 pos;
    ImVec2 offset;
    ImU32 color_bg;
    ImU32 color_fg;
    CInt text_offset;
    bool clamp;
}
struct ImPlotAnnotationCollection
{
    ImVector annotations;
    ImGuiTextBuffer text_buffer;
    CInt size;
}
struct ImPlotAxis
{
    ImGuiID id;
    ImPlotAxisFlags flags;
    ImPlotAxisFlags previous_flags;
    ImPlotRange range;
    ImPlotCond range_cond;
    ImPlotScale scale;
    ImPlotRange fit_extents;
    ImPlotAxis* ortho_axis;
    ImPlotRange constraint_range;
    ImPlotRange constraint_zoom;
    ImPlotTicker ticker;
    ImPlotFormatter formatter;
    void* formatter_data;
    char[16] format_spec;
    ImPlotLocator locator;
    double* linked_min;
    double* linked_max;
    CInt picker_level;
    ImPlotTime picker_time_min;
    ImPlotTime picker_time_max;
    ImPlotTransform transform_forward;
    ImPlotTransform transform_inverse;
    void* transform_data;
    float pixel_min;
    float pixel_max;
    double scale_min;
    double scale_max;
    double scale_to_pixel;
    float datum1;
    float datum2;
    ImRect hover_rect;
    CInt label_offset;
    ImU32 color_maj;
    ImU32 color_min;
    ImU32 color_tick;
    ImU32 color_txt;
    ImU32 color_bg;
    ImU32 color_hov;
    ImU32 color_act;
    ImU32 color_hi_li;
    bool enabled;
    bool vertical;
    bool fit_this_frame;
    bool has_range;
    bool has_format_spec;
    bool show_default_ticks;
    bool hovered;
    bool held;
}
struct ImPlotColormapData
{
    ImVector keys;
    ImVector key_counts;
    ImVector key_offsets;
    ImVector tables;
    ImVector table_sizes;
    ImVector table_offsets;
    ImGuiTextBuffer text;
    ImVector text_offsets;
    ImVector quals;
    ImGuiStorage map;
    CInt count;
}
struct ImPlotContext
{
    ImPool plots;
    ImPool subplots;
    ImPlotPlot* current_plot;
    ImPlotSubplot* current_subplot;
    ImPlotItemGroup* current_items;
    ImPlotItem* current_item;
    ImPlotItem* previous_item;
    ImPlotTicker cticker;
    ImPlotAnnotationCollection annotations;
    ImPlotTagCollection tags;
    ImPlotStyle style;
    ImVector color_modifiers;
    ImVector style_modifiers;
    ImPlotColormapData colormap_data;
    ImVector colormap_modifiers;
    libc::Tm tm;
    ImVector temp_double1;
    ImVector temp_double2;
    ImVector temp_int1;
    CInt digital_plot_item_cnt;
    CInt digital_plot_offset;
    ImPlotNextPlotData next_plot_data;
    ImPlotNextItemData next_item_data;
    ImPlotInputMap input_map;
    bool open_context_this_frame;
    ImGuiTextBuffer mouse_pos_string_builder;
    ImPlotItemGroup* sort_items;
    ImPool alignment_data;
    ImPlotAlignmentData* current_alignment_h;
    ImPlotAlignmentData* current_alignment_v;
}
struct ImPlotDateTimeSpec
{
    ImPlotDateFmt date;
    ImPlotTimeFmt time;
    bool use_iso8601;
    bool use24_hour_clock;
}
struct ImPlotInputMap
{
    ImGuiMouseButton pan;
    CInt pan_mod;
    ImGuiMouseButton fit;
    ImGuiMouseButton select;
    ImGuiMouseButton select_cancel;
    CInt select_mod;
    CInt select_horz_mod;
    CInt select_vert_mod;
    ImGuiMouseButton menu;
    CInt override_mod;
    CInt zoom_mod;
    float zoom_rate;
}
struct ImPlotItem
{
    ImGuiID id;
    ImU32 color;
    ImRect legend_hover_rect;
    CInt name_offset;
    bool show;
    bool legend_hovered;
    bool seen_this_frame;
}
struct ImPlotItemGroup
{
    ImGuiID id;
    ImPlotLegend legend;
    ImPool item_pool;
    CInt colormap_idx;
}
struct ImPlotLegend
{
    ImPlotLegendFlags flags;
    ImPlotLegendFlags previous_flags;
    ImPlotLocation location;
    ImPlotLocation previous_location;
    ImVec2 scroll;
    ImVector indices;
    ImGuiTextBuffer labels;
    ImRect rect;
    ImRect rect_clamped;
    bool hovered;
    bool held;
    bool can_go_inside;
}
struct ImPlotNextItemData
{
    ImVec4[5] colors;
    float line_weight;
    ImPlotMarker marker;
    float marker_size;
    float marker_weight;
    float fill_alpha;
    float error_bar_size;
    float error_bar_weight;
    float digital_bit_height;
    float digital_bit_gap;
    bool render_line;
    bool render_fill;
    bool render_marker_line;
    bool render_marker_fill;
    bool has_hidden;
    bool hidden;
    ImPlotCond hidden_cond;
}
struct ImPlotNextPlotData
{
    ImPlotCond[(usz)ImAxis.COUNT] range_cond;
    ImPlotRange[(usz)ImAxis.COUNT] range;
    bool[(usz)ImAxis.COUNT] has_range;
    bool[(usz)ImAxis.COUNT] fit;
    double*[(usz)ImAxis.COUNT] linked_min;
    double*[(usz)ImAxis.COUNT] linked_max;
}
struct ImPlotPlot
{
    ImGuiID id;
    ImPlotFlags flags;
    ImPlotFlags previous_flags;
    ImPlotLocation mouse_text_location;
    ImPlotMouseTextFlags mouse_text_flags;
    ImPlotAxis[(usz)ImAxis.COUNT] axes;
    ImGuiTextBuffer text_buffer;
    ImPlotItemGroup items;
    ImAxis current_x;
    ImAxis current_y;
    ImRect frame_rect;
    ImRect canvas_rect;
    ImRect plot_rect;
    ImRect axes_rect;
    ImRect select_rect;
    ImVec2 select_start;
    CInt title_offset;
    bool just_created;
    bool initialized;
    bool setup_locked;
    bool fit_this_frame;
    bool hovered;
    bool held;
    bool selecting;
    bool selected;
    bool context_locked;
}
struct ImPlotPoint
{
    double x;
    double y;
}
struct ImPlotPointError
{
    double x;
    double y;
    double neg;
    double pos;
}
struct ImPlotRange
{
    double min;
    double max;
}
struct ImPlotRect
{
    ImPlotRange x;
    ImPlotRange y;
}
struct ImPlotStyle
{
    float line_weight;
    CInt marker;
    float marker_size;
    float marker_weight;
    float fill_alpha;
    float error_bar_size;
    float error_bar_weight;
    float digital_bit_height;
    float digital_bit_gap;
    float plot_border_size;
    float minor_alpha;
    ImVec2 major_tick_len;
    ImVec2 minor_tick_len;
    ImVec2 major_tick_size;
    ImVec2 minor_tick_size;
    ImVec2 major_grid_size;
    ImVec2 minor_grid_size;
    ImVec2 plot_padding;
    ImVec2 label_padding;
    ImVec2 legend_padding;
    ImVec2 legend_inner_padding;
    ImVec2 legend_spacing;
    ImVec2 mouse_pos_padding;
    ImVec2 annotation_padding;
    ImVec2 fit_padding;
    ImVec2 plot_default_size;
    ImVec2 plot_min_size;
    ImVec4[(usz)ImPlotCol.COUNT] colors;
    ImPlotColormap colormap;
    bool use_local_time;
    bool use_iso8601;
    bool use24_hour_clock;
}
struct ImPlotSubplot
{
    ImGuiID id;
    ImPlotSubplotFlags flags;
    ImPlotSubplotFlags previous_flags;
    ImPlotItemGroup items;
    CInt rows;
    CInt cols;
    CInt current_idx;
    ImRect frame_rect;
    ImRect grid_rect;
    ImVec2 cell_size;
    ImVector row_alignment_data;
    ImVector col_alignment_data;
    ImVector row_ratios;
    ImVector col_ratios;
    ImVector row_link_data;
    ImVector col_link_data;
    float[2] temp_sizes;
    bool frame_hovered;
    bool has_title;
}
struct ImPlotTag
{
    ImAxis axis;
    double value;
    ImU32 color_bg;
    ImU32 color_fg;
    CInt text_offset;
}
struct ImPlotTagCollection
{
    ImVector tags;
    ImGuiTextBuffer text_buffer;
    CInt size;
}
struct ImPlotTick
{
    double plot_pos;
    float pixel_pos;
    ImVec2 label_size;
    CInt text_offset;
    bool major;
    bool show_label;
    CInt level;
    CInt idx;
}
struct ImPlotTicker
{
    ImVector ticks;
    ImGuiTextBuffer text_buffer;
    ImVec2 max_size;
    ImVec2 late_size;
    CInt levels;
}
struct ImPlotTime
{
    libc::Time_t s;
    CInt us;
}
alias ImPlotFormatter = fn int(double value, ZString buff, CInt size, void* user_data);
alias ImPlotGetter = fn ImPlotPoint(CInt idx, void* user_data);
alias ImPlotLocator = fn void(ImPlotTicker* ticker, ImPlotRange* range, float pixels, bool vertical, ImPlotFormatter formatter, void* formatter_data);
alias ImPlotTransform = fn double(double value, void* user_data);
extern fn void ImPlotAlignmentData.begin(ImPlotAlignmentData* self) @extern("ImPlotAlignmentData_Begin");
extern fn void ImPlotAlignmentData.end(ImPlotAlignmentData* self) @extern("ImPlotAlignmentData_End");
extern fn ImPlotAlignmentData* new_im_plot_alignment_data() @extern("ImPlotAlignmentData_ImPlotAlignmentData");
extern fn void ImPlotAlignmentData.reset(ImPlotAlignmentData* self) @extern("ImPlotAlignmentData_Reset");
extern fn void ImPlotAlignmentData.update(ImPlotAlignmentData* self, float* pad_a, float* pad_b, float* delta_a, float* delta_b) @extern("ImPlotAlignmentData_Update");
extern fn void ImPlotAlignmentData.destroy(ImPlotAlignmentData* self) @extern("ImPlotAlignmentData_destroy");
extern fn void ImPlotAnnotationCollection.append(ImPlotAnnotationCollection* self, ImVec2 pos, ImVec2 off, ImU32 bg, ImU32 fg, bool clamp, ZString fmt, ...) @extern("ImPlotAnnotationCollection_Append");
extern fn ZString ImPlotAnnotationCollection.get_text(ImPlotAnnotationCollection* self, CInt idx) @extern("ImPlotAnnotationCollection_GetText");
extern fn ImPlotAnnotationCollection* new_im_plot_annotation_collection() @extern("ImPlotAnnotationCollection_ImPlotAnnotationCollection");
extern fn void ImPlotAnnotationCollection.reset(ImPlotAnnotationCollection* self) @extern("ImPlotAnnotationCollection_Reset");
extern fn void ImPlotAnnotationCollection.destroy(ImPlotAnnotationCollection* self) @extern("ImPlotAnnotationCollection_destroy");
extern fn ImPlotAnnotation* new_im_plot_annotation() @extern("ImPlotAnnotation_ImPlotAnnotation");
extern fn void ImPlotAnnotation.destroy(ImPlotAnnotation* self) @extern("ImPlotAnnotation_destroy");
extern fn void ImPlotAxis.apply_fit(ImPlotAxis* self, float padding) @extern("ImPlotAxis_ApplyFit");
extern fn bool ImPlotAxis.can_init_fit(ImPlotAxis* self) @extern("ImPlotAxis_CanInitFit");
extern fn void ImPlotAxis.constrain(ImPlotAxis* self) @extern("ImPlotAxis_Constrain");
extern fn void ImPlotAxis.extend_fit(ImPlotAxis* self, double v) @extern("ImPlotAxis_ExtendFit");
extern fn void ImPlotAxis.extend_fit_with(ImPlotAxis* self, ImPlotAxis* alt, double v, double v_alt) @extern("ImPlotAxis_ExtendFitWith");
extern fn double ImPlotAxis.get_aspect(ImPlotAxis* self) @extern("ImPlotAxis_GetAspect");
extern fn bool ImPlotAxis.has_grid_lines(ImPlotAxis* self) @extern("ImPlotAxis_HasGridLines");
extern fn bool ImPlotAxis.has_label(ImPlotAxis* self) @extern("ImPlotAxis_HasLabel");
extern fn bool ImPlotAxis.has_menus(ImPlotAxis* self) @extern("ImPlotAxis_HasMenus");
extern fn bool ImPlotAxis.has_tick_labels(ImPlotAxis* self) @extern("ImPlotAxis_HasTickLabels");
extern fn bool ImPlotAxis.has_tick_marks(ImPlotAxis* self) @extern("ImPlotAxis_HasTickMarks");
extern fn ImPlotAxis* new_im_plot_axis() @extern("ImPlotAxis_ImPlotAxis");
extern fn bool ImPlotAxis.is_auto_fitting(ImPlotAxis* self) @extern("ImPlotAxis_IsAutoFitting");
extern fn bool ImPlotAxis.is_foreground(ImPlotAxis* self) @extern("ImPlotAxis_IsForeground");
extern fn bool ImPlotAxis.is_input_locked(ImPlotAxis* self) @extern("ImPlotAxis_IsInputLocked");
extern fn bool ImPlotAxis.is_input_locked_max(ImPlotAxis* self) @extern("ImPlotAxis_IsInputLockedMax");
extern fn bool ImPlotAxis.is_input_locked_min(ImPlotAxis* self) @extern("ImPlotAxis_IsInputLockedMin");
extern fn bool ImPlotAxis.is_inverted(ImPlotAxis* self) @extern("ImPlotAxis_IsInverted");
extern fn bool ImPlotAxis.is_locked(ImPlotAxis* self) @extern("ImPlotAxis_IsLocked");
extern fn bool ImPlotAxis.is_locked_max(ImPlotAxis* self) @extern("ImPlotAxis_IsLockedMax");
extern fn bool ImPlotAxis.is_locked_min(ImPlotAxis* self) @extern("ImPlotAxis_IsLockedMin");
extern fn bool ImPlotAxis.is_opposite(ImPlotAxis* self) @extern("ImPlotAxis_IsOpposite");
extern fn bool ImPlotAxis.is_pan_locked(ImPlotAxis* self, bool increasing) @extern("ImPlotAxis_IsPanLocked");
extern fn bool ImPlotAxis.is_range_locked(ImPlotAxis* self) @extern("ImPlotAxis_IsRangeLocked");
extern fn float ImPlotAxis.pixel_size(ImPlotAxis* self) @extern("ImPlotAxis_PixelSize");
extern fn double ImPlotAxis.pixels_to_plot(ImPlotAxis* self, float pix) @extern("ImPlotAxis_PixelsToPlot");
extern fn float ImPlotAxis.plot_to_pixels(ImPlotAxis* self, double plt) @extern("ImPlotAxis_PlotToPixels");
extern fn void ImPlotAxis.pull_links(ImPlotAxis* self) @extern("ImPlotAxis_PullLinks");
extern fn void ImPlotAxis.push_links(ImPlotAxis* self) @extern("ImPlotAxis_PushLinks");
extern fn void ImPlotAxis.reset(ImPlotAxis* self) @extern("ImPlotAxis_Reset");
extern fn void ImPlotAxis.set_aspect(ImPlotAxis* self, double unit_per_pix) @extern("ImPlotAxis_SetAspect");
extern fn bool ImPlotAxis.set_max(ImPlotAxis* self, double max, bool force = false) @extern("ImPlotAxis_SetMax");
extern fn bool ImPlotAxis.set_min(ImPlotAxis* self, double min, bool force = false) @extern("ImPlotAxis_SetMin");
extern fn void ImPlotAxis.set_range_double(ImPlotAxis* self, double v1, double v2) @extern("ImPlotAxis_SetRange_double");
extern fn void ImPlotAxis.set_range_plot_range(ImPlotAxis* self, ImPlotRange range) @extern("ImPlotAxis_SetRange_PlotRange");
extern fn void ImPlotAxis.update_transform_cache(ImPlotAxis* self) @extern("ImPlotAxis_UpdateTransformCache");
extern fn bool ImPlotAxis.will_render(ImPlotAxis* self) @extern("ImPlotAxis_WillRender");
extern fn void ImPlotAxis.destroy(ImPlotAxis* self) @extern("ImPlotAxis_destroy");
extern fn CInt ImPlotColormapData.append(ImPlotColormapData* self, ZString name, ImU32* keys, CInt count, bool qual) @extern("ImPlotColormapData_Append");
extern fn ImPlotColormap ImPlotColormapData.get_index(ImPlotColormapData* self, ZString name) @extern("ImPlotColormapData_GetIndex");
extern fn ImU32 ImPlotColormapData.get_key_color(ImPlotColormapData* self, ImPlotColormap cmap, CInt idx) @extern("ImPlotColormapData_GetKeyColor");
extern fn CInt ImPlotColormapData.get_key_count(ImPlotColormapData* self, ImPlotColormap cmap) @extern("ImPlotColormapData_GetKeyCount");
extern fn ImU32* ImPlotColormapData.get_keys(ImPlotColormapData* self, ImPlotColormap cmap) @extern("ImPlotColormapData_GetKeys");
extern fn ZString ImPlotColormapData.get_name(ImPlotColormapData* self, ImPlotColormap cmap) @extern("ImPlotColormapData_GetName");
extern fn ImU32* ImPlotColormapData.get_table(ImPlotColormapData* self, ImPlotColormap cmap) @extern("ImPlotColormapData_GetTable");
extern fn ImU32 ImPlotColormapData.get_table_color(ImPlotColormapData* self, ImPlotColormap cmap, CInt idx) @extern("ImPlotColormapData_GetTableColor");
extern fn CInt ImPlotColormapData.get_table_size(ImPlotColormapData* self, ImPlotColormap cmap) @extern("ImPlotColormapData_GetTableSize");
extern fn ImPlotColormapData* new_im_plot_colormap_data() @extern("ImPlotColormapData_ImPlotColormapData");
extern fn bool ImPlotColormapData.is_qual(ImPlotColormapData* self, ImPlotColormap cmap) @extern("ImPlotColormapData_IsQual");
extern fn ImU32 ImPlotColormapData.lerp_table(ImPlotColormapData* self, ImPlotColormap cmap, float t) @extern("ImPlotColormapData_LerpTable");
extern fn void ImPlotColormapData.rebuild_tables(ImPlotColormapData* self) @extern("ImPlotColormapData_RebuildTables");
extern fn void ImPlotColormapData.set_key_color(ImPlotColormapData* self, ImPlotColormap cmap, CInt idx, ImU32 value) @extern("ImPlotColormapData_SetKeyColor");
extern fn void ImPlotColormapData.append_table(ImPlotColormapData* self, ImPlotColormap cmap) @extern("ImPlotColormapData__AppendTable");
extern fn void ImPlotColormapData.destroy(ImPlotColormapData* self) @extern("ImPlotColormapData_destroy");
extern fn ImPlotDateTimeSpec* new_im_plot_date_time_spec_nil() @extern("ImPlotDateTimeSpec_ImPlotDateTimeSpec_Nil");
extern fn ImPlotDateTimeSpec* new_im_plot_date_time_spec_plot_date_fmt(ImPlotDateFmt date_fmt, ImPlotTimeFmt time_fmt, bool use_24_hr_clk = false, bool use_iso_8601 = false) @extern("ImPlotDateTimeSpec_ImPlotDateTimeSpec_PlotDateFmt");
extern fn void ImPlotDateTimeSpec.destroy(ImPlotDateTimeSpec* self) @extern("ImPlotDateTimeSpec_destroy");
extern fn ImPlotInputMap* new_im_plot_input_map() @extern("ImPlotInputMap_ImPlotInputMap");
extern fn void ImPlotInputMap.destroy(ImPlotInputMap* self) @extern("ImPlotInputMap_destroy");
extern fn ImPlotItem* ImPlotItemGroup.get_item_by_id(ImPlotItemGroup* self, ImGuiID id) @extern("ImPlotItemGroup_GetItem_ID");
extern fn ImPlotItem* ImPlotItemGroup.get_item_str(ImPlotItemGroup* self, ZString label_id) @extern("ImPlotItemGroup_GetItem_Str");
extern fn ImPlotItem* ImPlotItemGroup.get_item_by_index(ImPlotItemGroup* self, CInt i) @extern("ImPlotItemGroup_GetItemByIndex");
extern fn CInt ImPlotItemGroup.get_item_count(ImPlotItemGroup* self) @extern("ImPlotItemGroup_GetItemCount");
extern fn ImGuiID ImPlotItemGroup.get_item_id(ImPlotItemGroup* self, ZString label_id) @extern("ImPlotItemGroup_GetItemID");
extern fn CInt ImPlotItemGroup.get_item_index(ImPlotItemGroup* self, ImPlotItem* item) @extern("ImPlotItemGroup_GetItemIndex");
extern fn CInt ImPlotItemGroup.get_legend_count(ImPlotItemGroup* self) @extern("ImPlotItemGroup_GetLegendCount");
extern fn ImPlotItem* ImPlotItemGroup.get_legend_item(ImPlotItemGroup* self, CInt i) @extern("ImPlotItemGroup_GetLegendItem");
extern fn ZString ImPlotItemGroup.get_legend_label(ImPlotItemGroup* self, CInt i) @extern("ImPlotItemGroup_GetLegendLabel");
extern fn ImPlotItem* ImPlotItemGroup.get_or_add_item(ImPlotItemGroup* self, ImGuiID id) @extern("ImPlotItemGroup_GetOrAddItem");
extern fn ImPlotItemGroup* new_im_plot_item_group() @extern("ImPlotItemGroup_ImPlotItemGroup");
extern fn void ImPlotItemGroup.reset(ImPlotItemGroup* self) @extern("ImPlotItemGroup_Reset");
extern fn void ImPlotItemGroup.destroy(ImPlotItemGroup* self) @extern("ImPlotItemGroup_destroy");
extern fn ImPlotItem* new_im_plot_item() @extern("ImPlotItem_ImPlotItem");
extern fn void ImPlotItem.destroy(ImPlotItem* self) @extern("ImPlotItem_destroy");
extern fn ImPlotLegend* new_im_plot_legend() @extern("ImPlotLegend_ImPlotLegend");
extern fn void ImPlotLegend.reset(ImPlotLegend* self) @extern("ImPlotLegend_Reset");
extern fn void ImPlotLegend.destroy(ImPlotLegend* self) @extern("ImPlotLegend_destroy");
extern fn ImPlotNextItemData* new_im_plot_next_item_data() @extern("ImPlotNextItemData_ImPlotNextItemData");
extern fn void ImPlotNextItemData.reset(ImPlotNextItemData* self) @extern("ImPlotNextItemData_Reset");
extern fn void ImPlotNextItemData.destroy(ImPlotNextItemData* self) @extern("ImPlotNextItemData_destroy");
extern fn ImPlotNextPlotData* new_im_plot_next_plot_data() @extern("ImPlotNextPlotData_ImPlotNextPlotData");
extern fn void ImPlotNextPlotData.reset(ImPlotNextPlotData* self) @extern("ImPlotNextPlotData_Reset");
extern fn void ImPlotNextPlotData.destroy(ImPlotNextPlotData* self) @extern("ImPlotNextPlotData_destroy");
extern fn void ImPlotPlot.clear_text_buffer(ImPlotPlot* self) @extern("ImPlotPlot_ClearTextBuffer");
extern fn CInt ImPlotPlot.enabled_axes_x(ImPlotPlot* self) @extern("ImPlotPlot_EnabledAxesX");
extern fn CInt ImPlotPlot.enabled_axes_y(ImPlotPlot* self) @extern("ImPlotPlot_EnabledAxesY");
extern fn ZString ImPlotPlot.get_axis_label(ImPlotPlot* self, ImPlotAxis axis) @extern("ImPlotPlot_GetAxisLabel");
extern fn ZString ImPlotPlot.get_title(ImPlotPlot* self) @extern("ImPlotPlot_GetTitle");
extern fn bool ImPlotPlot.has_title(ImPlotPlot* self) @extern("ImPlotPlot_HasTitle");
extern fn ImPlotPlot* new_im_plot_plot() @extern("ImPlotPlot_ImPlotPlot");
extern fn bool ImPlotPlot.is_input_locked(ImPlotPlot* self) @extern("ImPlotPlot_IsInputLocked");
extern fn void ImPlotPlot.set_axis_label(ImPlotPlot* self, ImPlotAxis* axis, ZString label) @extern("ImPlotPlot_SetAxisLabel");
extern fn void ImPlotPlot.set_title(ImPlotPlot* self, ZString title) @extern("ImPlotPlot_SetTitle");
extern fn ImPlotAxis* ImPlotPlot.xaxis_nil(ImPlotPlot* self, CInt i) @extern("ImPlotPlot_XAxis_Nil");
extern fn ImPlotAxis* ImPlotPlot.xaxis_const(ImPlotPlot* self, CInt i) @extern("ImPlotPlot_XAxis__const");
extern fn ImPlotAxis* ImPlotPlot.yaxis_nil(ImPlotPlot* self, CInt i) @extern("ImPlotPlot_YAxis_Nil");
extern fn ImPlotAxis* ImPlotPlot.yaxis_const(ImPlotPlot* self, CInt i) @extern("ImPlotPlot_YAxis__const");
extern fn void ImPlotPlot.destroy(ImPlotPlot* self) @extern("ImPlotPlot_destroy");
extern fn ImPlotPointError* new_im_plot_point_error(double x, double y, double neg, double pos) @extern("ImPlotPointError_ImPlotPointError");
extern fn void ImPlotPointError.destroy(ImPlotPointError* self) @extern("ImPlotPointError_destroy");
extern fn ImPlotPoint* new_im_plot_point_nil() @extern("ImPlotPoint_ImPlotPoint_Nil");
extern fn ImPlotPoint* new_im_plot_point_double(double x, double y) @extern("ImPlotPoint_ImPlotPoint_double");
extern fn ImPlotPoint* new_im_plot_point_vec2(ImVec2 p) @extern("ImPlotPoint_ImPlotPoint_Vec2");
extern fn void ImPlotPoint.destroy(ImPlotPoint* self) @extern("ImPlotPoint_destroy");
extern fn double ImPlotRange.clamp(ImPlotRange* self, double value) @extern("ImPlotRange_Clamp");
extern fn bool ImPlotRange.contains(ImPlotRange* self, double value) @extern("ImPlotRange_Contains");
extern fn ImPlotRange* new_im_plot_range_nil() @extern("ImPlotRange_ImPlotRange_Nil");
extern fn ImPlotRange* new_im_plot_range_double(double min, double max) @extern("ImPlotRange_ImPlotRange_double");
extern fn double ImPlotRange.size(ImPlotRange* self) @extern("ImPlotRange_Size");
extern fn void ImPlotRange.destroy(ImPlotRange* self) @extern("ImPlotRange_destroy");
extern fn void im_plot_rect_clamp_plot_po_int(ImPlotPoint* p_out, ImPlotRect* self, ImPlotPoint p) @extern("ImPlotRect_Clamp_PlotPoInt");
extern fn void im_plot_rect_clamp_double(ImPlotPoint* p_out, ImPlotRect* self, double x, double y) @extern("ImPlotRect_Clamp_double");
extern fn bool ImPlotRect.contains_plot_po_int(ImPlotRect* self, ImPlotPoint p) @extern("ImPlotRect_Contains_PlotPoInt");
extern fn bool ImPlotRect.contains_double(ImPlotRect* self, double x, double y) @extern("ImPlotRect_Contains_double");
extern fn ImPlotRect* new_im_plot_rect_nil() @extern("ImPlotRect_ImPlotRect_Nil");
extern fn ImPlotRect* new_im_plot_rect_double(double x_min, double x_max, double y_min, double y_max) @extern("ImPlotRect_ImPlotRect_double");
extern fn void im_plot_rect_max(ImPlotPoint* p_out, ImPlotRect* self) @extern("ImPlotRect_Max");
extern fn void im_plot_rect_min(ImPlotPoint* p_out, ImPlotRect* self) @extern("ImPlotRect_Min");
extern fn void im_plot_rect_size(ImPlotPoint* p_out, ImPlotRect* self) @extern("ImPlotRect_Size");
extern fn void ImPlotRect.destroy(ImPlotRect* self) @extern("ImPlotRect_destroy");
extern fn ImPlotStyle* new_im_plot_style() @extern("ImPlotStyle_ImPlotStyle");
extern fn void ImPlotStyle.destroy(ImPlotStyle* self) @extern("ImPlotStyle_destroy");
extern fn ImPlotSubplot* new_im_plot_subplot() @extern("ImPlotSubplot_ImPlotSubplot");
extern fn void ImPlotSubplot.destroy(ImPlotSubplot* self) @extern("ImPlotSubplot_destroy");
extern fn void ImPlotTagCollection.append(ImPlotTagCollection* self, ImAxis axis, double value, ImU32 bg, ImU32 fg, ZString fmt, ...) @extern("ImPlotTagCollection_Append");
extern fn ZString ImPlotTagCollection.get_text(ImPlotTagCollection* self, CInt idx) @extern("ImPlotTagCollection_GetText");
extern fn ImPlotTagCollection* new_im_plot_tag_collection() @extern("ImPlotTagCollection_ImPlotTagCollection");
extern fn void ImPlotTagCollection.reset(ImPlotTagCollection* self) @extern("ImPlotTagCollection_Reset");
extern fn void ImPlotTagCollection.destroy(ImPlotTagCollection* self) @extern("ImPlotTagCollection_destroy");
extern fn ImPlotTick* new_im_plot_tick(double value, bool major, CInt level, bool show_label) @extern("ImPlotTick_ImPlotTick");
extern fn void ImPlotTick.destroy(ImPlotTick* self) @extern("ImPlotTick_destroy");
extern fn ImPlotTick* ImPlotTicker.add_tick_double_str(ImPlotTicker* self, double value, bool major, CInt level, bool show_label, ZString label) @extern("ImPlotTicker_AddTick_doubleStr");
extern fn ImPlotTick* ImPlotTicker.add_tick_double_plot_formatter(ImPlotTicker* self, double value, bool major, CInt level, bool show_label, ImPlotFormatter formatter, void* data) @extern("ImPlotTicker_AddTick_doublePlotFormatter");
extern fn ImPlotTick* ImPlotTicker.add_tick_plot_tick(ImPlotTicker* self, ImPlotTick tick) @extern("ImPlotTicker_AddTick_PlotTick");
extern fn ZString ImPlotTicker.get_text_int(ImPlotTicker* self, CInt idx) @extern("ImPlotTicker_GetText_Int");
extern fn ZString ImPlotTicker.get_text_plot_tick(ImPlotTicker* self, ImPlotTick tick) @extern("ImPlotTicker_GetText_PlotTick");
extern fn ImPlotTicker* new_im_plot_ticker() @extern("ImPlotTicker_ImPlotTicker");
extern fn void ImPlotTicker.override_size_late(ImPlotTicker* self, ImVec2 size) @extern("ImPlotTicker_OverrideSizeLate");
extern fn void ImPlotTicker.reset(ImPlotTicker* self) @extern("ImPlotTicker_Reset");
extern fn CInt ImPlotTicker.tick_count(ImPlotTicker* self) @extern("ImPlotTicker_TickCount");
extern fn void ImPlotTicker.destroy(ImPlotTicker* self) @extern("ImPlotTicker_destroy");
extern fn void im_plot_time_from_double(ImPlotTime* p_out, double t) @extern("ImPlotTime_FromDouble");
extern fn ImPlotTime* new_im_plot_time_nil() @extern("ImPlotTime_ImPlotTime_Nil");
extern fn ImPlotTime* new_im_plot_time_time_t(libc::Time_t s, CInt us = 0) @extern("ImPlotTime_ImPlotTime_time_t");
extern fn void ImPlotTime.roll_over(ImPlotTime* self) @extern("ImPlotTime_RollOver");
extern fn double ImPlotTime.to_double(ImPlotTime* self) @extern("ImPlotTime_ToDouble");
extern fn void ImPlotTime.destroy(ImPlotTime* self) @extern("ImPlotTime_destroy");
extern fn ImPlotColormap add_colormap_vec4_ptr(ZString name, ImVec4* cols, CInt size, bool qual = true) @extern("ImPlot_AddColormap_Vec4Ptr");
extern fn ImPlotColormap add_colormap_u32_ptr(ZString name, ImU32* cols, CInt size, bool qual = true) @extern("ImPlot_AddColormap_U32Ptr");
extern fn void add_text_centered(ImDrawList* draw_list, ImVec2 top_center, ImU32 col, ZString text_begin, ZString text_end = null) @extern("ImPlot_AddTextCentered");
extern fn void add_text_vertical(ImDrawList* draw_list, ImVec2 pos, ImU32 col, ZString text_begin, ZString text_end = null) @extern("ImPlot_AddTextVertical");
extern fn void add_time(ImPlotTime* p_out, ImPlotTime t, ImPlotTimeUnit unit, CInt count) @extern("ImPlot_AddTime");
extern fn bool all_axes_input_locked(ImPlotAxis* axes, CInt count) @extern("ImPlot_AllAxesInputLocked");
extern fn void annotation_bool(double x, double y, ImVec4 col, ImVec2 pix_offset, bool clamp, bool round = false) @extern("ImPlot_Annotation_Bool");
extern fn void annotation_str(double x, double y, ImVec4 col, ImVec2 pix_offset, bool clamp, ZString fmt, ...) @extern("ImPlot_Annotation_Str");
extern fn bool any_axes_held(ImPlotAxis* axes, CInt count) @extern("ImPlot_AnyAxesHeld");
extern fn bool any_axes_hovered(ImPlotAxis* axes, CInt count) @extern("ImPlot_AnyAxesHovered");
extern fn bool any_axes_input_locked(ImPlotAxis* axes, CInt count) @extern("ImPlot_AnyAxesInputLocked");
extern fn bool begin_aligned_plots(ZString group_id, bool vertical = true) @extern("ImPlot_BeginAlignedPlots");
extern fn bool begin_drag_drop_source_axis(ImAxis axis, ImGuiDragDropFlags flags = 0) @extern("ImPlot_BeginDragDropSourceAxis");
extern fn bool begin_drag_drop_source_item(ZString label_id, ImGuiDragDropFlags flags = 0) @extern("ImPlot_BeginDragDropSourceItem");
extern fn bool begin_drag_drop_source_plot(ImGuiDragDropFlags flags = 0) @extern("ImPlot_BeginDragDropSourcePlot");
extern fn bool begin_drag_drop_target_axis(ImAxis axis) @extern("ImPlot_BeginDragDropTargetAxis");
extern fn bool begin_drag_drop_target_legend() @extern("ImPlot_BeginDragDropTargetLegend");
extern fn bool begin_drag_drop_target_plot() @extern("ImPlot_BeginDragDropTargetPlot");
extern fn bool begin_item(ZString label_id, ImPlotItemFlags flags = 0, ImPlotCol recolor_from = -1) @extern("ImPlot_BeginItem");
extern fn bool begin_legend_popup(ZString label_id, ImGuiMouseButton mouse_button = 1) @extern("ImPlot_BeginLegendPopup");
extern fn bool begin_plot(ZString title_id, ImVec2 size = {-1, 0}, ImPlotFlags flags = 0) @extern("ImPlot_BeginPlot");
extern fn bool begin_subplots(ZString title_id, CInt rows, CInt cols, ImVec2 size, ImPlotSubplotFlags flags = 0, float* row_ratios = null, float* col_ratios = null) @extern("ImPlot_BeginSubplots");
extern fn void bust_color_cache(ZString plot_title_id = null) @extern("ImPlot_BustColorCache");
extern fn void bust_item_cache() @extern("ImPlot_BustItemCache");
extern fn void bust_plot_cache() @extern("ImPlot_BustPlotCache");
extern fn ImU32 calc_hover_color(ImU32 col) @extern("ImPlot_CalcHoverColor");
extern fn void calc_legend_size(ImVec2* p_out, ImPlotItemGroup* items, ImVec2 pad, ImVec2 spacing, bool vertical) @extern("ImPlot_CalcLegendSize");
extern fn ImU32 calc_text_color_vec4(ImVec4 bg) @extern("ImPlot_CalcTextColor_Vec4");
extern fn ImU32 calc_text_color_u32(ImU32 bg) @extern("ImPlot_CalcTextColor_U32");
extern fn void calc_text_size_vertical(ImVec2* p_out, ZString text) @extern("ImPlot_CalcTextSizeVertical");
extern fn void calculate_bins_float_ptr(float* values, CInt count, ImPlotBin meth, ImPlotRange range, CInt* bins_out, double* width_out) @extern("ImPlot_CalculateBins_FloatPtr");
extern fn void calculate_bins_double_ptr(double* values, CInt count, ImPlotBin meth, ImPlotRange range, CInt* bins_out, double* width_out) @extern("ImPlot_CalculateBins_doublePtr");
extern fn void calculate_bins_s8_ptr(ImS8* values, CInt count, ImPlotBin meth, ImPlotRange range, CInt* bins_out, double* width_out) @extern("ImPlot_CalculateBins_S8Ptr");
extern fn void calculate_bins_u8_ptr(ImU8* values, CInt count, ImPlotBin meth, ImPlotRange range, CInt* bins_out, double* width_out) @extern("ImPlot_CalculateBins_U8Ptr");
extern fn void calculate_bins_s16_ptr(ImS16* values, CInt count, ImPlotBin meth, ImPlotRange range, CInt* bins_out, double* width_out) @extern("ImPlot_CalculateBins_S16Ptr");
extern fn void calculate_bins_u16_ptr(ImU16* values, CInt count, ImPlotBin meth, ImPlotRange range, CInt* bins_out, double* width_out) @extern("ImPlot_CalculateBins_U16Ptr");
extern fn void calculate_bins_s32_ptr(ImS32* values, CInt count, ImPlotBin meth, ImPlotRange range, CInt* bins_out, double* width_out) @extern("ImPlot_CalculateBins_S32Ptr");
extern fn void calculate_bins_u32_ptr(ImU32* values, CInt count, ImPlotBin meth, ImPlotRange range, CInt* bins_out, double* width_out) @extern("ImPlot_CalculateBins_U32Ptr");
extern fn void calculate_bins_s64_ptr(ImS64* values, CInt count, ImPlotBin meth, ImPlotRange range, CInt* bins_out, double* width_out) @extern("ImPlot_CalculateBins_S64Ptr");
extern fn void calculate_bins_u64_ptr(ImU64* values, CInt count, ImPlotBin meth, ImPlotRange range, CInt* bins_out, double* width_out) @extern("ImPlot_CalculateBins_U64Ptr");
extern fn void cancel_plot_selection() @extern("ImPlot_CancelPlotSelection");
extern fn void ceil_time(ImPlotTime* p_out, ImPlotTime t, ImPlotTimeUnit unit) @extern("ImPlot_CeilTime");
extern fn void clamp_label_pos(ImVec2* p_out, ImVec2 pos, ImVec2 size, ImVec2 min, ImVec2 max) @extern("ImPlot_ClampLabelPos");
extern fn bool clamp_legend_rect(ImRect* legend_rect, ImRect outer_rect, ImVec2 pad) @extern("ImPlot_ClampLegendRect");
extern fn bool colormap_button(ZString label, ImVec2 size = {}, ImPlotColormap cmap = -1) @extern("ImPlot_ColormapButton");
extern fn void colormap_icon(ImPlotColormap cmap) @extern("ImPlot_ColormapIcon");
extern fn void colormap_scale(ZString label, double scale_min, double scale_max, ImVec2 size = {}, ZString format = "%g", ImPlotColormapScaleFlags flags = 0, ImPlotColormap cmap = -1) @extern("ImPlot_ColormapScale");
extern fn bool colormap_slider(ZString label, float* t, ImVec4* out = null, ZString format = "", ImPlotColormap cmap = -1) @extern("ImPlot_ColormapSlider");
extern fn void combine_date_time(ImPlotTime* p_out, ImPlotTime date_part, ImPlotTime time_part) @extern("ImPlot_CombineDateTime");
extern fn ImPlotContext* create_context() @extern("ImPlot_CreateContext");
extern fn void destroy_context(ImPlotContext* ctx = null) @extern("ImPlot_DestroyContext");
extern fn bool drag_line_x(CInt id, double* x, ImVec4 col, float thickness = 1, ImPlotDragToolFlags flags = 0, bool* out_clicked = null, bool* out_hovered = null, bool* held = null) @extern("ImPlot_DragLineX");
extern fn bool drag_line_y(CInt id, double* y, ImVec4 col, float thickness = 1, ImPlotDragToolFlags flags = 0, bool* out_clicked = null, bool* out_hovered = null, bool* held = null) @extern("ImPlot_DragLineY");
extern fn bool drag_point(CInt id, double* x, double* y, ImVec4 col, float size = 4, ImPlotDragToolFlags flags = 0, bool* out_clicked = null, bool* out_hovered = null, bool* held = null) @extern("ImPlot_DragPoint");
extern fn bool drag_rect(CInt id, double* x1, double* y1, double* x2, double* y2, ImVec4 col, ImPlotDragToolFlags flags = 0, bool* out_clicked = null, bool* out_hovered = null, bool* held = null) @extern("ImPlot_DragRect");
extern fn void end_aligned_plots() @extern("ImPlot_EndAlignedPlots");
extern fn void end_drag_drop_source() @extern("ImPlot_EndDragDropSource");
extern fn void end_drag_drop_target() @extern("ImPlot_EndDragDropTarget");
extern fn void end_item() @extern("ImPlot_EndItem");
extern fn void end_legend_popup() @extern("ImPlot_EndLegendPopup");
extern fn void end_plot() @extern("ImPlot_EndPlot");
extern fn void end_subplots() @extern("ImPlot_EndSubplots");
extern fn void fill_range_vector_float_ptr(ImVector buffer, CInt n, float vmin, float vmax) @extern("ImPlot_FillRange_Vector_Float_Ptr");
extern fn void fill_range_vector_double_ptr(ImVector buffer, CInt n, double vmin, double vmax) @extern("ImPlot_FillRange_Vector_double_Ptr");
extern fn void fill_range_vector_s8_ptr(ImVector buffer, CInt n, ImS8 vmin, ImS8 vmax) @extern("ImPlot_FillRange_Vector_S8_Ptr");
extern fn void fill_range_vector_u8_ptr(ImVector buffer, CInt n, ImU8 vmin, ImU8 vmax) @extern("ImPlot_FillRange_Vector_U8_Ptr");
extern fn void fill_range_vector_s16_ptr(ImVector buffer, CInt n, ImS16 vmin, ImS16 vmax) @extern("ImPlot_FillRange_Vector_S16_Ptr");
extern fn void fill_range_vector_u16_ptr(ImVector buffer, CInt n, ImU16 vmin, ImU16 vmax) @extern("ImPlot_FillRange_Vector_U16_Ptr");
extern fn void fill_range_vector_s32_ptr(ImVector buffer, CInt n, ImS32 vmin, ImS32 vmax) @extern("ImPlot_FillRange_Vector_S32_Ptr");
extern fn void fill_range_vector_u32_ptr(ImVector buffer, CInt n, ImU32 vmin, ImU32 vmax) @extern("ImPlot_FillRange_Vector_U32_Ptr");
extern fn void fill_range_vector_s64_ptr(ImVector buffer, CInt n, ImS64 vmin, ImS64 vmax) @extern("ImPlot_FillRange_Vector_S64_Ptr");
extern fn void fill_range_vector_u64_ptr(ImVector buffer, CInt n, ImU64 vmin, ImU64 vmax) @extern("ImPlot_FillRange_Vector_U64_Ptr");
extern fn void fit_point(ImPlotPoint p) @extern("ImPlot_FitPoint");
extern fn void fit_point_x(double x) @extern("ImPlot_FitPointX");
extern fn void fit_point_y(double y) @extern("ImPlot_FitPointY");
extern fn bool fit_this_frame() @extern("ImPlot_FitThisFrame");
extern fn void floor_time(ImPlotTime* p_out, ImPlotTime t, ImPlotTimeUnit unit) @extern("ImPlot_FloorTime");
extern fn CInt format_date(ImPlotTime t, ZString buffer, CInt size, ImPlotDateFmt fmt, bool use_iso_8601) @extern("ImPlot_FormatDate");
extern fn CInt format_date_time(ImPlotTime t, ZString buffer, CInt size, ImPlotDateTimeSpec fmt) @extern("ImPlot_FormatDateTime");
extern fn CInt format_time(ImPlotTime t, ZString buffer, CInt size, ImPlotTimeFmt fmt, bool use_24_hr_clk) @extern("ImPlot_FormatTime");
extern fn CInt formatter_default(double value, ZString buff, CInt size, void* data) @extern("ImPlot_Formatter_Default");
extern fn CInt formatter_logit(double value, ZString buff, CInt size, void* noname1) @extern("ImPlot_Formatter_Logit");
extern fn CInt formatter_time(double noname1, ZString buff, CInt size, void* data) @extern("ImPlot_Formatter_Time");
extern fn void get_auto_color(ImVec4* p_out, ImPlotCol idx) @extern("ImPlot_GetAutoColor");
extern fn void get_colormap_color(ImVec4* p_out, CInt idx, ImPlotColormap cmap = -1) @extern("ImPlot_GetColormapColor");
extern fn ImU32 get_colormap_color_u32(CInt idx, ImPlotColormap cmap) @extern("ImPlot_GetColormapColorU32");
extern fn CInt get_colormap_count() @extern("ImPlot_GetColormapCount");
extern fn ImPlotColormap get_colormap_index(ZString name) @extern("ImPlot_GetColormapIndex");
extern fn ZString get_colormap_name(ImPlotColormap cmap) @extern("ImPlot_GetColormapName");
extern fn CInt get_colormap_size(ImPlotColormap cmap = -1) @extern("ImPlot_GetColormapSize");
extern fn ImPlotContext* get_current_context() @extern("ImPlot_GetCurrentContext");
extern fn ImPlotItem* get_current_item() @extern("ImPlot_GetCurrentItem");
extern fn ImPlotPlot* get_current_plot() @extern("ImPlot_GetCurrentPlot");
extern fn CInt get_days_in_month(CInt year, CInt month) @extern("ImPlot_GetDaysInMonth");
extern fn libc::Tm* get_gmt_time(ImPlotTime t, libc::Tm* ptm) @extern("ImPlot_GetGmtTime");
extern fn ImPlotInputMap* get_input_map() @extern("ImPlot_GetInputMap");
extern fn ImPlotItem* get_item(ZString label_id) @extern("ImPlot_GetItem");
extern fn ImPlotNextItemData* get_item_data() @extern("ImPlot_GetItemData");
extern fn void get_last_item_color(ImVec4* p_out) @extern("ImPlot_GetLastItemColor");
extern fn libc::Tm* get_loc_time(ImPlotTime t, libc::Tm* ptm) @extern("ImPlot_GetLocTime");
extern fn void get_location_pos(ImVec2* p_out, ImRect outer_rect, ImVec2 inner_size, ImPlotLocation location, ImVec2 pad = {}) @extern("ImPlot_GetLocationPos");
extern fn ZString get_marker_name(ImPlotMarker idx) @extern("ImPlot_GetMarkerName");
extern fn CInt get_month(ImPlotTime t) @extern("ImPlot_GetMonth");
extern fn ImPlotPlot* get_plot(ZString title) @extern("ImPlot_GetPlot");
extern fn ImDrawList* get_plot_draw_list() @extern("ImPlot_GetPlotDrawList");
extern fn void get_plot_limits(ImPlotRect* p_out, ImAxis x_axis = -1, ImAxis y_axis = -1) @extern("ImPlot_GetPlotLimits");
extern fn void get_plot_mouse_pos(ImPlotPoint* p_out, ImAxis x_axis = -1, ImAxis y_axis = -1) @extern("ImPlot_GetPlotMousePos");
extern fn void get_plot_pos(ImVec2* p_out) @extern("ImPlot_GetPlotPos");
extern fn void get_plot_selection(ImPlotRect* p_out, ImAxis x_axis = -1, ImAxis y_axis = -1) @extern("ImPlot_GetPlotSelection");
extern fn void get_plot_size(ImVec2* p_out) @extern("ImPlot_GetPlotSize");
extern fn ImPlotStyle* get_style() @extern("ImPlot_GetStyle");
extern fn ZString get_style_color_name(ImPlotCol idx) @extern("ImPlot_GetStyleColorName");
extern fn ImU32 get_style_color_u32(ImPlotCol idx) @extern("ImPlot_GetStyleColorU32");
extern fn void get_style_color_vec4(ImVec4* p_out, ImPlotCol idx) @extern("ImPlot_GetStyleColorVec4");
extern fn libc::Tm* get_time(ImPlotTime t, libc::Tm* ptm) @extern("ImPlot_GetTime");
extern fn CInt get_year(ImPlotTime t) @extern("ImPlot_GetYear");
extern fn void hide_next_item(bool hidden = true, ImPlotCond cond = ImPlotCond.ONCE) @extern("ImPlot_HideNextItem");
extern fn bool im_almost_equal(double v1, double v2, CInt ulp = 2) @extern("ImPlot_ImAlmostEqual");
extern fn ImU32 im_alpha_u32(ImU32 col, float alpha) @extern("ImPlot_ImAlphaU32");
extern fn float im_asinh_float(float x) @extern("ImPlot_ImAsinh_Float");
extern fn double im_asinh_double(double x) @extern("ImPlot_ImAsinh_double");
extern fn double im_constrain_inf(double val) @extern("ImPlot_ImConstrainInf");
extern fn double im_constrain_log(double val) @extern("ImPlot_ImConstrainLog");
extern fn double im_constrain_nan(double val) @extern("ImPlot_ImConstrainNan");
extern fn double im_constrain_time(double val) @extern("ImPlot_ImConstrainTime");
extern fn ImU32 im_lerp_u32(ImU32* colors, CInt size, float t) @extern("ImPlot_ImLerpU32");
extern fn float im_log10_float(float x) @extern("ImPlot_ImLog10_Float");
extern fn double im_log10_double(double x) @extern("ImPlot_ImLog10_double");
extern fn float im_max_array_float_ptr(float* values, CInt count) @extern("ImPlot_ImMaxArray_FloatPtr");
extern fn double im_max_array_double_ptr(double* values, CInt count) @extern("ImPlot_ImMaxArray_doublePtr");
extern fn ImS8 im_max_array_s8_ptr(ImS8* values, CInt count) @extern("ImPlot_ImMaxArray_S8Ptr");
extern fn ImU8 im_max_array_u8_ptr(ImU8* values, CInt count) @extern("ImPlot_ImMaxArray_U8Ptr");
extern fn ImS16 im_max_array_s16_ptr(ImS16* values, CInt count) @extern("ImPlot_ImMaxArray_S16Ptr");
extern fn ImU16 im_max_array_u16_ptr(ImU16* values, CInt count) @extern("ImPlot_ImMaxArray_U16Ptr");
extern fn ImS32 im_max_array_s32_ptr(ImS32* values, CInt count) @extern("ImPlot_ImMaxArray_S32Ptr");
extern fn ImU32 im_max_array_u32_ptr(ImU32* values, CInt count) @extern("ImPlot_ImMaxArray_U32Ptr");
extern fn ImS64 im_max_array_s64_ptr(ImS64* values, CInt count) @extern("ImPlot_ImMaxArray_S64Ptr");
extern fn ImU64 im_max_array_u64_ptr(ImU64* values, CInt count) @extern("ImPlot_ImMaxArray_U64Ptr");
extern fn double im_mean_float_ptr(float* values, CInt count) @extern("ImPlot_ImMean_FloatPtr");
extern fn double im_mean_double_ptr(double* values, CInt count) @extern("ImPlot_ImMean_doublePtr");
extern fn double im_mean_s8_ptr(ImS8* values, CInt count) @extern("ImPlot_ImMean_S8Ptr");
extern fn double im_mean_u8_ptr(ImU8* values, CInt count) @extern("ImPlot_ImMean_U8Ptr");
extern fn double im_mean_s16_ptr(ImS16* values, CInt count) @extern("ImPlot_ImMean_S16Ptr");
extern fn double im_mean_u16_ptr(ImU16* values, CInt count) @extern("ImPlot_ImMean_U16Ptr");
extern fn double im_mean_s32_ptr(ImS32* values, CInt count) @extern("ImPlot_ImMean_S32Ptr");
extern fn double im_mean_u32_ptr(ImU32* values, CInt count) @extern("ImPlot_ImMean_U32Ptr");
extern fn double im_mean_s64_ptr(ImS64* values, CInt count) @extern("ImPlot_ImMean_S64Ptr");
extern fn double im_mean_u64_ptr(ImU64* values, CInt count) @extern("ImPlot_ImMean_U64Ptr");
extern fn float im_min_array_float_ptr(float* values, CInt count) @extern("ImPlot_ImMinArray_FloatPtr");
extern fn double im_min_array_double_ptr(double* values, CInt count) @extern("ImPlot_ImMinArray_doublePtr");
extern fn ImS8 im_min_array_s8_ptr(ImS8* values, CInt count) @extern("ImPlot_ImMinArray_S8Ptr");
extern fn ImU8 im_min_array_u8_ptr(ImU8* values, CInt count) @extern("ImPlot_ImMinArray_U8Ptr");
extern fn ImS16 im_min_array_s16_ptr(ImS16* values, CInt count) @extern("ImPlot_ImMinArray_S16Ptr");
extern fn ImU16 im_min_array_u16_ptr(ImU16* values, CInt count) @extern("ImPlot_ImMinArray_U16Ptr");
extern fn ImS32 im_min_array_s32_ptr(ImS32* values, CInt count) @extern("ImPlot_ImMinArray_S32Ptr");
extern fn ImU32 im_min_array_u32_ptr(ImU32* values, CInt count) @extern("ImPlot_ImMinArray_U32Ptr");
extern fn ImS64 im_min_array_s64_ptr(ImS64* values, CInt count) @extern("ImPlot_ImMinArray_S64Ptr");
extern fn ImU64 im_min_array_u64_ptr(ImU64* values, CInt count) @extern("ImPlot_ImMinArray_U64Ptr");
extern fn void im_min_max_array_float_ptr(float* values, CInt count, float* min_out, float* max_out) @extern("ImPlot_ImMinMaxArray_FloatPtr");
extern fn void im_min_max_array_double_ptr(double* values, CInt count, double* min_out, double* max_out) @extern("ImPlot_ImMinMaxArray_doublePtr");
extern fn void im_min_max_array_s8_ptr(ImS8* values, CInt count, ImS8* min_out, ImS8* max_out) @extern("ImPlot_ImMinMaxArray_S8Ptr");
extern fn void im_min_max_array_u8_ptr(ImU8* values, CInt count, ImU8* min_out, ImU8* max_out) @extern("ImPlot_ImMinMaxArray_U8Ptr");
extern fn void im_min_max_array_s16_ptr(ImS16* values, CInt count, ImS16* min_out, ImS16* max_out) @extern("ImPlot_ImMinMaxArray_S16Ptr");
extern fn void im_min_max_array_u16_ptr(ImU16* values, CInt count, ImU16* min_out, ImU16* max_out) @extern("ImPlot_ImMinMaxArray_U16Ptr");
extern fn void im_min_max_array_s32_ptr(ImS32* values, CInt count, ImS32* min_out, ImS32* max_out) @extern("ImPlot_ImMinMaxArray_S32Ptr");
extern fn void im_min_max_array_u32_ptr(ImU32* values, CInt count, ImU32* min_out, ImU32* max_out) @extern("ImPlot_ImMinMaxArray_U32Ptr");
extern fn void im_min_max_array_s64_ptr(ImS64* values, CInt count, ImS64* min_out, ImS64* max_out) @extern("ImPlot_ImMinMaxArray_S64Ptr");
extern fn void im_min_max_array_u64_ptr(ImU64* values, CInt count, ImU64* min_out, ImU64* max_out) @extern("ImPlot_ImMinMaxArray_U64Ptr");
extern fn ImU32 im_mix_u32(ImU32 a, ImU32 b, ImU32 s) @extern("ImPlot_ImMixU32");
extern fn bool im_nan(double val) @extern("ImPlot_ImNan");
extern fn bool im_nan_or_inf(double val) @extern("ImPlot_ImNanOrInf");
extern fn bool im_overlaps_float(float min_a, float max_a, float min_b, float max_b) @extern("ImPlot_ImOverlaps_Float");
extern fn bool im_overlaps_double(double min_a, double max_a, double min_b, double max_b) @extern("ImPlot_ImOverlaps_double");
extern fn bool im_overlaps_s8(ImS8 min_a, ImS8 max_a, ImS8 min_b, ImS8 max_b) @extern("ImPlot_ImOverlaps_S8");
extern fn bool im_overlaps_u8(ImU8 min_a, ImU8 max_a, ImU8 min_b, ImU8 max_b) @extern("ImPlot_ImOverlaps_U8");
extern fn bool im_overlaps_s16(ImS16 min_a, ImS16 max_a, ImS16 min_b, ImS16 max_b) @extern("ImPlot_ImOverlaps_S16");
extern fn bool im_overlaps_u16(ImU16 min_a, ImU16 max_a, ImU16 min_b, ImU16 max_b) @extern("ImPlot_ImOverlaps_U16");
extern fn bool im_overlaps_s32(ImS32 min_a, ImS32 max_a, ImS32 min_b, ImS32 max_b) @extern("ImPlot_ImOverlaps_S32");
extern fn bool im_overlaps_u32(ImU32 min_a, ImU32 max_a, ImU32 min_b, ImU32 max_b) @extern("ImPlot_ImOverlaps_U32");
extern fn bool im_overlaps_s64(ImS64 min_a, ImS64 max_a, ImS64 min_b, ImS64 max_b) @extern("ImPlot_ImOverlaps_S64");
extern fn bool im_overlaps_u64(ImU64 min_a, ImU64 max_a, ImU64 min_b, ImU64 max_b) @extern("ImPlot_ImOverlaps_U64");
extern fn CInt im_pos_mod(CInt l, CInt r) @extern("ImPlot_ImPosMod");
extern fn float im_remap_float(float x, float x0, float x1, float y0, float y1) @extern("ImPlot_ImRemap_Float");
extern fn double im_remap_double(double x, double x0, double x1, double y0, double y1) @extern("ImPlot_ImRemap_double");
extern fn ImS8 im_remap_s8(ImS8 x, ImS8 x0, ImS8 x1, ImS8 y0, ImS8 y1) @extern("ImPlot_ImRemap_S8");
extern fn ImU8 im_remap_u8(ImU8 x, ImU8 x0, ImU8 x1, ImU8 y0, ImU8 y1) @extern("ImPlot_ImRemap_U8");
extern fn ImS16 im_remap_s16(ImS16 x, ImS16 x0, ImS16 x1, ImS16 y0, ImS16 y1) @extern("ImPlot_ImRemap_S16");
extern fn ImU16 im_remap_u16(ImU16 x, ImU16 x0, ImU16 x1, ImU16 y0, ImU16 y1) @extern("ImPlot_ImRemap_U16");
extern fn ImS32 im_remap_s32(ImS32 x, ImS32 x0, ImS32 x1, ImS32 y0, ImS32 y1) @extern("ImPlot_ImRemap_S32");
extern fn ImU32 im_remap_u32(ImU32 x, ImU32 x0, ImU32 x1, ImU32 y0, ImU32 y1) @extern("ImPlot_ImRemap_U32");
extern fn ImS64 im_remap_s64(ImS64 x, ImS64 x0, ImS64 x1, ImS64 y0, ImS64 y1) @extern("ImPlot_ImRemap_S64");
extern fn ImU64 im_remap_u64(ImU64 x, ImU64 x0, ImU64 x1, ImU64 y0, ImU64 y1) @extern("ImPlot_ImRemap_U64");
extern fn float im_remap01_float(float x, float x0, float x1) @extern("ImPlot_ImRemap01_Float");
extern fn double im_remap01_double(double x, double x0, double x1) @extern("ImPlot_ImRemap01_double");
extern fn ImS8 im_remap01_s8(ImS8 x, ImS8 x0, ImS8 x1) @extern("ImPlot_ImRemap01_S8");
extern fn ImU8 im_remap01_u8(ImU8 x, ImU8 x0, ImU8 x1) @extern("ImPlot_ImRemap01_U8");
extern fn ImS16 im_remap01_s16(ImS16 x, ImS16 x0, ImS16 x1) @extern("ImPlot_ImRemap01_S16");
extern fn ImU16 im_remap01_u16(ImU16 x, ImU16 x0, ImU16 x1) @extern("ImPlot_ImRemap01_U16");
extern fn ImS32 im_remap01_s32(ImS32 x, ImS32 x0, ImS32 x1) @extern("ImPlot_ImRemap01_S32");
extern fn ImU32 im_remap01_u32(ImU32 x, ImU32 x0, ImU32 x1) @extern("ImPlot_ImRemap01_U32");
extern fn ImS64 im_remap01_s64(ImS64 x, ImS64 x0, ImS64 x1) @extern("ImPlot_ImRemap01_S64");
extern fn ImU64 im_remap01_u64(ImU64 x, ImU64 x0, ImU64 x1) @extern("ImPlot_ImRemap01_U64");
extern fn float im_sinh_float(float x) @extern("ImPlot_ImSinh_Float");
extern fn double im_sinh_double(double x) @extern("ImPlot_ImSinh_double");
extern fn double im_std_dev_float_ptr(float* values, CInt count) @extern("ImPlot_ImStdDev_FloatPtr");
extern fn double im_std_dev_double_ptr(double* values, CInt count) @extern("ImPlot_ImStdDev_doublePtr");
extern fn double im_std_dev_s8_ptr(ImS8* values, CInt count) @extern("ImPlot_ImStdDev_S8Ptr");
extern fn double im_std_dev_u8_ptr(ImU8* values, CInt count) @extern("ImPlot_ImStdDev_U8Ptr");
extern fn double im_std_dev_s16_ptr(ImS16* values, CInt count) @extern("ImPlot_ImStdDev_S16Ptr");
extern fn double im_std_dev_u16_ptr(ImU16* values, CInt count) @extern("ImPlot_ImStdDev_U16Ptr");
extern fn double im_std_dev_s32_ptr(ImS32* values, CInt count) @extern("ImPlot_ImStdDev_S32Ptr");
extern fn double im_std_dev_u32_ptr(ImU32* values, CInt count) @extern("ImPlot_ImStdDev_U32Ptr");
extern fn double im_std_dev_s64_ptr(ImS64* values, CInt count) @extern("ImPlot_ImStdDev_S64Ptr");
extern fn double im_std_dev_u64_ptr(ImU64* values, CInt count) @extern("ImPlot_ImStdDev_U64Ptr");
extern fn float im_sum_float_ptr(float* values, CInt count) @extern("ImPlot_ImSum_FloatPtr");
extern fn double im_sum_double_ptr(double* values, CInt count) @extern("ImPlot_ImSum_doublePtr");
extern fn ImS8 im_sum_s8_ptr(ImS8* values, CInt count) @extern("ImPlot_ImSum_S8Ptr");
extern fn ImU8 im_sum_u8_ptr(ImU8* values, CInt count) @extern("ImPlot_ImSum_U8Ptr");
extern fn ImS16 im_sum_s16_ptr(ImS16* values, CInt count) @extern("ImPlot_ImSum_S16Ptr");
extern fn ImU16 im_sum_u16_ptr(ImU16* values, CInt count) @extern("ImPlot_ImSum_U16Ptr");
extern fn ImS32 im_sum_s32_ptr(ImS32* values, CInt count) @extern("ImPlot_ImSum_S32Ptr");
extern fn ImU32 im_sum_u32_ptr(ImU32* values, CInt count) @extern("ImPlot_ImSum_U32Ptr");
extern fn ImS64 im_sum_s64_ptr(ImS64* values, CInt count) @extern("ImPlot_ImSum_S64Ptr");
extern fn ImU64 im_sum_u64_ptr(ImU64* values, CInt count) @extern("ImPlot_ImSum_U64Ptr");
extern fn void initialize(ImPlotContext* ctx) @extern("ImPlot_Initialize");
extern fn void intersection(ImVec2* p_out, ImVec2 a1, ImVec2 a2, ImVec2 b1, ImVec2 b2) @extern("ImPlot_Intersection");
extern fn bool is_axis_hovered(ImAxis axis) @extern("ImPlot_IsAxisHovered");
extern fn bool is_color_auto_vec4(ImVec4 col) @extern("ImPlot_IsColorAuto_Vec4");
extern fn bool is_color_auto_plot_col(ImPlotCol idx) @extern("ImPlot_IsColorAuto_PlotCol");
extern fn bool is_leap_year(CInt year) @extern("ImPlot_IsLeapYear");
extern fn bool is_legend_entry_hovered(ZString label_id) @extern("ImPlot_IsLegendEntryHovered");
extern fn bool is_plot_hovered() @extern("ImPlot_IsPlotHovered");
extern fn bool is_plot_selected() @extern("ImPlot_IsPlotSelected");
extern fn bool is_subplots_hovered() @extern("ImPlot_IsSubplotsHovered");
extern fn void item_icon_vec4(ImVec4 col) @extern("ImPlot_ItemIcon_Vec4");
extern fn void item_icon_u32(ImU32 col) @extern("ImPlot_ItemIcon_U32");
extern fn void label_axis_value(ImPlotAxis axis, double value, ZString buff, CInt size, bool round = false) @extern("ImPlot_LabelAxisValue");
extern fn void locator_default(ImPlotTicker* ticker, ImPlotRange range, float pixels, bool vertical, ImPlotFormatter formatter, void* formatter_data) @extern("ImPlot_Locator_Default");
extern fn void locator_log10(ImPlotTicker* ticker, ImPlotRange range, float pixels, bool vertical, ImPlotFormatter formatter, void* formatter_data) @extern("ImPlot_Locator_Log10");
extern fn void locator_sym_log(ImPlotTicker* ticker, ImPlotRange range, float pixels, bool vertical, ImPlotFormatter formatter, void* formatter_data) @extern("ImPlot_Locator_SymLog");
extern fn void locator_time(ImPlotTicker* ticker, ImPlotRange range, float pixels, bool vertical, ImPlotFormatter formatter, void* formatter_data) @extern("ImPlot_Locator_Time");
extern fn void make_time(ImPlotTime* p_out, CInt year, CInt month = 0, CInt day = 1, CInt hour = 0, CInt min = 0, CInt sec = 0, CInt us = 0) @extern("ImPlot_MakeTime");
extern fn void map_input_default(ImPlotInputMap* dst = null) @extern("ImPlot_MapInputDefault");
extern fn void map_input_reverse(ImPlotInputMap* dst = null) @extern("ImPlot_MapInputReverse");
extern fn void mk_gmt_time(ImPlotTime* p_out, libc::Tm* ptm) @extern("ImPlot_MkGmtTime");
extern fn void mk_loc_time(ImPlotTime* p_out, libc::Tm* ptm) @extern("ImPlot_MkLocTime");
extern fn void mk_time(ImPlotTime* p_out, libc::Tm* ptm) @extern("ImPlot_MkTime");
extern fn void next_colormap_color(ImVec4* p_out) @extern("ImPlot_NextColormapColor");
extern fn ImU32 next_colormap_color_u32() @extern("ImPlot_NextColormapColorU32");
extern fn double nice_num(double x, bool round) @extern("ImPlot_NiceNum");
extern fn void now(ImPlotTime* p_out) @extern("ImPlot_Now");
extern fn CInt order_of_magnitude(double val) @extern("ImPlot_OrderOfMagnitude");
extern fn CInt order_to_precision(CInt order) @extern("ImPlot_OrderToPrecision");
extern fn void pixels_to_plot_vec2(ImPlotPoint* p_out, ImVec2 pix, ImAxis x_axis = -1, ImAxis y_axis = -1) @extern("ImPlot_PixelsToPlot_Vec2");
extern fn void pixels_to_plot_float(ImPlotPoint* p_out, float x, float y, ImAxis x_axis = -1, ImAxis y_axis = -1) @extern("ImPlot_PixelsToPlot_Float");
extern fn void plot_bar_groups_float_ptr(ZString* label_ids, float* values, CInt item_count, CInt group_count, double group_size = 0.67, double shift = 0, ImPlotBarGroupsFlags flags = 0) @extern("ImPlot_PlotBarGroups_FloatPtr");
extern fn void plot_bar_groups_double_ptr(ZString* label_ids, double* values, CInt item_count, CInt group_count, double group_size = 0.67, double shift = 0, ImPlotBarGroupsFlags flags = 0) @extern("ImPlot_PlotBarGroups_doublePtr");
extern fn void plot_bar_groups_s8_ptr(ZString* label_ids, ImS8* values, CInt item_count, CInt group_count, double group_size = 0.67, double shift = 0, ImPlotBarGroupsFlags flags = 0) @extern("ImPlot_PlotBarGroups_S8Ptr");
extern fn void plot_bar_groups_u8_ptr(ZString* label_ids, ImU8* values, CInt item_count, CInt group_count, double group_size = 0.67, double shift = 0, ImPlotBarGroupsFlags flags = 0) @extern("ImPlot_PlotBarGroups_U8Ptr");
extern fn void plot_bar_groups_s16_ptr(ZString* label_ids, ImS16* values, CInt item_count, CInt group_count, double group_size = 0.67, double shift = 0, ImPlotBarGroupsFlags flags = 0) @extern("ImPlot_PlotBarGroups_S16Ptr");
extern fn void plot_bar_groups_u16_ptr(ZString* label_ids, ImU16* values, CInt item_count, CInt group_count, double group_size = 0.67, double shift = 0, ImPlotBarGroupsFlags flags = 0) @extern("ImPlot_PlotBarGroups_U16Ptr");
extern fn void plot_bar_groups_s32_ptr(ZString* label_ids, ImS32* values, CInt item_count, CInt group_count, double group_size = 0.67, double shift = 0, ImPlotBarGroupsFlags flags = 0) @extern("ImPlot_PlotBarGroups_S32Ptr");
extern fn void plot_bar_groups_u32_ptr(ZString* label_ids, ImU32* values, CInt item_count, CInt group_count, double group_size = 0.67, double shift = 0, ImPlotBarGroupsFlags flags = 0) @extern("ImPlot_PlotBarGroups_U32Ptr");
extern fn void plot_bar_groups_s64_ptr(ZString* label_ids, ImS64* values, CInt item_count, CInt group_count, double group_size = 0.67, double shift = 0, ImPlotBarGroupsFlags flags = 0) @extern("ImPlot_PlotBarGroups_S64Ptr");
extern fn void plot_bar_groups_u64_ptr(ZString* label_ids, ImU64* values, CInt item_count, CInt group_count, double group_size = 0.67, double shift = 0, ImPlotBarGroupsFlags flags = 0) @extern("ImPlot_PlotBarGroups_U64Ptr");
extern fn void plot_bars_float_ptr_int(ZString label_id, float* values, CInt count, double bar_size = 0.67, double shift = 0, ImPlotBarsFlags flags = 0, CInt offset = 0, CInt stride = float.sizeof) @extern("ImPlot_PlotBars_FloatPtrInt");
extern fn void plot_bars_double_ptr_int(ZString label_id, double* values, CInt count, double bar_size = 0.67, double shift = 0, ImPlotBarsFlags flags = 0, CInt offset = 0, CInt stride = double.sizeof) @extern("ImPlot_PlotBars_doublePtrInt");
extern fn void plot_bars_s8_ptr_int(ZString label_id, ImS8* values, CInt count, double bar_size = 0.67, double shift = 0, ImPlotBarsFlags flags = 0, CInt offset = 0, CInt stride = ImS8.sizeof) @extern("ImPlot_PlotBars_S8PtrInt");
extern fn void plot_bars_u8_ptr_int(ZString label_id, ImU8* values, CInt count, double bar_size = 0.67, double shift = 0, ImPlotBarsFlags flags = 0, CInt offset = 0, CInt stride = ImU8.sizeof) @extern("ImPlot_PlotBars_U8PtrInt");
extern fn void plot_bars_s16_ptr_int(ZString label_id, ImS16* values, CInt count, double bar_size = 0.67, double shift = 0, ImPlotBarsFlags flags = 0, CInt offset = 0, CInt stride = ImS16.sizeof) @extern("ImPlot_PlotBars_S16PtrInt");
extern fn void plot_bars_u16_ptr_int(ZString label_id, ImU16* values, CInt count, double bar_size = 0.67, double shift = 0, ImPlotBarsFlags flags = 0, CInt offset = 0, CInt stride = ImU16.sizeof) @extern("ImPlot_PlotBars_U16PtrInt");
extern fn void plot_bars_s32_ptr_int(ZString label_id, ImS32* values, CInt count, double bar_size = 0.67, double shift = 0, ImPlotBarsFlags flags = 0, CInt offset = 0, CInt stride = ImS32.sizeof) @extern("ImPlot_PlotBars_S32PtrInt");
extern fn void plot_bars_u32_ptr_int(ZString label_id, ImU32* values, CInt count, double bar_size = 0.67, double shift = 0, ImPlotBarsFlags flags = 0, CInt offset = 0, CInt stride = ImU32.sizeof) @extern("ImPlot_PlotBars_U32PtrInt");
extern fn void plot_bars_s64_ptr_int(ZString label_id, ImS64* values, CInt count, double bar_size = 0.67, double shift = 0, ImPlotBarsFlags flags = 0, CInt offset = 0, CInt stride = ImS64.sizeof) @extern("ImPlot_PlotBars_S64PtrInt");
extern fn void plot_bars_u64_ptr_int(ZString label_id, ImU64* values, CInt count, double bar_size = 0.67, double shift = 0, ImPlotBarsFlags flags = 0, CInt offset = 0, CInt stride = ImU64.sizeof) @extern("ImPlot_PlotBars_U64PtrInt");
extern fn void plot_bars_float_ptr_float_ptr(ZString label_id, float* xs, float* ys, CInt count, double bar_size, ImPlotBarsFlags flags = 0, CInt offset = 0, CInt stride = float.sizeof) @extern("ImPlot_PlotBars_FloatPtrFloatPtr");
extern fn void plot_bars_double_ptrdouble_ptr(ZString label_id, double* xs, double* ys, CInt count, double bar_size, ImPlotBarsFlags flags = 0, CInt offset = 0, CInt stride = double.sizeof) @extern("ImPlot_PlotBars_doublePtrdoublePtr");
extern fn void plot_bars_s8_ptr_s8_ptr(ZString label_id, ImS8* xs, ImS8* ys, CInt count, double bar_size, ImPlotBarsFlags flags = 0, CInt offset = 0, CInt stride = ImS8.sizeof) @extern("ImPlot_PlotBars_S8PtrS8Ptr");
extern fn void plot_bars_u8_ptr_u8_ptr(ZString label_id, ImU8* xs, ImU8* ys, CInt count, double bar_size, ImPlotBarsFlags flags = 0, CInt offset = 0, CInt stride = ImU8.sizeof) @extern("ImPlot_PlotBars_U8PtrU8Ptr");
extern fn void plot_bars_s16_ptr_s16_ptr(ZString label_id, ImS16* xs, ImS16* ys, CInt count, double bar_size, ImPlotBarsFlags flags = 0, CInt offset = 0, CInt stride = ImS16.sizeof) @extern("ImPlot_PlotBars_S16PtrS16Ptr");
extern fn void plot_bars_u16_ptr_u16_ptr(ZString label_id, ImU16* xs, ImU16* ys, CInt count, double bar_size, ImPlotBarsFlags flags = 0, CInt offset = 0, CInt stride = ImU16.sizeof) @extern("ImPlot_PlotBars_U16PtrU16Ptr");
extern fn void plot_bars_s32_ptr_s32_ptr(ZString label_id, ImS32* xs, ImS32* ys, CInt count, double bar_size, ImPlotBarsFlags flags = 0, CInt offset = 0, CInt stride = ImS32.sizeof) @extern("ImPlot_PlotBars_S32PtrS32Ptr");
extern fn void plot_bars_u32_ptr_u32_ptr(ZString label_id, ImU32* xs, ImU32* ys, CInt count, double bar_size, ImPlotBarsFlags flags = 0, CInt offset = 0, CInt stride = ImU32.sizeof) @extern("ImPlot_PlotBars_U32PtrU32Ptr");
extern fn void plot_bars_s64_ptr_s64_ptr(ZString label_id, ImS64* xs, ImS64* ys, CInt count, double bar_size, ImPlotBarsFlags flags = 0, CInt offset = 0, CInt stride = ImS64.sizeof) @extern("ImPlot_PlotBars_S64PtrS64Ptr");
extern fn void plot_bars_u64_ptr_u64_ptr(ZString label_id, ImU64* xs, ImU64* ys, CInt count, double bar_size, ImPlotBarsFlags flags = 0, CInt offset = 0, CInt stride = ImU64.sizeof) @extern("ImPlot_PlotBars_U64PtrU64Ptr");
extern fn void plot_bars_g(ZString label_id, ImPlotGetter getter, void* data, CInt count, double bar_size, ImPlotBarsFlags flags = 0) @extern("ImPlot_PlotBarsG");
extern fn void plot_digital_float_ptr(ZString label_id, float* xs, float* ys, CInt count, ImPlotDigitalFlags flags = 0, CInt offset = 0, CInt stride = float.sizeof) @extern("ImPlot_PlotDigital_FloatPtr");
extern fn void plot_digital_double_ptr(ZString label_id, double* xs, double* ys, CInt count, ImPlotDigitalFlags flags = 0, CInt offset = 0, CInt stride = double.sizeof) @extern("ImPlot_PlotDigital_doublePtr");
extern fn void plot_digital_s8_ptr(ZString label_id, ImS8* xs, ImS8* ys, CInt count, ImPlotDigitalFlags flags = 0, CInt offset = 0, CInt stride = ImS8.sizeof) @extern("ImPlot_PlotDigital_S8Ptr");
extern fn void plot_digital_u8_ptr(ZString label_id, ImU8* xs, ImU8* ys, CInt count, ImPlotDigitalFlags flags = 0, CInt offset = 0, CInt stride = ImU8.sizeof) @extern("ImPlot_PlotDigital_U8Ptr");
extern fn void plot_digital_s16_ptr(ZString label_id, ImS16* xs, ImS16* ys, CInt count, ImPlotDigitalFlags flags = 0, CInt offset = 0, CInt stride = ImS16.sizeof) @extern("ImPlot_PlotDigital_S16Ptr");
extern fn void plot_digital_u16_ptr(ZString label_id, ImU16* xs, ImU16* ys, CInt count, ImPlotDigitalFlags flags = 0, CInt offset = 0, CInt stride = ImU16.sizeof) @extern("ImPlot_PlotDigital_U16Ptr");
extern fn void plot_digital_s32_ptr(ZString label_id, ImS32* xs, ImS32* ys, CInt count, ImPlotDigitalFlags flags = 0, CInt offset = 0, CInt stride = ImS32.sizeof) @extern("ImPlot_PlotDigital_S32Ptr");
extern fn void plot_digital_u32_ptr(ZString label_id, ImU32* xs, ImU32* ys, CInt count, ImPlotDigitalFlags flags = 0, CInt offset = 0, CInt stride = ImU32.sizeof) @extern("ImPlot_PlotDigital_U32Ptr");
extern fn void plot_digital_s64_ptr(ZString label_id, ImS64* xs, ImS64* ys, CInt count, ImPlotDigitalFlags flags = 0, CInt offset = 0, CInt stride = ImS64.sizeof) @extern("ImPlot_PlotDigital_S64Ptr");
extern fn void plot_digital_u64_ptr(ZString label_id, ImU64* xs, ImU64* ys, CInt count, ImPlotDigitalFlags flags = 0, CInt offset = 0, CInt stride = ImU64.sizeof) @extern("ImPlot_PlotDigital_U64Ptr");
extern fn void plot_digital_g(ZString label_id, ImPlotGetter getter, void* data, CInt count, ImPlotDigitalFlags flags = 0) @extern("ImPlot_PlotDigitalG");
extern fn void plot_dummy(ZString label_id, ImPlotDummyFlags flags = 0) @extern("ImPlot_PlotDummy");
extern fn void plot_error_bars_float_ptr_float_ptr_float_ptr_int(ZString label_id, float* xs, float* ys, float* err, CInt count, ImPlotErrorBarsFlags flags = 0, CInt offset = 0, CInt stride = float.sizeof) @extern("ImPlot_PlotErrorBars_FloatPtrFloatPtrFloatPtrInt");
extern fn void plot_error_bars_double_ptrdouble_ptrdouble_ptr_int(ZString label_id, double* xs, double* ys, double* err, CInt count, ImPlotErrorBarsFlags flags = 0, CInt offset = 0, CInt stride = double.sizeof) @extern("ImPlot_PlotErrorBars_doublePtrdoublePtrdoublePtrInt");
extern fn void plot_error_bars_s8_ptr_s8_ptr_s8_ptr_int(ZString label_id, ImS8* xs, ImS8* ys, ImS8* err, CInt count, ImPlotErrorBarsFlags flags = 0, CInt offset = 0, CInt stride = ImS8.sizeof) @extern("ImPlot_PlotErrorBars_S8PtrS8PtrS8PtrInt");
extern fn void plot_error_bars_u8_ptr_u8_ptr_u8_ptr_int(ZString label_id, ImU8* xs, ImU8* ys, ImU8* err, CInt count, ImPlotErrorBarsFlags flags = 0, CInt offset = 0, CInt stride = ImU8.sizeof) @extern("ImPlot_PlotErrorBars_U8PtrU8PtrU8PtrInt");
extern fn void plot_error_bars_s16_ptr_s16_ptr_s16_ptr_int(ZString label_id, ImS16* xs, ImS16* ys, ImS16* err, CInt count, ImPlotErrorBarsFlags flags = 0, CInt offset = 0, CInt stride = ImS16.sizeof) @extern("ImPlot_PlotErrorBars_S16PtrS16PtrS16PtrInt");
extern fn void plot_error_bars_u16_ptr_u16_ptr_u16_ptr_int(ZString label_id, ImU16* xs, ImU16* ys, ImU16* err, CInt count, ImPlotErrorBarsFlags flags = 0, CInt offset = 0, CInt stride = ImU16.sizeof) @extern("ImPlot_PlotErrorBars_U16PtrU16PtrU16PtrInt");
extern fn void plot_error_bars_s32_ptr_s32_ptr_s32_ptr_int(ZString label_id, ImS32* xs, ImS32* ys, ImS32* err, CInt count, ImPlotErrorBarsFlags flags = 0, CInt offset = 0, CInt stride = ImS32.sizeof) @extern("ImPlot_PlotErrorBars_S32PtrS32PtrS32PtrInt");
extern fn void plot_error_bars_u32_ptr_u32_ptr_u32_ptr_int(ZString label_id, ImU32* xs, ImU32* ys, ImU32* err, CInt count, ImPlotErrorBarsFlags flags = 0, CInt offset = 0, CInt stride = ImU32.sizeof) @extern("ImPlot_PlotErrorBars_U32PtrU32PtrU32PtrInt");
extern fn void plot_error_bars_s64_ptr_s64_ptr_s64_ptr_int(ZString label_id, ImS64* xs, ImS64* ys, ImS64* err, CInt count, ImPlotErrorBarsFlags flags = 0, CInt offset = 0, CInt stride = ImS64.sizeof) @extern("ImPlot_PlotErrorBars_S64PtrS64PtrS64PtrInt");
extern fn void plot_error_bars_u64_ptr_u64_ptr_u64_ptr_int(ZString label_id, ImU64* xs, ImU64* ys, ImU64* err, CInt count, ImPlotErrorBarsFlags flags = 0, CInt offset = 0, CInt stride = ImU64.sizeof) @extern("ImPlot_PlotErrorBars_U64PtrU64PtrU64PtrInt");
extern fn void plot_error_bars_float_ptr_float_ptr_float_ptr_float_ptr(ZString label_id, float* xs, float* ys, float* neg, float* pos, CInt count, ImPlotErrorBarsFlags flags = 0, CInt offset = 0, CInt stride = float.sizeof) @extern("ImPlot_PlotErrorBars_FloatPtrFloatPtrFloatPtrFloatPtr");
extern fn void plot_error_bars_double_ptrdouble_ptrdouble_ptrdouble_ptr(ZString label_id, double* xs, double* ys, double* neg, double* pos, CInt count, ImPlotErrorBarsFlags flags = 0, CInt offset = 0, CInt stride = double.sizeof) @extern("ImPlot_PlotErrorBars_doublePtrdoublePtrdoublePtrdoublePtr");
extern fn void plot_error_bars_s8_ptr_s8_ptr_s8_ptr_s8_ptr(ZString label_id, ImS8* xs, ImS8* ys, ImS8* neg, ImS8* pos, CInt count, ImPlotErrorBarsFlags flags = 0, CInt offset = 0, CInt stride = ImS8.sizeof) @extern("ImPlot_PlotErrorBars_S8PtrS8PtrS8PtrS8Ptr");
extern fn void plot_error_bars_u8_ptr_u8_ptr_u8_ptr_u8_ptr(ZString label_id, ImU8* xs, ImU8* ys, ImU8* neg, ImU8* pos, CInt count, ImPlotErrorBarsFlags flags = 0, CInt offset = 0, CInt stride = ImU8.sizeof) @extern("ImPlot_PlotErrorBars_U8PtrU8PtrU8PtrU8Ptr");
extern fn void plot_error_bars_s16_ptr_s16_ptr_s16_ptr_s16_ptr(ZString label_id, ImS16* xs, ImS16* ys, ImS16* neg, ImS16* pos, CInt count, ImPlotErrorBarsFlags flags = 0, CInt offset = 0, CInt stride = ImS16.sizeof) @extern("ImPlot_PlotErrorBars_S16PtrS16PtrS16PtrS16Ptr");
extern fn void plot_error_bars_u16_ptr_u16_ptr_u16_ptr_u16_ptr(ZString label_id, ImU16* xs, ImU16* ys, ImU16* neg, ImU16* pos, CInt count, ImPlotErrorBarsFlags flags = 0, CInt offset = 0, CInt stride = ImU16.sizeof) @extern("ImPlot_PlotErrorBars_U16PtrU16PtrU16PtrU16Ptr");
extern fn void plot_error_bars_s32_ptr_s32_ptr_s32_ptr_s32_ptr(ZString label_id, ImS32* xs, ImS32* ys, ImS32* neg, ImS32* pos, CInt count, ImPlotErrorBarsFlags flags = 0, CInt offset = 0, CInt stride = ImS32.sizeof) @extern("ImPlot_PlotErrorBars_S32PtrS32PtrS32PtrS32Ptr");
extern fn void plot_error_bars_u32_ptr_u32_ptr_u32_ptr_u32_ptr(ZString label_id, ImU32* xs, ImU32* ys, ImU32* neg, ImU32* pos, CInt count, ImPlotErrorBarsFlags flags = 0, CInt offset = 0, CInt stride = ImU32.sizeof) @extern("ImPlot_PlotErrorBars_U32PtrU32PtrU32PtrU32Ptr");
extern fn void plot_error_bars_s64_ptr_s64_ptr_s64_ptr_s64_ptr(ZString label_id, ImS64* xs, ImS64* ys, ImS64* neg, ImS64* pos, CInt count, ImPlotErrorBarsFlags flags = 0, CInt offset = 0, CInt stride = ImS64.sizeof) @extern("ImPlot_PlotErrorBars_S64PtrS64PtrS64PtrS64Ptr");
extern fn void plot_error_bars_u64_ptr_u64_ptr_u64_ptr_u64_ptr(ZString label_id, ImU64* xs, ImU64* ys, ImU64* neg, ImU64* pos, CInt count, ImPlotErrorBarsFlags flags = 0, CInt offset = 0, CInt stride = ImU64.sizeof) @extern("ImPlot_PlotErrorBars_U64PtrU64PtrU64PtrU64Ptr");
extern fn void plot_heatmap_float_ptr(ZString label_id, float* values, CInt rows, CInt cols, double scale_min = 0, double scale_max = 0, ZString label_fmt = "%.1f", ImPlotPoint bounds_min = ImPlotPoint(0,0), ImPlotPoint bounds_max = ImPlotPoint(1,1), ImPlotHeatmapFlags flags = 0) @extern("ImPlot_PlotHeatmap_FloatPtr");
extern fn void plot_heatmap_double_ptr(ZString label_id, double* values, CInt rows, CInt cols, double scale_min = 0, double scale_max = 0, ZString label_fmt = "%.1f", ImPlotPoint bounds_min = ImPlotPoint(0,0), ImPlotPoint bounds_max = ImPlotPoint(1,1), ImPlotHeatmapFlags flags = 0) @extern("ImPlot_PlotHeatmap_doublePtr");
extern fn void plot_heatmap_s8_ptr(ZString label_id, ImS8* values, CInt rows, CInt cols, double scale_min = 0, double scale_max = 0, ZString label_fmt = "%.1f", ImPlotPoint bounds_min = ImPlotPoint(0,0), ImPlotPoint bounds_max = ImPlotPoint(1,1), ImPlotHeatmapFlags flags = 0) @extern("ImPlot_PlotHeatmap_S8Ptr");
extern fn void plot_heatmap_u8_ptr(ZString label_id, ImU8* values, CInt rows, CInt cols, double scale_min = 0, double scale_max = 0, ZString label_fmt = "%.1f", ImPlotPoint bounds_min = ImPlotPoint(0,0), ImPlotPoint bounds_max = ImPlotPoint(1,1), ImPlotHeatmapFlags flags = 0) @extern("ImPlot_PlotHeatmap_U8Ptr");
extern fn void plot_heatmap_s16_ptr(ZString label_id, ImS16* values, CInt rows, CInt cols, double scale_min = 0, double scale_max = 0, ZString label_fmt = "%.1f", ImPlotPoint bounds_min = ImPlotPoint(0,0), ImPlotPoint bounds_max = ImPlotPoint(1,1), ImPlotHeatmapFlags flags = 0) @extern("ImPlot_PlotHeatmap_S16Ptr");
extern fn void plot_heatmap_u16_ptr(ZString label_id, ImU16* values, CInt rows, CInt cols, double scale_min = 0, double scale_max = 0, ZString label_fmt = "%.1f", ImPlotPoint bounds_min = ImPlotPoint(0,0), ImPlotPoint bounds_max = ImPlotPoint(1,1), ImPlotHeatmapFlags flags = 0) @extern("ImPlot_PlotHeatmap_U16Ptr");
extern fn void plot_heatmap_s32_ptr(ZString label_id, ImS32* values, CInt rows, CInt cols, double scale_min = 0, double scale_max = 0, ZString label_fmt = "%.1f", ImPlotPoint bounds_min = ImPlotPoint(0,0), ImPlotPoint bounds_max = ImPlotPoint(1,1), ImPlotHeatmapFlags flags = 0) @extern("ImPlot_PlotHeatmap_S32Ptr");
extern fn void plot_heatmap_u32_ptr(ZString label_id, ImU32* values, CInt rows, CInt cols, double scale_min = 0, double scale_max = 0, ZString label_fmt = "%.1f", ImPlotPoint bounds_min = ImPlotPoint(0,0), ImPlotPoint bounds_max = ImPlotPoint(1,1), ImPlotHeatmapFlags flags = 0) @extern("ImPlot_PlotHeatmap_U32Ptr");
extern fn void plot_heatmap_s64_ptr(ZString label_id, ImS64* values, CInt rows, CInt cols, double scale_min = 0, double scale_max = 0, ZString label_fmt = "%.1f", ImPlotPoint bounds_min = ImPlotPoint(0,0), ImPlotPoint bounds_max = ImPlotPoint(1,1), ImPlotHeatmapFlags flags = 0) @extern("ImPlot_PlotHeatmap_S64Ptr");
extern fn void plot_heatmap_u64_ptr(ZString label_id, ImU64* values, CInt rows, CInt cols, double scale_min = 0, double scale_max = 0, ZString label_fmt = "%.1f", ImPlotPoint bounds_min = ImPlotPoint(0,0), ImPlotPoint bounds_max = ImPlotPoint(1,1), ImPlotHeatmapFlags flags = 0) @extern("ImPlot_PlotHeatmap_U64Ptr");
extern fn double plot_histogram_float_ptr(ZString label_id, float* values, CInt count, CInt bins = ImPlotBin_Sturges, double bar_scale = 1.0, ImPlotRange range = ImPlotRange(), ImPlotHistogramFlags flags = 0) @extern("ImPlot_PlotHistogram_FloatPtr");
extern fn double plot_histogram_double_ptr(ZString label_id, double* values, CInt count, CInt bins = ImPlotBin_Sturges, double bar_scale = 1.0, ImPlotRange range = ImPlotRange(), ImPlotHistogramFlags flags = 0) @extern("ImPlot_PlotHistogram_doublePtr");
extern fn double plot_histogram_s8_ptr(ZString label_id, ImS8* values, CInt count, CInt bins = ImPlotBin_Sturges, double bar_scale = 1.0, ImPlotRange range = ImPlotRange(), ImPlotHistogramFlags flags = 0) @extern("ImPlot_PlotHistogram_S8Ptr");
extern fn double plot_histogram_u8_ptr(ZString label_id, ImU8* values, CInt count, CInt bins = ImPlotBin_Sturges, double bar_scale = 1.0, ImPlotRange range = ImPlotRange(), ImPlotHistogramFlags flags = 0) @extern("ImPlot_PlotHistogram_U8Ptr");
extern fn double plot_histogram_s16_ptr(ZString label_id, ImS16* values, CInt count, CInt bins = ImPlotBin_Sturges, double bar_scale = 1.0, ImPlotRange range = ImPlotRange(), ImPlotHistogramFlags flags = 0) @extern("ImPlot_PlotHistogram_S16Ptr");
extern fn double plot_histogram_u16_ptr(ZString label_id, ImU16* values, CInt count, CInt bins = ImPlotBin_Sturges, double bar_scale = 1.0, ImPlotRange range = ImPlotRange(), ImPlotHistogramFlags flags = 0) @extern("ImPlot_PlotHistogram_U16Ptr");
extern fn double plot_histogram_s32_ptr(ZString label_id, ImS32* values, CInt count, CInt bins = ImPlotBin_Sturges, double bar_scale = 1.0, ImPlotRange range = ImPlotRange(), ImPlotHistogramFlags flags = 0) @extern("ImPlot_PlotHistogram_S32Ptr");
extern fn double plot_histogram_u32_ptr(ZString label_id, ImU32* values, CInt count, CInt bins = ImPlotBin_Sturges, double bar_scale = 1.0, ImPlotRange range = ImPlotRange(), ImPlotHistogramFlags flags = 0) @extern("ImPlot_PlotHistogram_U32Ptr");
extern fn double plot_histogram_s64_ptr(ZString label_id, ImS64* values, CInt count, CInt bins = ImPlotBin_Sturges, double bar_scale = 1.0, ImPlotRange range = ImPlotRange(), ImPlotHistogramFlags flags = 0) @extern("ImPlot_PlotHistogram_S64Ptr");
extern fn double plot_histogram_u64_ptr(ZString label_id, ImU64* values, CInt count, CInt bins = ImPlotBin_Sturges, double bar_scale = 1.0, ImPlotRange range = ImPlotRange(), ImPlotHistogramFlags flags = 0) @extern("ImPlot_PlotHistogram_U64Ptr");
extern fn double plot_histogram2_dfloat_ptr(ZString label_id, float* xs, float* ys, CInt count, CInt x_bins = ImPlotBin_Sturges, CInt y_bins = ImPlotBin_Sturges, ImPlotRect range = ImPlotRect(), ImPlotHistogramFlags flags = 0) @extern("ImPlot_PlotHistogram2D_FloatPtr");
extern fn double plot_histogram2_ddouble_ptr(ZString label_id, double* xs, double* ys, CInt count, CInt x_bins = ImPlotBin_Sturges, CInt y_bins = ImPlotBin_Sturges, ImPlotRect range = ImPlotRect(), ImPlotHistogramFlags flags = 0) @extern("ImPlot_PlotHistogram2D_doublePtr");
extern fn double plot_histogram2_ds8_ptr(ZString label_id, ImS8* xs, ImS8* ys, CInt count, CInt x_bins = ImPlotBin_Sturges, CInt y_bins = ImPlotBin_Sturges, ImPlotRect range = ImPlotRect(), ImPlotHistogramFlags flags = 0) @extern("ImPlot_PlotHistogram2D_S8Ptr");
extern fn double plot_histogram2_du8_ptr(ZString label_id, ImU8* xs, ImU8* ys, CInt count, CInt x_bins = ImPlotBin_Sturges, CInt y_bins = ImPlotBin_Sturges, ImPlotRect range = ImPlotRect(), ImPlotHistogramFlags flags = 0) @extern("ImPlot_PlotHistogram2D_U8Ptr");
extern fn double plot_histogram2_ds16_ptr(ZString label_id, ImS16* xs, ImS16* ys, CInt count, CInt x_bins = ImPlotBin_Sturges, CInt y_bins = ImPlotBin_Sturges, ImPlotRect range = ImPlotRect(), ImPlotHistogramFlags flags = 0) @extern("ImPlot_PlotHistogram2D_S16Ptr");
extern fn double plot_histogram2_du16_ptr(ZString label_id, ImU16* xs, ImU16* ys, CInt count, CInt x_bins = ImPlotBin_Sturges, CInt y_bins = ImPlotBin_Sturges, ImPlotRect range = ImPlotRect(), ImPlotHistogramFlags flags = 0) @extern("ImPlot_PlotHistogram2D_U16Ptr");
extern fn double plot_histogram2_ds32_ptr(ZString label_id, ImS32* xs, ImS32* ys, CInt count, CInt x_bins = ImPlotBin_Sturges, CInt y_bins = ImPlotBin_Sturges, ImPlotRect range = ImPlotRect(), ImPlotHistogramFlags flags = 0) @extern("ImPlot_PlotHistogram2D_S32Ptr");
extern fn double plot_histogram2_du32_ptr(ZString label_id, ImU32* xs, ImU32* ys, CInt count, CInt x_bins = ImPlotBin_Sturges, CInt y_bins = ImPlotBin_Sturges, ImPlotRect range = ImPlotRect(), ImPlotHistogramFlags flags = 0) @extern("ImPlot_PlotHistogram2D_U32Ptr");
extern fn double plot_histogram2_ds64_ptr(ZString label_id, ImS64* xs, ImS64* ys, CInt count, CInt x_bins = ImPlotBin_Sturges, CInt y_bins = ImPlotBin_Sturges, ImPlotRect range = ImPlotRect(), ImPlotHistogramFlags flags = 0) @extern("ImPlot_PlotHistogram2D_S64Ptr");
extern fn double plot_histogram2_du64_ptr(ZString label_id, ImU64* xs, ImU64* ys, CInt count, CInt x_bins = ImPlotBin_Sturges, CInt y_bins = ImPlotBin_Sturges, ImPlotRect range = ImPlotRect(), ImPlotHistogramFlags flags = 0) @extern("ImPlot_PlotHistogram2D_U64Ptr");
extern fn void plot_image(ZString label_id, ImTextureRef tex_ref, ImPlotPoint bounds_min, ImPlotPoint bounds_max, ImVec2 uv0 = {}, ImVec2 uv1 = {1, 1}, ImVec4 tint_col = {1, 1, 1, 1}, ImPlotImageFlags flags = 0) @extern("ImPlot_PlotImage");
extern fn void plot_inf_lines_float_ptr(ZString label_id, float* values, CInt count, ImPlotInfLinesFlags flags = 0, CInt offset = 0, CInt stride = float.sizeof) @extern("ImPlot_PlotInfLines_FloatPtr");
extern fn void plot_inf_lines_double_ptr(ZString label_id, double* values, CInt count, ImPlotInfLinesFlags flags = 0, CInt offset = 0, CInt stride = double.sizeof) @extern("ImPlot_PlotInfLines_doublePtr");
extern fn void plot_inf_lines_s8_ptr(ZString label_id, ImS8* values, CInt count, ImPlotInfLinesFlags flags = 0, CInt offset = 0, CInt stride = ImS8.sizeof) @extern("ImPlot_PlotInfLines_S8Ptr");
extern fn void plot_inf_lines_u8_ptr(ZString label_id, ImU8* values, CInt count, ImPlotInfLinesFlags flags = 0, CInt offset = 0, CInt stride = ImU8.sizeof) @extern("ImPlot_PlotInfLines_U8Ptr");
extern fn void plot_inf_lines_s16_ptr(ZString label_id, ImS16* values, CInt count, ImPlotInfLinesFlags flags = 0, CInt offset = 0, CInt stride = ImS16.sizeof) @extern("ImPlot_PlotInfLines_S16Ptr");
extern fn void plot_inf_lines_u16_ptr(ZString label_id, ImU16* values, CInt count, ImPlotInfLinesFlags flags = 0, CInt offset = 0, CInt stride = ImU16.sizeof) @extern("ImPlot_PlotInfLines_U16Ptr");
extern fn void plot_inf_lines_s32_ptr(ZString label_id, ImS32* values, CInt count, ImPlotInfLinesFlags flags = 0, CInt offset = 0, CInt stride = ImS32.sizeof) @extern("ImPlot_PlotInfLines_S32Ptr");
extern fn void plot_inf_lines_u32_ptr(ZString label_id, ImU32* values, CInt count, ImPlotInfLinesFlags flags = 0, CInt offset = 0, CInt stride = ImU32.sizeof) @extern("ImPlot_PlotInfLines_U32Ptr");
extern fn void plot_inf_lines_s64_ptr(ZString label_id, ImS64* values, CInt count, ImPlotInfLinesFlags flags = 0, CInt offset = 0, CInt stride = ImS64.sizeof) @extern("ImPlot_PlotInfLines_S64Ptr");
extern fn void plot_inf_lines_u64_ptr(ZString label_id, ImU64* values, CInt count, ImPlotInfLinesFlags flags = 0, CInt offset = 0, CInt stride = ImU64.sizeof) @extern("ImPlot_PlotInfLines_U64Ptr");
extern fn void plot_line_float_ptr_int(ZString label_id, float* values, CInt count, double xscale = 1, double xstart = 0, ImPlotLineFlags flags = 0, CInt offset = 0, CInt stride = float.sizeof) @extern("ImPlot_PlotLine_FloatPtrInt");
extern fn void plot_line_double_ptr_int(ZString label_id, double* values, CInt count, double xscale = 1, double xstart = 0, ImPlotLineFlags flags = 0, CInt offset = 0, CInt stride = double.sizeof) @extern("ImPlot_PlotLine_doublePtrInt");
extern fn void plot_line_s8_ptr_int(ZString label_id, ImS8* values, CInt count, double xscale = 1, double xstart = 0, ImPlotLineFlags flags = 0, CInt offset = 0, CInt stride = ImS8.sizeof) @extern("ImPlot_PlotLine_S8PtrInt");
extern fn void plot_line_u8_ptr_int(ZString label_id, ImU8* values, CInt count, double xscale = 1, double xstart = 0, ImPlotLineFlags flags = 0, CInt offset = 0, CInt stride = ImU8.sizeof) @extern("ImPlot_PlotLine_U8PtrInt");
extern fn void plot_line_s16_ptr_int(ZString label_id, ImS16* values, CInt count, double xscale = 1, double xstart = 0, ImPlotLineFlags flags = 0, CInt offset = 0, CInt stride = ImS16.sizeof) @extern("ImPlot_PlotLine_S16PtrInt");
extern fn void plot_line_u16_ptr_int(ZString label_id, ImU16* values, CInt count, double xscale = 1, double xstart = 0, ImPlotLineFlags flags = 0, CInt offset = 0, CInt stride = ImU16.sizeof) @extern("ImPlot_PlotLine_U16PtrInt");
extern fn void plot_line_s32_ptr_int(ZString label_id, ImS32* values, CInt count, double xscale = 1, double xstart = 0, ImPlotLineFlags flags = 0, CInt offset = 0, CInt stride = ImS32.sizeof) @extern("ImPlot_PlotLine_S32PtrInt");
extern fn void plot_line_u32_ptr_int(ZString label_id, ImU32* values, CInt count, double xscale = 1, double xstart = 0, ImPlotLineFlags flags = 0, CInt offset = 0, CInt stride = ImU32.sizeof) @extern("ImPlot_PlotLine_U32PtrInt");
extern fn void plot_line_s64_ptr_int(ZString label_id, ImS64* values, CInt count, double xscale = 1, double xstart = 0, ImPlotLineFlags flags = 0, CInt offset = 0, CInt stride = ImS64.sizeof) @extern("ImPlot_PlotLine_S64PtrInt");
extern fn void plot_line_u64_ptr_int(ZString label_id, ImU64* values, CInt count, double xscale = 1, double xstart = 0, ImPlotLineFlags flags = 0, CInt offset = 0, CInt stride = ImU64.sizeof) @extern("ImPlot_PlotLine_U64PtrInt");
extern fn void plot_line_float_ptr_float_ptr(ZString label_id, float* xs, float* ys, CInt count, ImPlotLineFlags flags = 0, CInt offset = 0, CInt stride = float.sizeof) @extern("ImPlot_PlotLine_FloatPtrFloatPtr");
extern fn void plot_line_double_ptrdouble_ptr(ZString label_id, double* xs, double* ys, CInt count, ImPlotLineFlags flags = 0, CInt offset = 0, CInt stride = double.sizeof) @extern("ImPlot_PlotLine_doublePtrdoublePtr");
extern fn void plot_line_s8_ptr_s8_ptr(ZString label_id, ImS8* xs, ImS8* ys, CInt count, ImPlotLineFlags flags = 0, CInt offset = 0, CInt stride = ImS8.sizeof) @extern("ImPlot_PlotLine_S8PtrS8Ptr");
extern fn void plot_line_u8_ptr_u8_ptr(ZString label_id, ImU8* xs, ImU8* ys, CInt count, ImPlotLineFlags flags = 0, CInt offset = 0, CInt stride = ImU8.sizeof) @extern("ImPlot_PlotLine_U8PtrU8Ptr");
extern fn void plot_line_s16_ptr_s16_ptr(ZString label_id, ImS16* xs, ImS16* ys, CInt count, ImPlotLineFlags flags = 0, CInt offset = 0, CInt stride = ImS16.sizeof) @extern("ImPlot_PlotLine_S16PtrS16Ptr");
extern fn void plot_line_u16_ptr_u16_ptr(ZString label_id, ImU16* xs, ImU16* ys, CInt count, ImPlotLineFlags flags = 0, CInt offset = 0, CInt stride = ImU16.sizeof) @extern("ImPlot_PlotLine_U16PtrU16Ptr");
extern fn void plot_line_s32_ptr_s32_ptr(ZString label_id, ImS32* xs, ImS32* ys, CInt count, ImPlotLineFlags flags = 0, CInt offset = 0, CInt stride = ImS32.sizeof) @extern("ImPlot_PlotLine_S32PtrS32Ptr");
extern fn void plot_line_u32_ptr_u32_ptr(ZString label_id, ImU32* xs, ImU32* ys, CInt count, ImPlotLineFlags flags = 0, CInt offset = 0, CInt stride = ImU32.sizeof) @extern("ImPlot_PlotLine_U32PtrU32Ptr");
extern fn void plot_line_s64_ptr_s64_ptr(ZString label_id, ImS64* xs, ImS64* ys, CInt count, ImPlotLineFlags flags = 0, CInt offset = 0, CInt stride = ImS64.sizeof) @extern("ImPlot_PlotLine_S64PtrS64Ptr");
extern fn void plot_line_u64_ptr_u64_ptr(ZString label_id, ImU64* xs, ImU64* ys, CInt count, ImPlotLineFlags flags = 0, CInt offset = 0, CInt stride = ImU64.sizeof) @extern("ImPlot_PlotLine_U64PtrU64Ptr");
extern fn void plot_line_g(ZString label_id, ImPlotGetter getter, void* data, CInt count, ImPlotLineFlags flags = 0) @extern("ImPlot_PlotLineG");
extern fn void plot_pie_chart_float_ptr_plot_formatter(ZString* label_ids, float* values, CInt count, double x, double y, double radius, ImPlotFormatter fmt, void* fmt_data = null, double angle0 = 90, ImPlotPieChartFlags flags = 0) @extern("ImPlot_PlotPieChart_FloatPtrPlotFormatter");
extern fn void plot_pie_chart_double_ptr_plot_formatter(ZString* label_ids, double* values, CInt count, double x, double y, double radius, ImPlotFormatter fmt, void* fmt_data = null, double angle0 = 90, ImPlotPieChartFlags flags = 0) @extern("ImPlot_PlotPieChart_doublePtrPlotFormatter");
extern fn void plot_pie_chart_s8_ptr_plot_formatter(ZString* label_ids, ImS8* values, CInt count, double x, double y, double radius, ImPlotFormatter fmt, void* fmt_data = null, double angle0 = 90, ImPlotPieChartFlags flags = 0) @extern("ImPlot_PlotPieChart_S8PtrPlotFormatter");
extern fn void plot_pie_chart_u8_ptr_plot_formatter(ZString* label_ids, ImU8* values, CInt count, double x, double y, double radius, ImPlotFormatter fmt, void* fmt_data = null, double angle0 = 90, ImPlotPieChartFlags flags = 0) @extern("ImPlot_PlotPieChart_U8PtrPlotFormatter");
extern fn void plot_pie_chart_s16_ptr_plot_formatter(ZString* label_ids, ImS16* values, CInt count, double x, double y, double radius, ImPlotFormatter fmt, void* fmt_data = null, double angle0 = 90, ImPlotPieChartFlags flags = 0) @extern("ImPlot_PlotPieChart_S16PtrPlotFormatter");
extern fn void plot_pie_chart_u16_ptr_plot_formatter(ZString* label_ids, ImU16* values, CInt count, double x, double y, double radius, ImPlotFormatter fmt, void* fmt_data = null, double angle0 = 90, ImPlotPieChartFlags flags = 0) @extern("ImPlot_PlotPieChart_U16PtrPlotFormatter");
extern fn void plot_pie_chart_s32_ptr_plot_formatter(ZString* label_ids, ImS32* values, CInt count, double x, double y, double radius, ImPlotFormatter fmt, void* fmt_data = null, double angle0 = 90, ImPlotPieChartFlags flags = 0) @extern("ImPlot_PlotPieChart_S32PtrPlotFormatter");
extern fn void plot_pie_chart_u32_ptr_plot_formatter(ZString* label_ids, ImU32* values, CInt count, double x, double y, double radius, ImPlotFormatter fmt, void* fmt_data = null, double angle0 = 90, ImPlotPieChartFlags flags = 0) @extern("ImPlot_PlotPieChart_U32PtrPlotFormatter");
extern fn void plot_pie_chart_s64_ptr_plot_formatter(ZString* label_ids, ImS64* values, CInt count, double x, double y, double radius, ImPlotFormatter fmt, void* fmt_data = null, double angle0 = 90, ImPlotPieChartFlags flags = 0) @extern("ImPlot_PlotPieChart_S64PtrPlotFormatter");
extern fn void plot_pie_chart_u64_ptr_plot_formatter(ZString* label_ids, ImU64* values, CInt count, double x, double y, double radius, ImPlotFormatter fmt, void* fmt_data = null, double angle0 = 90, ImPlotPieChartFlags flags = 0) @extern("ImPlot_PlotPieChart_U64PtrPlotFormatter");
extern fn void plot_pie_chart_float_ptr_str(ZString* label_ids, float* values, CInt count, double x, double y, double radius, ZString label_fmt = "%.1f", double angle0 = 90, ImPlotPieChartFlags flags = 0) @extern("ImPlot_PlotPieChart_FloatPtrStr");
extern fn void plot_pie_chart_double_ptr_str(ZString* label_ids, double* values, CInt count, double x, double y, double radius, ZString label_fmt = "%.1f", double angle0 = 90, ImPlotPieChartFlags flags = 0) @extern("ImPlot_PlotPieChart_doublePtrStr");
extern fn void plot_pie_chart_s8_ptr_str(ZString* label_ids, ImS8* values, CInt count, double x, double y, double radius, ZString label_fmt = "%.1f", double angle0 = 90, ImPlotPieChartFlags flags = 0) @extern("ImPlot_PlotPieChart_S8PtrStr");
extern fn void plot_pie_chart_u8_ptr_str(ZString* label_ids, ImU8* values, CInt count, double x, double y, double radius, ZString label_fmt = "%.1f", double angle0 = 90, ImPlotPieChartFlags flags = 0) @extern("ImPlot_PlotPieChart_U8PtrStr");
extern fn void plot_pie_chart_s16_ptr_str(ZString* label_ids, ImS16* values, CInt count, double x, double y, double radius, ZString label_fmt = "%.1f", double angle0 = 90, ImPlotPieChartFlags flags = 0) @extern("ImPlot_PlotPieChart_S16PtrStr");
extern fn void plot_pie_chart_u16_ptr_str(ZString* label_ids, ImU16* values, CInt count, double x, double y, double radius, ZString label_fmt = "%.1f", double angle0 = 90, ImPlotPieChartFlags flags = 0) @extern("ImPlot_PlotPieChart_U16PtrStr");
extern fn void plot_pie_chart_s32_ptr_str(ZString* label_ids, ImS32* values, CInt count, double x, double y, double radius, ZString label_fmt = "%.1f", double angle0 = 90, ImPlotPieChartFlags flags = 0) @extern("ImPlot_PlotPieChart_S32PtrStr");
extern fn void plot_pie_chart_u32_ptr_str(ZString* label_ids, ImU32* values, CInt count, double x, double y, double radius, ZString label_fmt = "%.1f", double angle0 = 90, ImPlotPieChartFlags flags = 0) @extern("ImPlot_PlotPieChart_U32PtrStr");
extern fn void plot_pie_chart_s64_ptr_str(ZString* label_ids, ImS64* values, CInt count, double x, double y, double radius, ZString label_fmt = "%.1f", double angle0 = 90, ImPlotPieChartFlags flags = 0) @extern("ImPlot_PlotPieChart_S64PtrStr");
extern fn void plot_pie_chart_u64_ptr_str(ZString* label_ids, ImU64* values, CInt count, double x, double y, double radius, ZString label_fmt = "%.1f", double angle0 = 90, ImPlotPieChartFlags flags = 0) @extern("ImPlot_PlotPieChart_U64PtrStr");
extern fn void plot_scatter_float_ptr_int(ZString label_id, float* values, CInt count, double xscale = 1, double xstart = 0, ImPlotScatterFlags flags = 0, CInt offset = 0, CInt stride = float.sizeof) @extern("ImPlot_PlotScatter_FloatPtrInt");
extern fn void plot_scatter_double_ptr_int(ZString label_id, double* values, CInt count, double xscale = 1, double xstart = 0, ImPlotScatterFlags flags = 0, CInt offset = 0, CInt stride = double.sizeof) @extern("ImPlot_PlotScatter_doublePtrInt");
extern fn void plot_scatter_s8_ptr_int(ZString label_id, ImS8* values, CInt count, double xscale = 1, double xstart = 0, ImPlotScatterFlags flags = 0, CInt offset = 0, CInt stride = ImS8.sizeof) @extern("ImPlot_PlotScatter_S8PtrInt");
extern fn void plot_scatter_u8_ptr_int(ZString label_id, ImU8* values, CInt count, double xscale = 1, double xstart = 0, ImPlotScatterFlags flags = 0, CInt offset = 0, CInt stride = ImU8.sizeof) @extern("ImPlot_PlotScatter_U8PtrInt");
extern fn void plot_scatter_s16_ptr_int(ZString label_id, ImS16* values, CInt count, double xscale = 1, double xstart = 0, ImPlotScatterFlags flags = 0, CInt offset = 0, CInt stride = ImS16.sizeof) @extern("ImPlot_PlotScatter_S16PtrInt");
extern fn void plot_scatter_u16_ptr_int(ZString label_id, ImU16* values, CInt count, double xscale = 1, double xstart = 0, ImPlotScatterFlags flags = 0, CInt offset = 0, CInt stride = ImU16.sizeof) @extern("ImPlot_PlotScatter_U16PtrInt");
extern fn void plot_scatter_s32_ptr_int(ZString label_id, ImS32* values, CInt count, double xscale = 1, double xstart = 0, ImPlotScatterFlags flags = 0, CInt offset = 0, CInt stride = ImS32.sizeof) @extern("ImPlot_PlotScatter_S32PtrInt");
extern fn void plot_scatter_u32_ptr_int(ZString label_id, ImU32* values, CInt count, double xscale = 1, double xstart = 0, ImPlotScatterFlags flags = 0, CInt offset = 0, CInt stride = ImU32.sizeof) @extern("ImPlot_PlotScatter_U32PtrInt");
extern fn void plot_scatter_s64_ptr_int(ZString label_id, ImS64* values, CInt count, double xscale = 1, double xstart = 0, ImPlotScatterFlags flags = 0, CInt offset = 0, CInt stride = ImS64.sizeof) @extern("ImPlot_PlotScatter_S64PtrInt");
extern fn void plot_scatter_u64_ptr_int(ZString label_id, ImU64* values, CInt count, double xscale = 1, double xstart = 0, ImPlotScatterFlags flags = 0, CInt offset = 0, CInt stride = ImU64.sizeof) @extern("ImPlot_PlotScatter_U64PtrInt");
extern fn void plot_scatter_float_ptr_float_ptr(ZString label_id, float* xs, float* ys, CInt count, ImPlotScatterFlags flags = 0, CInt offset = 0, CInt stride = float.sizeof) @extern("ImPlot_PlotScatter_FloatPtrFloatPtr");
extern fn void plot_scatter_double_ptrdouble_ptr(ZString label_id, double* xs, double* ys, CInt count, ImPlotScatterFlags flags = 0, CInt offset = 0, CInt stride = double.sizeof) @extern("ImPlot_PlotScatter_doublePtrdoublePtr");
extern fn void plot_scatter_s8_ptr_s8_ptr(ZString label_id, ImS8* xs, ImS8* ys, CInt count, ImPlotScatterFlags flags = 0, CInt offset = 0, CInt stride = ImS8.sizeof) @extern("ImPlot_PlotScatter_S8PtrS8Ptr");
extern fn void plot_scatter_u8_ptr_u8_ptr(ZString label_id, ImU8* xs, ImU8* ys, CInt count, ImPlotScatterFlags flags = 0, CInt offset = 0, CInt stride = ImU8.sizeof) @extern("ImPlot_PlotScatter_U8PtrU8Ptr");
extern fn void plot_scatter_s16_ptr_s16_ptr(ZString label_id, ImS16* xs, ImS16* ys, CInt count, ImPlotScatterFlags flags = 0, CInt offset = 0, CInt stride = ImS16.sizeof) @extern("ImPlot_PlotScatter_S16PtrS16Ptr");
extern fn void plot_scatter_u16_ptr_u16_ptr(ZString label_id, ImU16* xs, ImU16* ys, CInt count, ImPlotScatterFlags flags = 0, CInt offset = 0, CInt stride = ImU16.sizeof) @extern("ImPlot_PlotScatter_U16PtrU16Ptr");
extern fn void plot_scatter_s32_ptr_s32_ptr(ZString label_id, ImS32* xs, ImS32* ys, CInt count, ImPlotScatterFlags flags = 0, CInt offset = 0, CInt stride = ImS32.sizeof) @extern("ImPlot_PlotScatter_S32PtrS32Ptr");
extern fn void plot_scatter_u32_ptr_u32_ptr(ZString label_id, ImU32* xs, ImU32* ys, CInt count, ImPlotScatterFlags flags = 0, CInt offset = 0, CInt stride = ImU32.sizeof) @extern("ImPlot_PlotScatter_U32PtrU32Ptr");
extern fn void plot_scatter_s64_ptr_s64_ptr(ZString label_id, ImS64* xs, ImS64* ys, CInt count, ImPlotScatterFlags flags = 0, CInt offset = 0, CInt stride = ImS64.sizeof) @extern("ImPlot_PlotScatter_S64PtrS64Ptr");
extern fn void plot_scatter_u64_ptr_u64_ptr(ZString label_id, ImU64* xs, ImU64* ys, CInt count, ImPlotScatterFlags flags = 0, CInt offset = 0, CInt stride = ImU64.sizeof) @extern("ImPlot_PlotScatter_U64PtrU64Ptr");
extern fn void plot_scatter_g(ZString label_id, ImPlotGetter getter, void* data, CInt count, ImPlotScatterFlags flags = 0) @extern("ImPlot_PlotScatterG");
extern fn void plot_shaded_float_ptr_int(ZString label_id, float* values, CInt count, double yref = 0, double xscale = 1, double xstart = 0, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = float.sizeof) @extern("ImPlot_PlotShaded_FloatPtrInt");
extern fn void plot_shaded_double_ptr_int(ZString label_id, double* values, CInt count, double yref = 0, double xscale = 1, double xstart = 0, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = double.sizeof) @extern("ImPlot_PlotShaded_doublePtrInt");
extern fn void plot_shaded_s8_ptr_int(ZString label_id, ImS8* values, CInt count, double yref = 0, double xscale = 1, double xstart = 0, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImS8.sizeof) @extern("ImPlot_PlotShaded_S8PtrInt");
extern fn void plot_shaded_u8_ptr_int(ZString label_id, ImU8* values, CInt count, double yref = 0, double xscale = 1, double xstart = 0, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImU8.sizeof) @extern("ImPlot_PlotShaded_U8PtrInt");
extern fn void plot_shaded_s16_ptr_int(ZString label_id, ImS16* values, CInt count, double yref = 0, double xscale = 1, double xstart = 0, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImS16.sizeof) @extern("ImPlot_PlotShaded_S16PtrInt");
extern fn void plot_shaded_u16_ptr_int(ZString label_id, ImU16* values, CInt count, double yref = 0, double xscale = 1, double xstart = 0, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImU16.sizeof) @extern("ImPlot_PlotShaded_U16PtrInt");
extern fn void plot_shaded_s32_ptr_int(ZString label_id, ImS32* values, CInt count, double yref = 0, double xscale = 1, double xstart = 0, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImS32.sizeof) @extern("ImPlot_PlotShaded_S32PtrInt");
extern fn void plot_shaded_u32_ptr_int(ZString label_id, ImU32* values, CInt count, double yref = 0, double xscale = 1, double xstart = 0, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImU32.sizeof) @extern("ImPlot_PlotShaded_U32PtrInt");
extern fn void plot_shaded_s64_ptr_int(ZString label_id, ImS64* values, CInt count, double yref = 0, double xscale = 1, double xstart = 0, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImS64.sizeof) @extern("ImPlot_PlotShaded_S64PtrInt");
extern fn void plot_shaded_u64_ptr_int(ZString label_id, ImU64* values, CInt count, double yref = 0, double xscale = 1, double xstart = 0, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImU64.sizeof) @extern("ImPlot_PlotShaded_U64PtrInt");
extern fn void plot_shaded_float_ptr_float_ptr_int(ZString label_id, float* xs, float* ys, CInt count, double yref = 0, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = float.sizeof) @extern("ImPlot_PlotShaded_FloatPtrFloatPtrInt");
extern fn void plot_shaded_double_ptrdouble_ptr_int(ZString label_id, double* xs, double* ys, CInt count, double yref = 0, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = double.sizeof) @extern("ImPlot_PlotShaded_doublePtrdoublePtrInt");
extern fn void plot_shaded_s8_ptr_s8_ptr_int(ZString label_id, ImS8* xs, ImS8* ys, CInt count, double yref = 0, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImS8.sizeof) @extern("ImPlot_PlotShaded_S8PtrS8PtrInt");
extern fn void plot_shaded_u8_ptr_u8_ptr_int(ZString label_id, ImU8* xs, ImU8* ys, CInt count, double yref = 0, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImU8.sizeof) @extern("ImPlot_PlotShaded_U8PtrU8PtrInt");
extern fn void plot_shaded_s16_ptr_s16_ptr_int(ZString label_id, ImS16* xs, ImS16* ys, CInt count, double yref = 0, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImS16.sizeof) @extern("ImPlot_PlotShaded_S16PtrS16PtrInt");
extern fn void plot_shaded_u16_ptr_u16_ptr_int(ZString label_id, ImU16* xs, ImU16* ys, CInt count, double yref = 0, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImU16.sizeof) @extern("ImPlot_PlotShaded_U16PtrU16PtrInt");
extern fn void plot_shaded_s32_ptr_s32_ptr_int(ZString label_id, ImS32* xs, ImS32* ys, CInt count, double yref = 0, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImS32.sizeof) @extern("ImPlot_PlotShaded_S32PtrS32PtrInt");
extern fn void plot_shaded_u32_ptr_u32_ptr_int(ZString label_id, ImU32* xs, ImU32* ys, CInt count, double yref = 0, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImU32.sizeof) @extern("ImPlot_PlotShaded_U32PtrU32PtrInt");
extern fn void plot_shaded_s64_ptr_s64_ptr_int(ZString label_id, ImS64* xs, ImS64* ys, CInt count, double yref = 0, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImS64.sizeof) @extern("ImPlot_PlotShaded_S64PtrS64PtrInt");
extern fn void plot_shaded_u64_ptr_u64_ptr_int(ZString label_id, ImU64* xs, ImU64* ys, CInt count, double yref = 0, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImU64.sizeof) @extern("ImPlot_PlotShaded_U64PtrU64PtrInt");
extern fn void plot_shaded_float_ptr_float_ptr_float_ptr(ZString label_id, float* xs, float* ys1, float* ys2, CInt count, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = float.sizeof) @extern("ImPlot_PlotShaded_FloatPtrFloatPtrFloatPtr");
extern fn void plot_shaded_double_ptrdouble_ptrdouble_ptr(ZString label_id, double* xs, double* ys1, double* ys2, CInt count, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = double.sizeof) @extern("ImPlot_PlotShaded_doublePtrdoublePtrdoublePtr");
extern fn void plot_shaded_s8_ptr_s8_ptr_s8_ptr(ZString label_id, ImS8* xs, ImS8* ys1, ImS8* ys2, CInt count, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImS8.sizeof) @extern("ImPlot_PlotShaded_S8PtrS8PtrS8Ptr");
extern fn void plot_shaded_u8_ptr_u8_ptr_u8_ptr(ZString label_id, ImU8* xs, ImU8* ys1, ImU8* ys2, CInt count, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImU8.sizeof) @extern("ImPlot_PlotShaded_U8PtrU8PtrU8Ptr");
extern fn void plot_shaded_s16_ptr_s16_ptr_s16_ptr(ZString label_id, ImS16* xs, ImS16* ys1, ImS16* ys2, CInt count, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImS16.sizeof) @extern("ImPlot_PlotShaded_S16PtrS16PtrS16Ptr");
extern fn void plot_shaded_u16_ptr_u16_ptr_u16_ptr(ZString label_id, ImU16* xs, ImU16* ys1, ImU16* ys2, CInt count, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImU16.sizeof) @extern("ImPlot_PlotShaded_U16PtrU16PtrU16Ptr");
extern fn void plot_shaded_s32_ptr_s32_ptr_s32_ptr(ZString label_id, ImS32* xs, ImS32* ys1, ImS32* ys2, CInt count, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImS32.sizeof) @extern("ImPlot_PlotShaded_S32PtrS32PtrS32Ptr");
extern fn void plot_shaded_u32_ptr_u32_ptr_u32_ptr(ZString label_id, ImU32* xs, ImU32* ys1, ImU32* ys2, CInt count, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImU32.sizeof) @extern("ImPlot_PlotShaded_U32PtrU32PtrU32Ptr");
extern fn void plot_shaded_s64_ptr_s64_ptr_s64_ptr(ZString label_id, ImS64* xs, ImS64* ys1, ImS64* ys2, CInt count, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImS64.sizeof) @extern("ImPlot_PlotShaded_S64PtrS64PtrS64Ptr");
extern fn void plot_shaded_u64_ptr_u64_ptr_u64_ptr(ZString label_id, ImU64* xs, ImU64* ys1, ImU64* ys2, CInt count, ImPlotShadedFlags flags = 0, CInt offset = 0, CInt stride = ImU64.sizeof) @extern("ImPlot_PlotShaded_U64PtrU64PtrU64Ptr");
extern fn void plot_shaded_g(ZString label_id, ImPlotGetter getter1, void* data1, ImPlotGetter getter2, void* data2, CInt count, ImPlotShadedFlags flags = 0) @extern("ImPlot_PlotShadedG");
extern fn void plot_stairs_float_ptr_int(ZString label_id, float* values, CInt count, double xscale = 1, double xstart = 0, ImPlotStairsFlags flags = 0, CInt offset = 0, CInt stride = float.sizeof) @extern("ImPlot_PlotStairs_FloatPtrInt");
extern fn void plot_stairs_double_ptr_int(ZString label_id, double* values, CInt count, double xscale = 1, double xstart = 0, ImPlotStairsFlags flags = 0, CInt offset = 0, CInt stride = double.sizeof) @extern("ImPlot_PlotStairs_doublePtrInt");
extern fn void plot_stairs_s8_ptr_int(ZString label_id, ImS8* values, CInt count, double xscale = 1, double xstart = 0, ImPlotStairsFlags flags = 0, CInt offset = 0, CInt stride = ImS8.sizeof) @extern("ImPlot_PlotStairs_S8PtrInt");
extern fn void plot_stairs_u8_ptr_int(ZString label_id, ImU8* values, CInt count, double xscale = 1, double xstart = 0, ImPlotStairsFlags flags = 0, CInt offset = 0, CInt stride = ImU8.sizeof) @extern("ImPlot_PlotStairs_U8PtrInt");
extern fn void plot_stairs_s16_ptr_int(ZString label_id, ImS16* values, CInt count, double xscale = 1, double xstart = 0, ImPlotStairsFlags flags = 0, CInt offset = 0, CInt stride = ImS16.sizeof) @extern("ImPlot_PlotStairs_S16PtrInt");
extern fn void plot_stairs_u16_ptr_int(ZString label_id, ImU16* values, CInt count, double xscale = 1, double xstart = 0, ImPlotStairsFlags flags = 0, CInt offset = 0, CInt stride = ImU16.sizeof) @extern("ImPlot_PlotStairs_U16PtrInt");
extern fn void plot_stairs_s32_ptr_int(ZString label_id, ImS32* values, CInt count, double xscale = 1, double xstart = 0, ImPlotStairsFlags flags = 0, CInt offset = 0, CInt stride = ImS32.sizeof) @extern("ImPlot_PlotStairs_S32PtrInt");
extern fn void plot_stairs_u32_ptr_int(ZString label_id, ImU32* values, CInt count, double xscale = 1, double xstart = 0, ImPlotStairsFlags flags = 0, CInt offset = 0, CInt stride = ImU32.sizeof) @extern("ImPlot_PlotStairs_U32PtrInt");
extern fn void plot_stairs_s64_ptr_int(ZString label_id, ImS64* values, CInt count, double xscale = 1, double xstart = 0, ImPlotStairsFlags flags = 0, CInt offset = 0, CInt stride = ImS64.sizeof) @extern("ImPlot_PlotStairs_S64PtrInt");
extern fn void plot_stairs_u64_ptr_int(ZString label_id, ImU64* values, CInt count, double xscale = 1, double xstart = 0, ImPlotStairsFlags flags = 0, CInt offset = 0, CInt stride = ImU64.sizeof) @extern("ImPlot_PlotStairs_U64PtrInt");
extern fn void plot_stairs_float_ptr_float_ptr(ZString label_id, float* xs, float* ys, CInt count, ImPlotStairsFlags flags = 0, CInt offset = 0, CInt stride = float.sizeof) @extern("ImPlot_PlotStairs_FloatPtrFloatPtr");
extern fn void plot_stairs_double_ptrdouble_ptr(ZString label_id, double* xs, double* ys, CInt count, ImPlotStairsFlags flags = 0, CInt offset = 0, CInt stride = double.sizeof) @extern("ImPlot_PlotStairs_doublePtrdoublePtr");
extern fn void plot_stairs_s8_ptr_s8_ptr(ZString label_id, ImS8* xs, ImS8* ys, CInt count, ImPlotStairsFlags flags = 0, CInt offset = 0, CInt stride = ImS8.sizeof) @extern("ImPlot_PlotStairs_S8PtrS8Ptr");
extern fn void plot_stairs_u8_ptr_u8_ptr(ZString label_id, ImU8* xs, ImU8* ys, CInt count, ImPlotStairsFlags flags = 0, CInt offset = 0, CInt stride = ImU8.sizeof) @extern("ImPlot_PlotStairs_U8PtrU8Ptr");
extern fn void plot_stairs_s16_ptr_s16_ptr(ZString label_id, ImS16* xs, ImS16* ys, CInt count, ImPlotStairsFlags flags = 0, CInt offset = 0, CInt stride = ImS16.sizeof) @extern("ImPlot_PlotStairs_S16PtrS16Ptr");
extern fn void plot_stairs_u16_ptr_u16_ptr(ZString label_id, ImU16* xs, ImU16* ys, CInt count, ImPlotStairsFlags flags = 0, CInt offset = 0, CInt stride = ImU16.sizeof) @extern("ImPlot_PlotStairs_U16PtrU16Ptr");
extern fn void plot_stairs_s32_ptr_s32_ptr(ZString label_id, ImS32* xs, ImS32* ys, CInt count, ImPlotStairsFlags flags = 0, CInt offset = 0, CInt stride = ImS32.sizeof) @extern("ImPlot_PlotStairs_S32PtrS32Ptr");
extern fn void plot_stairs_u32_ptr_u32_ptr(ZString label_id, ImU32* xs, ImU32* ys, CInt count, ImPlotStairsFlags flags = 0, CInt offset = 0, CInt stride = ImU32.sizeof) @extern("ImPlot_PlotStairs_U32PtrU32Ptr");
extern fn void plot_stairs_s64_ptr_s64_ptr(ZString label_id, ImS64* xs, ImS64* ys, CInt count, ImPlotStairsFlags flags = 0, CInt offset = 0, CInt stride = ImS64.sizeof) @extern("ImPlot_PlotStairs_S64PtrS64Ptr");
extern fn void plot_stairs_u64_ptr_u64_ptr(ZString label_id, ImU64* xs, ImU64* ys, CInt count, ImPlotStairsFlags flags = 0, CInt offset = 0, CInt stride = ImU64.sizeof) @extern("ImPlot_PlotStairs_U64PtrU64Ptr");
extern fn void plot_stairs_g(ZString label_id, ImPlotGetter getter, void* data, CInt count, ImPlotStairsFlags flags = 0) @extern("ImPlot_PlotStairsG");
extern fn void plot_stems_float_ptr_int(ZString label_id, float* values, CInt count, double ref = 0, double scale = 1, double start = 0, ImPlotStemsFlags flags = 0, CInt offset = 0, CInt stride = float.sizeof) @extern("ImPlot_PlotStems_FloatPtrInt");
extern fn void plot_stems_double_ptr_int(ZString label_id, double* values, CInt count, double ref = 0, double scale = 1, double start = 0, ImPlotStemsFlags flags = 0, CInt offset = 0, CInt stride = double.sizeof) @extern("ImPlot_PlotStems_doublePtrInt");
extern fn void plot_stems_s8_ptr_int(ZString label_id, ImS8* values, CInt count, double ref = 0, double scale = 1, double start = 0, ImPlotStemsFlags flags = 0, CInt offset = 0, CInt stride = ImS8.sizeof) @extern("ImPlot_PlotStems_S8PtrInt");
extern fn void plot_stems_u8_ptr_int(ZString label_id, ImU8* values, CInt count, double ref = 0, double scale = 1, double start = 0, ImPlotStemsFlags flags = 0, CInt offset = 0, CInt stride = ImU8.sizeof) @extern("ImPlot_PlotStems_U8PtrInt");
extern fn void plot_stems_s16_ptr_int(ZString label_id, ImS16* values, CInt count, double ref = 0, double scale = 1, double start = 0, ImPlotStemsFlags flags = 0, CInt offset = 0, CInt stride = ImS16.sizeof) @extern("ImPlot_PlotStems_S16PtrInt");
extern fn void plot_stems_u16_ptr_int(ZString label_id, ImU16* values, CInt count, double ref = 0, double scale = 1, double start = 0, ImPlotStemsFlags flags = 0, CInt offset = 0, CInt stride = ImU16.sizeof) @extern("ImPlot_PlotStems_U16PtrInt");
extern fn void plot_stems_s32_ptr_int(ZString label_id, ImS32* values, CInt count, double ref = 0, double scale = 1, double start = 0, ImPlotStemsFlags flags = 0, CInt offset = 0, CInt stride = ImS32.sizeof) @extern("ImPlot_PlotStems_S32PtrInt");
extern fn void plot_stems_u32_ptr_int(ZString label_id, ImU32* values, CInt count, double ref = 0, double scale = 1, double start = 0, ImPlotStemsFlags flags = 0, CInt offset = 0, CInt stride = ImU32.sizeof) @extern("ImPlot_PlotStems_U32PtrInt");
extern fn void plot_stems_s64_ptr_int(ZString label_id, ImS64* values, CInt count, double ref = 0, double scale = 1, double start = 0, ImPlotStemsFlags flags = 0, CInt offset = 0, CInt stride = ImS64.sizeof) @extern("ImPlot_PlotStems_S64PtrInt");
extern fn void plot_stems_u64_ptr_int(ZString label_id, ImU64* values, CInt count, double ref = 0, double scale = 1, double start = 0, ImPlotStemsFlags flags = 0, CInt offset = 0, CInt stride = ImU64.sizeof) @extern("ImPlot_PlotStems_U64PtrInt");
extern fn void plot_stems_float_ptr_float_ptr(ZString label_id, float* xs, float* ys, CInt count, double ref = 0, ImPlotStemsFlags flags = 0, CInt offset = 0, CInt stride = float.sizeof) @extern("ImPlot_PlotStems_FloatPtrFloatPtr");
extern fn void plot_stems_double_ptrdouble_ptr(ZString label_id, double* xs, double* ys, CInt count, double ref = 0, ImPlotStemsFlags flags = 0, CInt offset = 0, CInt stride = double.sizeof) @extern("ImPlot_PlotStems_doublePtrdoublePtr");
extern fn void plot_stems_s8_ptr_s8_ptr(ZString label_id, ImS8* xs, ImS8* ys, CInt count, double ref = 0, ImPlotStemsFlags flags = 0, CInt offset = 0, CInt stride = ImS8.sizeof) @extern("ImPlot_PlotStems_S8PtrS8Ptr");
extern fn void plot_stems_u8_ptr_u8_ptr(ZString label_id, ImU8* xs, ImU8* ys, CInt count, double ref = 0, ImPlotStemsFlags flags = 0, CInt offset = 0, CInt stride = ImU8.sizeof) @extern("ImPlot_PlotStems_U8PtrU8Ptr");
extern fn void plot_stems_s16_ptr_s16_ptr(ZString label_id, ImS16* xs, ImS16* ys, CInt count, double ref = 0, ImPlotStemsFlags flags = 0, CInt offset = 0, CInt stride = ImS16.sizeof) @extern("ImPlot_PlotStems_S16PtrS16Ptr");
extern fn void plot_stems_u16_ptr_u16_ptr(ZString label_id, ImU16* xs, ImU16* ys, CInt count, double ref = 0, ImPlotStemsFlags flags = 0, CInt offset = 0, CInt stride = ImU16.sizeof) @extern("ImPlot_PlotStems_U16PtrU16Ptr");
extern fn void plot_stems_s32_ptr_s32_ptr(ZString label_id, ImS32* xs, ImS32* ys, CInt count, double ref = 0, ImPlotStemsFlags flags = 0, CInt offset = 0, CInt stride = ImS32.sizeof) @extern("ImPlot_PlotStems_S32PtrS32Ptr");
extern fn void plot_stems_u32_ptr_u32_ptr(ZString label_id, ImU32* xs, ImU32* ys, CInt count, double ref = 0, ImPlotStemsFlags flags = 0, CInt offset = 0, CInt stride = ImU32.sizeof) @extern("ImPlot_PlotStems_U32PtrU32Ptr");
extern fn void plot_stems_s64_ptr_s64_ptr(ZString label_id, ImS64* xs, ImS64* ys, CInt count, double ref = 0, ImPlotStemsFlags flags = 0, CInt offset = 0, CInt stride = ImS64.sizeof) @extern("ImPlot_PlotStems_S64PtrS64Ptr");
extern fn void plot_stems_u64_ptr_u64_ptr(ZString label_id, ImU64* xs, ImU64* ys, CInt count, double ref = 0, ImPlotStemsFlags flags = 0, CInt offset = 0, CInt stride = ImU64.sizeof) @extern("ImPlot_PlotStems_U64PtrU64Ptr");
extern fn void plot_text(ZString text, double x, double y, ImVec2 pix_offset = {}, ImPlotTextFlags flags = 0) @extern("ImPlot_PlotText");
extern fn void plot_to_pixels_plot_po_int(ImVec2* p_out, ImPlotPoint plt, ImAxis x_axis = -1, ImAxis y_axis = -1) @extern("ImPlot_PlotToPixels_PlotPoInt");
extern fn void plot_to_pixels_double(ImVec2* p_out, double x, double y, ImAxis x_axis = -1, ImAxis y_axis = -1) @extern("ImPlot_PlotToPixels_double");
extern fn void pop_colormap(CInt count = 1) @extern("ImPlot_PopColormap");
extern fn void pop_plot_clip_rect() @extern("ImPlot_PopPlotClipRect");
extern fn void pop_style_color(CInt count = 1) @extern("ImPlot_PopStyleColor");
extern fn void pop_style_var(CInt count = 1) @extern("ImPlot_PopStyleVar");
extern fn CInt precision(double val) @extern("ImPlot_Precision");
extern fn void push_colormap_plot_colormap(ImPlotColormap cmap) @extern("ImPlot_PushColormap_PlotColormap");
extern fn void push_colormap_str(ZString name) @extern("ImPlot_PushColormap_Str");
extern fn void push_plot_clip_rect(float expand = 0) @extern("ImPlot_PushPlotClipRect");
extern fn void push_style_color_u32(ImPlotCol idx, ImU32 col) @extern("ImPlot_PushStyleColor_U32");
extern fn void push_style_color_vec4(ImPlotCol idx, ImVec4 col) @extern("ImPlot_PushStyleColor_Vec4");
extern fn void push_style_var_float(ImPlotStyleVar idx, float val) @extern("ImPlot_PushStyleVar_Float");
extern fn void push_style_var_int(ImPlotStyleVar idx, CInt val) @extern("ImPlot_PushStyleVar_Int");
extern fn void push_style_var_vec2(ImPlotStyleVar idx, ImVec2 val) @extern("ImPlot_PushStyleVar_Vec2");
extern fn bool ranges_overlap(ImPlotRange r1, ImPlotRange r2) @extern("ImPlot_RangesOverlap");
extern fn ImPlotItem* register_or_get_item(ZString label_id, ImPlotItemFlags flags, bool* just_created = null) @extern("ImPlot_RegisterOrGetItem");
extern fn void render_color_bar(ImU32* colors, CInt size, ImDrawList* draw_list, ImRect bounds, bool vert, bool reversed, bool continuous) @extern("ImPlot_RenderColorBar");
extern fn void reset_ctx_for_next_aligned_plots(ImPlotContext* ctx) @extern("ImPlot_ResetCtxForNextAlignedPlots");
extern fn void reset_ctx_for_next_plot(ImPlotContext* ctx) @extern("ImPlot_ResetCtxForNextPlot");
extern fn void reset_ctx_for_next_subplot(ImPlotContext* ctx) @extern("ImPlot_ResetCtxForNextSubplot");
extern fn void round_time(ImPlotTime* p_out, ImPlotTime t, ImPlotTimeUnit unit) @extern("ImPlot_RoundTime");
extern fn double round_to(double val, CInt prec) @extern("ImPlot_RoundTo");
extern fn void sample_colormap(ImVec4* p_out, float t, ImPlotColormap cmap = -1) @extern("ImPlot_SampleColormap");
extern fn ImU32 sample_colormap_u32(float t, ImPlotColormap cmap) @extern("ImPlot_SampleColormapU32");
extern fn void set_axes(ImAxis x_axis, ImAxis y_axis) @extern("ImPlot_SetAxes");
extern fn void set_axis(ImAxis axis) @extern("ImPlot_SetAxis");
extern fn void set_current_context(ImPlotContext* ctx) @extern("ImPlot_SetCurrentContext");
extern fn void set_im_gui_context(ImGuiContext* ctx) @extern("ImPlot_SetImGuiContext");
extern fn void set_next_axes_limits(double x_min, double x_max, double y_min, double y_max, ImPlotCond cond = ImPlotCond.ONCE) @extern("ImPlot_SetNextAxesLimits");
extern fn void set_next_axes_to_fit() @extern("ImPlot_SetNextAxesToFit");
extern fn void set_next_axis_limits(ImAxis axis, double v_min, double v_max, ImPlotCond cond = ImPlotCond.ONCE) @extern("ImPlot_SetNextAxisLimits");
extern fn void set_next_axis_links(ImAxis axis, double* link_min, double* link_max) @extern("ImPlot_SetNextAxisLinks");
extern fn void set_next_axis_to_fit(ImAxis axis) @extern("ImPlot_SetNextAxisToFit");
extern fn void set_next_error_bar_style(ImVec4 col = {0, 0, 0, -1}, float size = -1, float weight = -1) @extern("ImPlot_SetNextErrorBarStyle");
extern fn void set_next_fill_style(ImVec4 col = {0, 0, 0, -1}, float alpha_mod = -1) @extern("ImPlot_SetNextFillStyle");
extern fn void set_next_line_style(ImVec4 col = {0, 0, 0, -1}, float weight = -1) @extern("ImPlot_SetNextLineStyle");
extern fn void set_next_marker_style(ImPlotMarker marker = -1, float size = -1, ImVec4 fill = {0, 0, 0, -1}, float weight = -1, ImVec4 outline = {0, 0, 0, -1}) @extern("ImPlot_SetNextMarkerStyle");
extern fn void setup_axes(ZString x_label, ZString y_label, ImPlotAxisFlags x_flags = 0, ImPlotAxisFlags y_flags = 0) @extern("ImPlot_SetupAxes");
extern fn void setup_axes_limits(double x_min, double x_max, double y_min, double y_max, ImPlotCond cond = ImPlotCond.ONCE) @extern("ImPlot_SetupAxesLimits");
extern fn void setup_axis(ImAxis axis, ZString label = null, ImPlotAxisFlags flags = 0) @extern("ImPlot_SetupAxis");
extern fn void setup_axis_format_str(ImAxis axis, ZString fmt) @extern("ImPlot_SetupAxisFormat_Str");
extern fn void setup_axis_format_plot_formatter(ImAxis axis, ImPlotFormatter formatter, void* data = null) @extern("ImPlot_SetupAxisFormat_PlotFormatter");
extern fn void setup_axis_limits(ImAxis axis, double v_min, double v_max, ImPlotCond cond = ImPlotCond.ONCE) @extern("ImPlot_SetupAxisLimits");
extern fn void setup_axis_limits_constraints(ImAxis axis, double v_min, double v_max) @extern("ImPlot_SetupAxisLimitsConstraints");
extern fn void setup_axis_links(ImAxis axis, double* link_min, double* link_max) @extern("ImPlot_SetupAxisLinks");
extern fn void setup_axis_scale_plot_scale(ImAxis axis, ImPlotScale scale) @extern("ImPlot_SetupAxisScale_PlotScale");
extern fn void setup_axis_scale_plot_transform(ImAxis axis, ImPlotTransform forward, ImPlotTransform inverse, void* data = null) @extern("ImPlot_SetupAxisScale_PlotTransform");
extern fn void setup_axis_ticks_double_ptr(ImAxis axis, double* values, CInt n_ticks, ZString* labels = null, bool keep_default = false) @extern("ImPlot_SetupAxisTicks_doublePtr");
extern fn void setup_axis_ticks_double(ImAxis axis, double v_min, double v_max, CInt n_ticks, ZString* labels = null, bool keep_default = false) @extern("ImPlot_SetupAxisTicks_double");
extern fn void setup_axis_zoom_constraints(ImAxis axis, double z_min, double z_max) @extern("ImPlot_SetupAxisZoomConstraints");
extern fn void setup_finish() @extern("ImPlot_SetupFinish");
extern fn void setup_legend(ImPlotLocation location, ImPlotLegendFlags flags = 0) @extern("ImPlot_SetupLegend");
extern fn void setup_lock() @extern("ImPlot_SetupLock");
extern fn void setup_mouse_text(ImPlotLocation location, ImPlotMouseTextFlags flags = 0) @extern("ImPlot_SetupMouseText");
extern fn void show_alt_legend(ZString title_id, bool vertical = true, ImVec2 size = {}, bool interactable = true) @extern("ImPlot_ShowAltLegend");
extern fn void show_axis_context_menu(ImPlotAxis* axis, ImPlotAxis* equal_axis, bool time_allowed = false) @extern("ImPlot_ShowAxisContextMenu");
extern fn bool show_colormap_selector(ZString label) @extern("ImPlot_ShowColormapSelector");
extern fn bool show_date_picker(ZString id, CInt* level, ImPlotTime* t, ImPlotTime* t1 = null, ImPlotTime* t2 = null) @extern("ImPlot_ShowDatePicker");
extern fn void show_demo_window(bool* p_open = null) @extern("ImPlot_ShowDemoWindow");
extern fn bool show_input_map_selector(ZString label) @extern("ImPlot_ShowInputMapSelector");
extern fn bool show_legend_context_menu(ImPlotLegend* legend, bool visible) @extern("ImPlot_ShowLegendContextMenu");
extern fn bool show_legend_entries(ImPlotItemGroup* items, ImRect legend_bb, bool interactable, ImVec2 pad, ImVec2 spacing, bool vertical, ImDrawList* draw_list) @extern("ImPlot_ShowLegendEntries");
extern fn void show_metrics_window(bool* p_popen = null) @extern("ImPlot_ShowMetricsWindow");
extern fn void show_plot_context_menu(ImPlotPlot* plot) @extern("ImPlot_ShowPlotContextMenu");
extern fn void show_style_editor(ImPlotStyle* ref = null) @extern("ImPlot_ShowStyleEditor");
extern fn bool show_style_selector(ZString label) @extern("ImPlot_ShowStyleSelector");
extern fn void show_subplots_context_menu(ImPlotSubplot* subplot) @extern("ImPlot_ShowSubplotsContextMenu");
extern fn bool show_time_picker(ZString id, ImPlotTime* t) @extern("ImPlot_ShowTimePicker");
extern fn void show_user_guide() @extern("ImPlot_ShowUserGuide");
extern fn void style_colors_auto(ImPlotStyle* dst = null) @extern("ImPlot_StyleColorsAuto");
extern fn void style_colors_classic(ImPlotStyle* dst = null) @extern("ImPlot_StyleColorsClassic");
extern fn void style_colors_dark(ImPlotStyle* dst = null) @extern("ImPlot_StyleColorsDark");
extern fn void style_colors_light(ImPlotStyle* dst = null) @extern("ImPlot_StyleColorsLight");
extern fn void subplot_next_cell() @extern("ImPlot_SubplotNextCell");
extern fn void tag_xbool(double x, ImVec4 col, bool round = false) @extern("ImPlot_TagX_Bool");
extern fn void tag_xstr(double x, ImVec4 col, ZString fmt, ...) @extern("ImPlot_TagX_Str");
extern fn void tag_ybool(double y, ImVec4 col, bool round = false) @extern("ImPlot_TagY_Bool");
extern fn void tag_ystr(double y, ImVec4 col, ZString fmt, ...) @extern("ImPlot_TagY_Str");
extern fn void today(ImPlotTime* p_out) @extern("ImPlot_Today");
extern fn double transform_forward_log10(double v, void* noname1) @extern("ImPlot_TransformForward_Log10");
extern fn double transform_forward_logit(double v, void* noname1) @extern("ImPlot_TransformForward_Logit");
extern fn double transform_forward_sym_log(double v, void* noname1) @extern("ImPlot_TransformForward_SymLog");
extern fn double transform_inverse_log10(double v, void* noname1) @extern("ImPlot_TransformInverse_Log10");
extern fn double transform_inverse_logit(double v, void* noname1) @extern("ImPlot_TransformInverse_Logit");
extern fn double transform_inverse_sym_log(double v, void* noname1) @extern("ImPlot_TransformInverse_SymLog");
