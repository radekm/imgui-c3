
import std;
import libc;  // For `strncmp`.

fn int cmp_string(String a, String b)
{
    CInt s = libc::strncmp(a, b, min(a.len, b.len));
    if (s < 0) return -1;
    if (s > 0) return 1;
    if (a.len < b.len) return -1;
    if (a.len > b.len) return 1;
    return 0;
}

macro @each_asc(map; @body(key, value))
{
    String[] keys = map.tcopy_keys();
    sort::quicksort(keys, &cmp_string);
    foreach (String key : keys)
    {
        @body(key, map[key]!!);
    }
}

const bool GENERATE_GUI @if($feature(GENERATE_GUI)) = true;
const bool GENERATE_GUI @if($feature(GENERATE_PLOT)) = false;

const String ENUM_PREFIX_TO_DROP = GENERATE_GUI ? "ImGui" : "ImPlot";
// Dropped from function excpect for instance methods.
const String FUNC_PREFIX_TO_DROP = GENERATE_GUI ? "ig" : "ImPlot_";
String current_module = GENERATE_GUI ? "ig" : "ipl";

fault GeneratorError
{
    INVALID_DEFINITION,
    UNKNOWN_TYPE,
    UNKNOWN_FIELD_WITH_FUNCTION_POINTER,
}

fn bool is_typedef_predefined(String alias_name)
{
    // These types are already defined as aliases or structs.
    switch (alias_name)
    {
        case "ImStbTexteditState":
        case "ImBitArrayForNamedKeys":
        case "ImWchar16":
        case "ImWchar32":
        case "ImWchar":
        case "ImS8":
        case "ImS16":
        case "ImS32":
        case "ImS64":
        case "ImU8":
        case "ImU16":
        case "ImU32":
        case "ImU64":
            return true;
        default:
            return false;
    }
}

fn String! translate_type_in_typedef(String type, String name)
{
$if GENERATE_GUI:
    switch (type)
    {
        case "void (*)(ImGuiContext* ctx, void* user_data, const char* msg);":
            return "fn void(ImGuiContext* ctx, void* user_data, char* msg)";
        case "int (*)(ImGuiInputTextCallbackData* data);":
            return "fn int(ImGuiInputTextCallbackData* data)";
        case "void (*)(ImGuiSizeCallbackData* data);":
            return "fn void(ImGuiSizeCallbackData* data)";
        case "void* (*)(size_t sz, void* user_data);":
            return "fn void*(usz sz, void* user_data)";
        case "void (*)(void* ptr, void* user_data);":
            return "fn void(void* ptr, void* user_data)";
        case "void (*)(const ImDrawList* parent_list, const ImDrawCmd* cmd);":
            return "fn void(ImDrawList* parent_list, ImDrawCmd* cmd)";
        case "void (*)(ImGuiContext* ctx, ImGuiContextHook* hook);":
            return "fn void(ImGuiContext* ctx, ImGuiContextHook* hook)";
        default:
            return translate_non_array_type(type, name);
    }
$else
    switch (type)
    {
        case "int (*)(double value, char* buff, int size, void* user_data);":
            return "fn int(double value, ZString buff, CInt size, void* user_data)";
        case "void (*)(ImPlotTicker& ticker, const ImPlotRange& range, float pixels, bool vertical, ImPlotFormatter formatter, void* formatter_data);":
            return "fn void(ImPlotTicker* ticker, ImPlotRange* range, float pixels, bool vertical, ImPlotFormatter formatter, void* formatter_data)";
        case "double (*)(double value, void* user_data);":
            return "fn double(double value, void* user_data)";
        case "ImPlotPoint (*)(int idx, void* user_data);":
            return "fn ImPlotPoint(CInt idx, void* user_data)";
        default:
            return translate_non_array_type(type, name);
    }
$endif
}

fn void! generate_typedefs(Object* node)
{
    if (!node.is_map()) return GeneratorError.INVALID_DEFINITION?;

    @each_asc(node.map; String alias_name, Object* val)
    {
        if (!val.is_string()) return GeneratorError.INVALID_DEFINITION?;
        String type = val.s;

        bool generate_alias = true;
        generate_alias = generate_alias && !is_typedef_predefined(alias_name);
        generate_alias = generate_alias && !type.starts_with("struct ");  // Don't generate aliases for structs.
        if (generate_alias)
        {
            String c3_type = translate_type_in_typedef(type, alias_name)!;
            // Generate distinct alias expect for function pointers.
            if (c3_type.starts_with("fn "))
            {
                io::printfn("def %s = %s;", alias_name, c3_type);                   
            }
            else
            {
                io::printfn("distinct %s = %s;", alias_name, c3_type);   
            }
        }        
    };
}

// For array fields `name` will include square brackets (eg. `SearchBuffer[64]`).
fn String translate_field_name(String name)
{
    // Ignore square brackets.
    if (try array_size_idx = name.index_of_char('['))
    {
        name = name[:array_size_idx];
    }

    DString result = dstring::temp_new();
    bool last_letter_upper_or_underscore = true;
    foreach (c : name)
    {
        if (c.is_upper() || c == '_')
        {
            if (!last_letter_upper_or_underscore) result.append_char('_');
            result.append_char(c + 'a' - 'A');
            last_letter_upper_or_underscore = true;
        }
        else
        {
            result.append_char(c);
            last_letter_upper_or_underscore = false;
        }
    }

    // If the name is keyword, then append underscore.
    if (result.str_view() == "char") result.append_char('_');
    return result.str_view();
}

fn String translate_constant_name(String name)
{
    name = translate_field_name(name);
    name.convert_ascii_to_upper();
    
    // Special treatment for constants of `ImGuiKey` which represent numbers 0, 1, 2, ...
    if (name != "" && name[0].is_digit()) return string::tformat("KEY_%s", name);
    return name;
}

// `name` is either field name or type alias name.
fn String! translate_non_array_type(String type, String name)
{    
    type = type.trim();
    // Ignore `const`.
    type = type.strip("const ");
    // Ignore `struct`.
    type = type.strip("struct ");

$if GENERATE_GUI:
    switch (type)
    {
        // Function pointers when generating structs.
        case "void(*)(ImGuiContext* ctx,ImGuiSettingsHandler* handler)":
            if (name == "ClearAllFn" || name == "ReadInitFn" || name == "ApplyAllFn") return string::tformat("Settings_%s", name);
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "void*(*)(ImGuiContext* ctx,ImGuiSettingsHandler* handler,const char* name)":
            if (name == "ReadOpenFn") return "Settings_ReadOpenFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "void(*)(ImGuiContext* ctx,ImGuiSettingsHandler* handler,void* entry,const char* line)":
            if (name == "ReadLineFn") return "Settings_ReadLineFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "void(*)(ImGuiContext* ctx,ImGuiSettingsHandler* handler,ImGuiTextBuffer* out_buf)":
            if (name == "WriteAllFn") return "Settings_WriteAllFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "void(*)(ImGuiContext* ctx,ImGuiDockNode* node,ImGuiTabBar* tab_bar)":            
            if (name == "DockNodeWindowMenuHandler") return "Context_DockNodeWindowMenuHandler";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "bool(*)(ImFontAtlas* atlas)":            
            if (name == "FontBuilder_Build") return "FontBuilder_Build";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "char*(*)(ImGuiContext* ctx)":
            if (name == "Platform_GetClipboardTextFn") return "Platform_GetClipboardTextFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "void(*)(ImGuiContext* ctx,const char* text)":
            if (name == "Platform_SetClipboardTextFn") return "Platform_SetClipboardTextFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "bool(*)(ImGuiContext* ctx,const char* path)":
            if (name == "Platform_OpenInShellFn") return "Platform_OpenInShellFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "void(*)(ImGuiContext* ctx,ImGuiViewport* viewport,ImGuiPlatformImeData* data)":
            if (name == "Platform_SetImeDataFn") return "Platform_SetImeDataFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "void(*)(ImGuiViewport* vp)":
            if (name == "Platform_CreateWindow" || name == "Platform_DestroyWindow" || name == "Platform_ShowWindow" || name == "Platform_SetWindowFocus" || name == "Platform_UpdateWindow" || name == "Platform_OnChangedViewport" || name == "Renderer_CreateWindow" || name == "Renderer_DestroyWindow") return "Platform_WindowActionFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "void(*)(ImGuiViewport* vp,ImVec2 pos)":
            if (name == "Platform_SetWindowPos") return "Platform_SetWindowPosOrSizeFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "void(*)(ImGuiViewport* vp,ImVec2 size)":
            if (name == "Platform_SetWindowSize" || name == "Renderer_SetWindowSize") return "Platform_SetWindowPosOrSizeFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "ImVec2(*)(ImGuiViewport* vp)":
            if (name == "Platform_GetWindowPos" || name == "Platform_GetWindowSize") return "Platform_GetWindowPosOrSizeFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "ImVec4(*)(ImGuiViewport* vp)":
            if (name == "Platform_GetWindowWorkAreaInsets") return "Platform_GetWindowWorkAreaInsetsFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "bool(*)(ImGuiViewport* vp)":
            if (name == "Platform_GetWindowFocus" || name == "Platform_GetWindowMinimized") return "Platform_GetWindowBoolPropFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;            
        case "void(*)(ImGuiViewport* vp,const char* str)":
            if (name == "Platform_SetWindowTitle") return "Platform_SetWindowTitleFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;            
        case "void(*)(ImGuiViewport* vp,float alpha)":
            if (name == "Platform_SetWindowAlpha") return "Platform_SetWindowAlphaFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;            
        case "void(*)(ImGuiViewport* vp,void* render_arg)":
            if (name == "Platform_RenderWindow" || name == "Platform_SwapBuffers" || name == "Renderer_RenderWindow" || name == "Renderer_SwapBuffers") return "Platform_RenderActionFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;            
        case "float(*)(ImGuiViewport* vp)":
            if (name == "Platform_GetWindowDpiScale") return "Platform_GetWindowDpiScaleFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;            
        case "int(*)(ImGuiViewport* vp,ImU64 vk_inst,const void* vk_allocators,ImU64* out_vk_surface)":
            if (name == "Platform_CreateVkSurface") return "Platform_CreateVkSurfaceFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "ImGuiID(*)(ImGuiSelectionBasicStorage* self,int idx)":
            if (name == "AdapterIndexToStorageId") return "SelectionStorage_AdapterIndexToStorageIdFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "void(*)(ImGuiSelectionExternalStorage* self,int idx,bool selected)":
            if (name == "AdapterSetItemSelected") return "SelectionStorage_AdapterSetItemSelectedFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;

        // Complex types.
        case "union { int BackupInt[2]; float BackupFloat[2];}":
            return "union { CInt[2] backup_int; float[2] backup_float; }";
        case "union { ImGuiInputEventMousePos MousePos; ImGuiInputEventMouseWheel MouseWheel; ImGuiInputEventMouseButton MouseButton; ImGuiInputEventMouseViewport MouseViewport; ImGuiInputEventKey Key; ImGuiInputEventText Text; ImGuiInputEventAppFocused AppFocused;}":
            return "union { ImGuiInputEventMousePos mouse_pos; ImGuiInputEventMouseWheel mouse_wheel; ImGuiInputEventMouseButton mouse_button; ImGuiInputEventMouseViewport mouse_viewport; ImGuiInputEventKey key; ImGuiInputEventText text; ImGuiInputEventAppFocused app_focused; }";
        case "union { int val_i; float val_f; void* val_p;}":
            return "union { int val_i; float val_f; void* val_p; }";
    }
$endif

    switch (type)
    {
        case "signed char": return "ichar";
        case "unsigned short": return "CUShort";
        case "short": return "CShort";
        case "unsigned int": return "CUInt";
        case "unsigned int*": return "CUInt*";
        case "int":
        case "signed int":
            return "CInt";
        case "int*":
            return "CInt*";
        case "size_t": return "usz";
        case "size_t*": return "usz*";
        case "bool":
        case "bool*":
        case "float":
        case "float*":
        case "double":
        case "double*":
        case "void":
        case "void*":
        case "void**":
            return type;

        // NOTE: It seems that `unsigned char` is not used for strings.
        case "unsigned char": return "char";
        case "unsigned char*": return "char*";        
        case "unsigned char**": return "char**";        
        case "char": return "char";  // NOTE: This is also applied for char arrays.
        // Maybe we shouldn't return `ZString` for `ImFont_CalcTextSizeA`.
        case "char*": return "ZString";
        case "char* const[]": return "ZString*";
        case "char**": return "char**";

        case "FILE*": return "libc::CFile";
        case "tm": return "libc::Tm";
        case "tm*": return "libc::Tm*";
        case "time_t": return "libc::Time_t";

        default:

            // Translate templated type to non-templated but with the same size.
            if (type.starts_with("ImVector_")) return "ImVector";
            if (type.starts_with("ImSpan_")) return "ImSpan";
            if (type.starts_with("ImPool_")) return "ImPool";
            if (type.starts_with("ImChunkStream_")) return "ImChunkStream";

            // Translate ImGui types to themselves.
            if (type.starts_with("Im")) return type;

            io::printfn("Unknown type '%s' of '%s'", type, name);
            return GeneratorError.UNKNOWN_TYPE?;
    }
}

fn String! translate_array_size(String size)
{
$if GENERATE_GUI:
    // Handle case when array size is specified by number of items in enum.
    // For example array size `ImGuiKey_NamedKey_COUNT` shoule be translated to `key::NAMED_KEY_COUNT`.
    if (size.starts_with("ImGui") && size.ends_with("_COUNT"))
    {
        size = size.strip("ImGui");
        usz first_underscore_idx = size.index_of_char('_')!;
        // Because count uses distinct type we have to convert it to `usz`.
        return string::tformat("(usz)%s::%s", translate_field_name(size[:first_underscore_idx]), translate_constant_name(size[first_underscore_idx+1..]));
    }
    return size;
$else
    if (size == "ImAxis_COUNT") return "(usz)ipl::axis::COUNT";
    if (size == "ImPlotCol_COUNT") return "(usz)ipl::col::COUNT";
    return size;
$endif
}

// For arrays name contains array size (eg. `SearchBuffer[64]`) and we have to move it to type.
fn String! translate_maybe_array_type(String type, String name)
{
    if (try array_size_idx = name.index_of_char('['))
    {
        return string::tformat("%s[%s]", translate_non_array_type(type, name), translate_array_size(name[array_size_idx+1..^2])!);
    }
    else
    {
        return translate_non_array_type(type, name);
    }
}

fn void! generate_structs_and_enums(Object* node)
{
    if (!node.is_map()) return GeneratorError.INVALID_DEFINITION?;

    Object* enum_types_obj = node.get("enumtypes")!;
    if (!enum_types_obj.is_keyable()) return GeneratorError.INVALID_DEFINITION?;

    @each_asc(node.map; String key, Object* val)
    {
        switch (key)
        {
            // Ignore.
            case "enumtypes":
            case "locations":
            case "typenames":
            case "templates_done":
            case "templated_structs":
                break;
            case "structs":
                if (!val.is_map()) return GeneratorError.INVALID_DEFINITION?;

$if !GENERATE_GUI:
                io::printfn("import libc;");
                io::printfn("import ig;");
$endif

                @each_asc(val.map; String struct_name, Object* desc)
                {
                    if (!desc.is_array()) return GeneratorError.INVALID_DEFINITION?;
                    List(<Object*>) fields = desc.array;

                    io::printfn("struct %s", struct_name);
                    io::printfn("{");
                    foreach (field : fields)
                    {
                        String name = field.get_string("name")!;
                        String type = field.get_string("type")!;
                        if (name == "")
                        {
                            // Empty `name` means that field has union type.
                            io::printfn("    %s", translate_maybe_array_type(type, name)!);                            
                        }
                        else
                        {
                            io::printfn("    %s %s;", translate_maybe_array_type(type, name)!, translate_field_name(name));
                        }
                    }
                    io::printfn("}");
                };
                break;
            case "enums":
                if (!val.is_map()) return GeneratorError.INVALID_DEFINITION?;
                @each_asc(val.map; String enum_name, Object* desc)
                {
                    if (!desc.is_array()) return GeneratorError.INVALID_DEFINITION?;
                    List(<Object*>) items = desc.array;

                    String c3_item_type = enum_name.strip_end("_");                    
                    String c3_enum_submodule =
                        enum_name.starts_with(ENUM_PREFIX_TO_DROP) ?
                        enum_name.strip(ENUM_PREFIX_TO_DROP) :
                        // Some enum names don't start with `ImGui` (nor with `ImPlot`) but only with `Im`.
                        // But we don't want `im_` prefix in submodule name.
                        // For example enums `ImDrawListFlags_` resp. `ImFontAtlasFlags_`
                        // shoule be in module `ig::draw_flags` not `ig::im_draw_flags`
                        // resp. `ig::font_atlas_flags` not `ig::im_font_atlas_flags`.
                        enum_name.strip("Im");
                    c3_enum_submodule = translate_field_name(c3_enum_submodule.strip_end("_"));

                    // Skip private enums.                    
                    if (!c3_item_type.ends_with("Private"))
                    {
                        // If original enum name doesn't end with underscore then
                        // we have to define distinct type.
                        // Otherwise it was already defined when processing typedefs.
                        if (!enum_name.ends_with("_"))
                        {
                            // If not specified otherwise underlying type for C enums is int.
                            String underlying_type = "int";
                            if (enum_types_obj.has_key(c3_item_type))
                            {
                                underlying_type = enum_types_obj.get_string(c3_item_type)!;
                            }
                            io::printfn("distinct %s = %s;", c3_item_type, translate_non_array_type(underlying_type, c3_item_type)!);                        
                        }

                        io::printfn("module %s::%s;", current_module, c3_enum_submodule);
                        foreach (item : items)
                        {
                            // Usually enum item names start with enum name.
                            // For example for enum `ImGuiKey` most items start with `ImGuiKey_`.
                            // But sometimes it's not the case. For example item `ImGuiMod_Ctrl`.
                            // So we try to strip enum name from item name
                            // and for situations when item name doesn't start with enum name we try to strip
                            // `ImGui` prefix.
                            String name = item.get_string("name")!.strip(enum_name).strip("ImGui").strip("_");
                            String c3_item_name = translate_constant_name(name);
                            long calc_value = item.get_long("calc_value")!;
                            String value = item.get_string("value")!;
                            io::printfn("const %s %s = %d;  // %s", c3_item_type, c3_item_name, calc_value, value);
                        }
                        io::printfn("module %s;", current_module);
                    }
                };
                break;
            default:
                io::printfn("Unexpected key in definitions of structs and enums: %s", key);
                return GeneratorError.INVALID_DEFINITION?;
        }
    };
}

fn bool is_unsupported_function(String name)
{
    switch (name)
    {
        // From ImGui.
        // These use `va_list` which is not supported.
        case "ImGuiTextBuffer_appendfv":
        case "igBulletTextV":
        case "igDebugLogV":
        case "igImFormatStringToTempBufferV":
        case "igImFormatStringV":
        case "igLabelTextV":
        case "igLogTextV":
        case "igSetItemTooltipV":
        case "igSetTooltipV":
        case "igTextColoredV":
        case "igTextDisabledV":
        case "igTextV":
        case "igTextWrappedV":
        case "igTreeNodeExV_Str":
        case "igTreeNodeExV_Ptr":
        case "igTreeNodeV_Str":
        case "igTreeNodeV_Ptr":
            return true;

        // From ImPlot.
        // These use `va_list` which is not supported.
        case "ImPlotAnnotationCollection_AppendV":
        case "ImPlotTagCollection_AppendV":
        case "ImPlot_AnnotationV":
        case "ImPlot_TagXV":
        case "ImPlot_TagYV":
            return true;
        default:
            return false;
    }
}

// For arrays name contains array size (eg. `SearchBuffer[64]`) and we have to move it to type.
fn String! translate_function_argument_type(String type, String name)
{
    switch (type)
    {
        // Arrays are passed as pointers to the first element.
        case "char[5]": return "char[5]*";
        case "unsigned char[256]":
        case "const unsigned char[256]":
            return "char[256]*";
        case "int[2]": return "CInt[2]*";
        case "int[3]": return "CInt[3]*";
        case "int[4]": return "CInt[4]*";
        case "float[2]": return "float[2]*";
        case "float[3]": return "float[3]*";
        case "float[4]": return "float[4]*";
 
         // Here we use existing typedefs `ImGuiMemAllocFunc` and `ImGuiMemFreeFunc`
        // so we should check when updating ImGui that they're in sync.
        case "void*(*)(size_t sz,void* user_data)":
            if (name == "alloc_func") return "ImGuiMemAllocFunc";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "void(*)(void* ptr,void* user_data)":
            if (name == "free_func") return "ImGuiMemFreeFunc";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        
        // Here we use custom aliases.
        case "const char*(*)(void* user_data,int idx)":
            if (name == "getter") return "GetZStringByIndexFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "int(*)(void const*,void const*)":
            if (name == "compare_func") return "CompareFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "float(*)(void* data,int idx)":
            if (name == "values_getter") return "GetFloatByIndexFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;
        case "const char*(*)(void*,int)":
            if (name == "get_item_name_func") return "GetZStringByIndexFn";
            io::printfn("Unknown field '%s' with function pointer '%s'", name, type);
            return GeneratorError.UNKNOWN_FIELD_WITH_FUNCTION_POINTER?;

        default:
            return translate_non_array_type(type, name);   
    }     
}

fn void! generate_functions(Object* node)
{
    if (!node.is_map()) return GeneratorError.INVALID_DEFINITION?;

    @each_asc(node.map; String key, Object* overloads_obj)
    {
        if (!overloads_obj.is_array()) return GeneratorError.INVALID_DEFINITION?;
        List(<Object*>) overloads = overloads_obj.array;

        foreach (overload : overloads)
        {
            // Name of exported symbol for linking.
            String ov_cimguiname = overload.get_string("ov_cimguiname")!;

            if (is_unsupported_function(ov_cimguiname)) continue;

            bool templated = overload.get_bool("templated") ?? false;
            if (templated)
            {
                // Templated types are currently not supported.
                io::printfn("// Skipping templated: %s", ov_cimguiname);
                continue;
            }

            // Function is either static or instance method on this type (if `stname` non-empty).
            String stname = overload.get_string("stname")!;
            bool constructor = overload.get_bool("constructor") ?? false;
            // Constructors don't have `ret`.
            String ret = !constructor ? overload.get_string("ret")! : string::tformat("%s*", stname);
            Object* args_t_obj = overload.get("argsT")!;
            // We have to use `is_indexable` because `is_array` returns false for empty array.
            if (!args_t_obj.is_indexable()) return GeneratorError.INVALID_DEFINITION?;
            Object*[] args_t = args_t_obj.is_array() ? args_t_obj.array.array_view() : {};
            Object* defaults_obj = overload.get("defaults")!;
            // We have to use `is_keyable` because `is_map` returns false for empty object.
            if (!defaults_obj.is_keyable()) return GeneratorError.INVALID_DEFINITION?;

            bool is_instance_method =
                stname != "" &&
                ov_cimguiname.starts_with(stname) &&
                ov_cimguiname.len > stname.len &&
                ov_cimguiname[stname.len] == '_' &&
                args_t.len > 0 &&
                args_t[0].get_string("name")! == "self";

            if (is_instance_method)
            {
                String c3_method_name = translate_field_name(ov_cimguiname[stname.len+1..]);
                $if !GENERATE_GUI:
                    // Unfortunately two methods of `ImPlotItemGroup` are translated to same name.
                    if (stname == "ImPlotItemGroup")
                    {
                        // Overload of method `GetItem`.
                        if (ov_cimguiname == "ImPlotItemGroup_GetItem_ID") c3_method_name = "get_item_by_id";
                        // Method `GetItemID`.
                        if (ov_cimguiname == "ImPlotItemGroup_GetItemID") c3_method_name = "get_item_id";
                    }
                $endif

                io::printf(
                    "extern fn %s %s.%s(",
                    translate_non_array_type(ret, ov_cimguiname)!,
                    stname,
                    c3_method_name);
            }
            else if (constructor)
            {
                // Some constructors are necessary because some ImGui
                // structs shouldn't be initialized with zeros.
                bool prefix_ok =
                    ov_cimguiname.len > stname.len &&
                    ov_cimguiname.starts_with(stname) &&
                    ov_cimguiname[stname.len] == '_';
                if (!prefix_ok) return GeneratorError.INVALID_DEFINITION?;

                // Replace type prefix by `new_`.
                // For example `ImFontConfig_ImFontConfig` is translated to `new_im_font_config`.
                io::printf(
                    "extern fn %s new_%s(",
                    translate_non_array_type(ret, ov_cimguiname)!,
                    translate_field_name(ov_cimguiname.strip(stname).strip("_")));
            }
            else
            {
                // Here we translate:
                // - Normal functions (which usually start with prefix `FUNC_PREFIX_TO_DROP`).
                // - Non-constructor static methods (which start with type name and underscore).
                // - Instance methods which weren't recognized (which start with type name and underscore).
                //   These weren't recognized because they either don't call their first parameter `self`
                //   or `self` is their second parameter.
                io::printf(
                    "extern fn %s %s(",
                    translate_non_array_type(ret, ov_cimguiname)!,
                    translate_field_name(ov_cimguiname.strip(FUNC_PREFIX_TO_DROP)));
            }
            bool first_arg = true;
            foreach (arg : args_t)
            {
                if (!first_arg) io::printf(", ");
                first_arg = false;

                String arg_type = arg.get_string("type")!;
                String arg_name = arg.get_string("name")!;
                if (arg_type == "..." && arg_name == "...")
                {
                    io::printf("...");                    
                }
                else
                {
                    io::printf("%s %s", translate_function_argument_type(arg_type, arg_name)!, translate_field_name(arg_name));
                    if (defaults_obj.has_key(arg_name))
                    {
                        String default_value = defaults_obj.get_string(arg_name)!;
                        if (default_value == "ImVec2(0,0)" || default_value == "ImVec2(0.0f,0.0f)") default_value = "{}";
                        if (default_value == "ImVec2(0,1)") default_value = "{1, 1}";
                        if (default_value == "ImVec2(1,0)") default_value = "{1, 0}";
                        if (default_value == "ImVec2(1,1)") default_value = "{1, 1}";
                        if (default_value == "ImVec2(-FLT_MIN,0)") default_value = "{-math::FLOAT_MIN, 0}";
                        if (default_value == "ImVec2(-1,0)") default_value = "{-1, 0}";
                        if (default_value == "ImVec4(0,0,0,0)") default_value = "{}";
                        if (default_value == "ImVec4(0,0,0,-1)") default_value = "{0, 0, 0, -1}";
                        if (default_value == "ImVec4(1,1,1,1)") default_value = "{1, 1, 1, 1}";
                        if (default_value == "ImGuiTypingSelectFlags_None") default_value = "typing_select_flags::NONE";
                        if (default_value == "ImGuiPopupFlags_None") default_value = "popup_flags::NONE";
                        if (default_value == "ImGuiNavRenderCursorFlags_None") default_value = "nav_render_cursor_flags::NONE";
                        if (default_value == "ImGuiNavRenderCursorFlags_None") default_value = "nav_render_cursor_flags::NONE";
                        if (default_value == "ImPlotCond_Once") default_value = "ipl::cond::ONCE";
                        if (default_value == "FLT_MAX") default_value = "math::FLOAT_MAX";
                        if (default_value == "NULL" || default_value == "nullptr") default_value = "null";
                        // Translates for example `sizeof(float)` to `float.sizeof`.
                        if (default_value.starts_with("sizeof(") && default_value.ends_with(")")) default_value = string::tformat("%s.sizeof", default_value[7..^2]);
                        io::printf(" = %s", default_value);
                    }
                }
            }
            io::printfn(") @extern(\"%s\");", ov_cimguiname);
        }
    };
}

fn void! generate_imgui_code()
{
    io::printfn("module %s;", current_module);
    io::printfn("import libc;");
    io::printfn("distinct ImStbTexteditState = void;");
    io::printfn("// Manually translated from cimgui.h.");
    io::printfn("// It should be kept in sync.");
    io::printfn("struct ImBitArrayForNamedKeys");
    io::printfn("{");
    io::printfn("    ImU32[((usz)key::NAMED_KEY_COUNT + 31) >> 5] storage;");
    io::printfn("}");
    // Unfortunately we can't use C3 vectors for ImVec1, ImVec2 and ImVec4.
    // It doesn't work even though their size is same.
    // io::printfn("def ImVec1 = float[<1>];");
    // io::printfn("def ImVec2 = float[<2>];");
    // io::printfn("def ImVec4 = float[<4>];");
    io::printfn("// Following templated types are defined manually.");
    io::printfn("// Hopefully their layout is same.");
    io::printfn("struct ImVector");
    io::printfn("{");
    io::printfn("    CInt size;");
    io::printfn("    CInt capacity;");
    io::printfn("    void* data;");
    io::printfn("}");
    io::printfn("struct ImSpan");
    io::printfn("{");
    io::printfn("    void* data;");
    io::printfn("    void* data_end;");
    io::printfn("}");
    io::printfn("struct ImPool");
    io::printfn("{");
    io::printfn("    ImVector buf;");
    io::printfn("    ImGuiStorage map;");
    io::printfn("    ImPoolIdx free_idx;");
    io::printfn("    ImPoolIdx alive_count;");
    io::printfn("}");
    io::printfn("struct ImChunkStream");
    io::printfn("{");
    io::printfn("    ImVector buf;");
    io::printfn("}");
    io::printfn("def ImWchar16 = ushort;");
    io::printfn("def ImWchar32 = ulong;");
    io::printfn("// We don't compile ImGui with IMGUI_USE_WCHAR32 option.");
    io::printfn("// This means that ImWchar has 2 bytes.");
    io::printfn("def ImWchar = ImWchar16;");
    io::printfn("def ImS8 = ichar;");
    io::printfn("def ImS16 = short;");
    io::printfn("def ImS32 = int;");
    io::printfn("def ImS64 = long;");
    io::printfn("def ImU8 = char;");
    io::printfn("def ImU16 = ushort;");
    io::printfn("def ImU32 = uint;");
    io::printfn("def ImU64 = ulong;");

    io::printfn("// Aliases for function pointers.");
    io::printfn("def Settings_ClearAllFn = fn void(ImGuiContext* ctx, ImGuiSettingsHandler* handler);");
    io::printfn("def Settings_ReadInitFn = fn void(ImGuiContext* ctx, ImGuiSettingsHandler* handler);");
    io::printfn("def Settings_ReadOpenFn = fn void*(ImGuiContext* ctx, ImGuiSettingsHandler* handler, ZString name);");
    io::printfn("def Settings_ReadLineFn = fn void(ImGuiContext* ctx, ImGuiSettingsHandler* handler, void* entry, ZString line);");
    io::printfn("def Settings_ApplyAllFn = fn void(ImGuiContext* ctx, ImGuiSettingsHandler* handler);");
    io::printfn("def Settings_WriteAllFn = fn void(ImGuiContext* ctx, ImGuiSettingsHandler* handler, ImGuiTextBuffer* out_buf);");
    io::printfn("def Context_DockNodeWindowMenuHandler = fn void(ImGuiContext* ctx, ImGuiDockNode* node, ImGuiTabBar* tab_bar);");
    io::printfn("def FontBuilder_Build = fn bool(ImFontAtlas* atlas);");
    io::printfn("def Platform_GetClipboardTextFn = fn ZString(ImGuiContext* ctx);");
    io::printfn("def Platform_SetClipboardTextFn = fn void(ImGuiContext* ctx, ZString text);");
    io::printfn("def Platform_OpenInShellFn = fn bool(ImGuiContext* ctx, ZString path);");
    io::printfn("def Platform_SetImeDataFn = fn void(ImGuiContext* ctx, ImGuiViewport* viewport, ImGuiPlatformImeData* data);");
    io::printfn("def Platform_WindowActionFn = fn void(ImGuiViewport* vp);");
    io::printfn("def Platform_SetWindowPosOrSizeFn = fn void(ImGuiViewport* vp, ImVec2 pos_or_size);");
    io::printfn("def Platform_GetWindowPosOrSizeFn = fn ImVec2(ImGuiViewport* vp);");
    io::printfn("def Platform_GetWindowWorkAreaInsetsFn = fn ImVec4(ImGuiViewport* vp);");
    io::printfn("def Platform_GetWindowBoolPropFn = fn bool(ImGuiViewport* vp);");
    io::printfn("def Platform_SetWindowTitleFn = fn void(ImGuiViewport* vp, ZString str);");
    io::printfn("def Platform_SetWindowAlphaFn = fn void(ImGuiViewport* vp, float alpha);");
    io::printfn("def Platform_RenderActionFn = fn void(ImGuiViewport* vp, void* render_arg);");
    io::printfn("def Platform_GetWindowDpiScaleFn = fn float(ImGuiViewport* vp);");
    io::printfn("def Platform_CreateVkSurfaceFn = fn CInt(ImGuiViewport* vp, ImU64 vk_inst, void* vk_allocators, ImU64* out_vk_surface);");
    io::printfn("def SelectionStorage_AdapterIndexToStorageIdFn = fn ImGuiID(ImGuiSelectionBasicStorage* self, CInt idx);");
    io::printfn("def SelectionStorage_AdapterSetItemSelectedFn = fn void(ImGuiSelectionExternalStorage* self, CInt idx, bool selected);");
    io::printfn("def GetZStringByIndexFn = fn ZString(void* user_data, CInt idx);");
    io::printfn("def CompareFn = fn CInt(void*, void*);");
    io::printfn("def GetFloatByIndexFn = fn float(void* data, CInt idx);");

    char[] bytes = file::load_temp("imgui-generator/definitions/cimgui/typedefs_dict.json")!;
    Object* obj = json::parse_string((String)bytes)!;
    generate_typedefs(obj)!;

    bytes = file::load_temp("imgui-generator/definitions/cimgui/structs_and_enums.json")!;
    obj = json::parse_string((String)bytes)!;
    generate_structs_and_enums(obj)!;

    bytes = file::load_temp("imgui-generator/definitions/cimgui/definitions.json")!;
    obj = json::parse_string((String)bytes)!;
    generate_functions(obj)!;
}

fn void! generate_implot_code()
{
    io::printfn("module %s;", current_module);

    char[] bytes = file::load_temp("imgui-generator/definitions/cimplot/typedefs_dict.json")!;
    Object* obj = json::parse_string((String)bytes)!;
    generate_typedefs(obj)!;

    bytes = file::load_temp("imgui-generator/definitions/cimplot/structs_and_enums.json")!;
    obj = json::parse_string((String)bytes)!;
    generate_structs_and_enums(obj)!;

    bytes = file::load_temp("imgui-generator/definitions/cimplot/definitions.json")!;
    obj = json::parse_string((String)bytes)!;
    generate_functions(obj)!;
}

fn void! main()
{
$if GENERATE_GUI: 
    generate_imgui_code()!;
$else
    generate_implot_code()!;
$endif
}
