module igfd;

import std;
import ig;

// Written manually.
// At the end of `ImGuiFileDialog.h` is a section `C LANG API`.
// We write binding for all functions except:
// - functions for feature `USE_THUMBNAILS`,
// - functions for feature `USE_EXPLORATION_BY_KEYS`
// - and functions for (de)serialization of bookmarks.

typedef FileDialog = void;

enum FileStyleFlags : const CInt
{
    NONE                      = 0,         // define none style
    BY_TYPE_FILE              = (1 << 0),  // define style for all files
    BY_TYPE_DIR               = (1 << 1),  // define style for all dir
    BY_TYPE_LINK              = (1 << 2),  // define style for all link
    BY_EXTENTION              = (1 << 3),  // define style by extention, for files or links
    BY_FULL_NAME              = (1 << 4),  // define style for particular file/dir/link full name (filename + extention)
    BY_CONTAINED_IN_FULL_NAME = (1 << 5),  // define style for file/dir/link when criteria is contained in full name
}

enum FileDialogFlags : const CInt
{
    NONE                                 = 0,
    CONFIRM_OVERWRITE                    = (1 << 0),   // show confirm to overwrite dialog
    DONT_SHOW_HIDDEN_FILES               = (1 << 1),   // dont show hidden files (file starting with a .)
    DISABLE_CREATE_DIRECTORY_BUTTON      = (1 << 2),
    HIDE_COLUMN_TYPE                     = (1 << 3),
    HIDE_COLUMN_SIZE                     = (1 << 4),
    HIDE_COLUMN_DATE                     = (1 << 5),
    NO_DIALOG                            = (1 << 6),   // let the dialog embedded in your own imgui begin / end scope
    READ_ONLY_FILE_NAME_FIELD            = (1 << 7),   // don't let user type in filename field for file open style dialogs
    CASE_INSENSITIVE_EXTENTION_FILTERING = (1 << 8),   // the file extentions filtering will not take into account the case
    MODAL                                = (1 << 9),
    DISABLE_THUMBNAIL_MODE               = (1 << 10),
    DISABLE_PLACE_MODE                   = (1 << 11),
    DISABLE_QUICK_PATH_SELECTION         = (1 << 12),
    SHOW_DEVICES_BUTTON                  = (1 << 13),
    NATURAL_SORTING                      = (1 << 14),  // enable the natural sorting for filenames and extentions, slower than standard sorting
    DEFAULT =
        FileDialogFlags.CONFIRM_OVERWRITE |
        FileDialogFlags.MODAL |
        FileDialogFlags.HIDE_COLUMN_TYPE,
}

// flags used for GetFilePathName(flag) or GetSelection(flag)
enum ResultMode : const CInt
{
    // add the file ext only if there is no file ext
    //   filter {.cpp,.h} with file :
    //     toto.h => toto.h
    //     toto.a.h => toto.a.h
    //     toto.a. => toto.a.cpp
    //     toto. => toto.cpp
    //     toto => toto.cpp
    //   filter {.z,.a.b} with file :
    //     toto.a.h => toto.a.h
    //     toto. => toto.z
    //     toto => toto.z
    //   filter {.g.z,.a} with file :
    //     toto.a.h => toto.a.h
    //     toto. => toto.g.z
    //     toto => toto.g.z
    ADD_IF_NO_FILE_EXT = 0,  // default
    // Overwrite the file extention by the current filter :
    //   filter {.cpp,.h} with file :
    //     toto.h => toto.cpp
    //     toto.a.h => toto.a.cpp
    //     toto.a. => toto.a.cpp
    //     toto.a.h.t => toto.a.h.cpp
    //     toto. => toto.cpp
    //     toto => toto.cpp
    //   filter {.z,.a.b} with file :
    //     toto.a.h => toto.z
    //     toto.a.h.t => toto.a.z
    //     toto. => toto.z
    //     toto => toto.z
    //   filter {.g.z,.a} with file :
    //     toto.a.h => toto.g.z
    //     toto.a.h.y => toto.a.g.z
    //     toto.a. => toto.g.z
    //     toto. => toto.g.z
    //     toto => toto.g.z
    OVERWRITE_FILE_EXT = 1,  // behavior pre IGFD v0.6.6
    // IGFD_ResultMode_KeepInputFile
    // keep the input file => no modification :
    //   filter {.cpp,.h} with file :
    //      toto.h => toto.h
    //      toto. => toto.
    //      toto => toto
    //   filter {.z,.a.b} with file :
    //      toto.a.h => toto.a.h
    //      toto. => toto.
    //      toto => toto
    //   filter {.g.z,.a} with file :
    //      toto.a.h => toto.a.h
    //      toto. => toto.
    //      toto => toto
    KEEP_INPUT_FILE = 2,
}

// Callback for display the pane.
alias PaneCb = fn void(ZString, void*, bool*);

struct FileDialogConfig
{
    ZString path;
    // Default file name.
    ZString filename;
    // If not empty, the filename and the path will be obtained from `file_path_name`.
    ZString file_path_name;
    int count_selection_max;
    // User data (can be retrieved in pane).
    void* user_data;
    PaneCb side_pane_cb;
    float side_pane_width;
    FileDialogFlags flags;
}

// ZII doesn't work well for `FileDialogConfig`.
extern fn FileDialogConfig file_dialog_config_init() @extern("IGFD_FileDialog_Config_Get");

struct SelectionPair
{
    ZString filename;
    ZString file_path_name;
}

// Not necessary because ZII is fine for `SelectionPair`.
//extern fn SelectionPair selection_pair_init() @extern("IGFD_Selection_Pair_Get");
extern fn void SelectionPair.destroy_content(SelectionPair* vSelection_Pair) @extern("IGFD_Selection_Pair_DestroyContent");

struct Selection
{
    SelectionPair* table;
    usz count;
}

// Not necessary because ZII is fine for `Selection`.
//extern fn Selection selection_init() @extern("IGFD_Selection_Get");
extern fn void Selection.destroy_content(Selection* self) @extern("IGFD_Selection_DestroyContent");

extern fn FileDialog* new_file_dialog() @extern("IGFD_Create");
extern fn void FileDialog.destroy(FileDialog* self) @extern("IGFD_Destroy");

// Open a standard dialog.
extern fn void FileDialog.open(
    FileDialog* self,
    ZString key,
    ZString title,
    // Filters/filter collections. Set it to null for directory mode.
    ZString filters,
    FileDialogConfig config) @extern("IGFD_OpenDialog");

// Display the dialog.
extern fn bool FileDialog.display(
    FileDialog* self,
    // `key` dialog to display (if not the same key as defined by OpenDialog => no opening).
    ZString key,
    ImGuiWindowFlags flags = ImGuiWindowFlags.NO_COLLAPSE,
    // Minimal size constraint for the ImGuiWindow.
    ImVec2 min_size = {},
    // Maximal size constraint for the ImGuiWindow.
    ImVec2 max_size = {math::FLOAT_MAX, math::FLOAT_MAX}) @extern("IGFD_DisplayDialog");

// Close the dialog.
extern fn void FileDialog.close(FileDialog* self) @extern("IGFD_CloseDialog");

// `true` => Dialog Closed with Ok result, `false` => Dialog closed with cancel result.
extern fn bool FileDialog.is_ok(FileDialog* self) @extern("IGFD_IsOk");

// Say if the dialog `key` was already opened this frame.
//
// CONSIDER: Call this `was_key_displayed_this_frame`?
extern fn bool FileDialog.was_key_opened_this_frame(FileDialog* self, ZString key) @extern("IGFD_WasKeyOpenedThisFrame");

// Say if the dialog was already opened this frame.
//
// CONSIDER: Call this `was_displayed_this_frame`?
extern fn bool FileDialog.was_opened_this_frame(FileDialog* self) @extern("IGFD_WasOpenedThisFrame");

// Say if the dialog key is opened.
extern fn bool FileDialog.is_key_opened(FileDialog* self, ZString current_opened_key) @extern("IGFD_IsKeyOpened");

// Say if the dialog is opened somewhere.
extern fn bool FileDialog.is_opened(FileDialog* self) @extern("IGFD_IsOpened");

// Content of returned `Selection` must be freed by `Selection.destroy_content`.
extern fn Selection FileDialog.get_selection(FileDialog* self, ResultMode mode) @extern("IGFD_GetSelection");

// Save File behavior: will always return the content of the field
// with current filter extention and current path.
//
// You must free returned `ZString` by `libc::free` because it is allocated by `malloc`.
extern fn ZString FileDialog.get_file_path_name(
    FileDialog* self,
    ResultMode mode = ResultMode.ADD_IF_NO_FILE_EXT) @extern("IGFD_GetFilePathName");

// Save File behavior: will always return the content of the field with current filter extention.
//
// You must free returned `ZString` by `libc::free` because it is allocated by `malloc`.
extern fn ZString FileDialog.get_current_file_name(
    FileDialog* self,
    ResultMode mode = ResultMode.ADD_IF_NO_FILE_EXT) @extern("IGFD_GetCurrentFileName");

// You must free returned `ZString` by `libc::free` because it is allocated by `malloc`.
extern fn ZString FileDialog.get_current_path(FileDialog* self) @extern("IGFD_GetCurrentPath");

// You must free returned `ZString` by `libc::free` because it is allocated by `malloc`.
extern fn ZString FileDialog.get_current_filter(FileDialog* self) @extern("IGFD_GetCurrentFilter");

extern fn void* FileDialog.get_user_data(FileDialog* self) @extern("IGFD_GetUserDatas");

extern fn void FileDialog.set_file_style(
    FileDialog* self,
    FileStyleFlags file_style_flags,
    ZString filter,
    ImVec4 color,
    ZString icon_text,
    ImFont* font) @extern("IGFD_SetFileStyle");

extern fn void FileDialog.set_file_style2(
    FileDialog* self,
    FileStyleFlags file_style_flags,
    ZString filter,
    float r, float g, float b, float a,
    ZString icon_text,
    ImFont* font) @extern("IGFD_SetFileStyle2");

// You must free `out_icon_text` by `libc::free` because it is allocated by `malloc`.
extern fn bool FileDialog.get_file_style(
    FileDialog* self,
    FileStyleFlags file_style_flags,
    ZString filter,
    ImVec4* out_color,
    ZString* out_icon_text,
    ImFont** out_font) @extern("IGFD_GetFileStyle");

extern fn void FileDialog.clear_files_style(FileDialog* self) @extern("IGFD_ClearFilesStyle");

// `begin_locale` is locale to use at beginning of the dialog display.
// `end_locale` is locale to set at end of the dialog display.
extern fn void FileDialog.set_locales(
    FileDialog* self,
    CInt category,
    ZString begin_locale,
    ZString end_locale) @extern("SetLocales");

extern fn bool FileDialog.add_places_group(
    FileDialog* self,
    ZString group_name,
    usz display_order,
    bool can_be_edited) @extern("IGFD_AddPlacesGroup");

extern fn bool FileDialog.remove_places_group(FileDialog* self, ZString group_name) @extern("IGFD_RemovePlacesGroup");

// Return `true` if succeeded.
extern fn bool FileDialog.add_place(
    FileDialog* self,
    ZString group_name,
    ZString place_name,
    ZString place_path,
    bool can_be_saved,
    // Wanted text or icon of the file with extension filter (can be used with font icon).
    ZString icon_text) @extern("IGFD_AddPlace");

// Return `true` if succeeded.
extern fn bool FileDialog.remove_place(
    FileDialog* self,
    ZString group_name,
    ZString place_name) @extern("IGFD_RemovePlace");
