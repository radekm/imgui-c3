
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

String current_module = "ig";

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
    // Handle `ZString` before ignoring `const`.
    //
    // Maybe this is not universally correct and sometimes `const char*`
    // doesn't represent zero terminated string.
    if (type == "const char*") return "ZString";
    
    // Ignore `const`.
    if (type.starts_with("const ")) type = type["const ".len..];

    switch (type)
    {
        case "bool": return "CBool";
        case "signed char": return "ichar";
        case "unsigned short": return "CUShort";
        case "short": return "CShort";
        case "unsigned int": return "CUInt";
        case "unsigned int*": return "CUInt*";
        case "int":
        case "signed int":
            return "CInt";
        case "size_t": return "usz";
        case "float":
        case "double":
        case "void*":
            return type;

        // NOTE: It seems that `unsigned char` is not used for strings.
        case "unsigned char": return "char";
        case "unsigned char*": return "char*";        
        case "char": return "char";  // NOTE: This is also applied for char arrays.
        case "char*":
            if (name == "Buf" || name == "Name") return "ZString";
            io::printfn("Should we translate '%s' with type '%s' to ZString?", name, type);
            return GeneratorError.UNKNOWN_TYPE?;

        case "FILE*": return "libc::CFile";

        // Function pointers.
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
    if (!enum_types_obj.is_map()) return GeneratorError.INVALID_DEFINITION?;
    HashMap(<String, Object*>) enum_types = enum_types_obj.map;

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
                @each_asc(val.map; String struct_name, Object* desc)
                {
                    if (!desc.is_array()) return GeneratorError.INVALID_DEFINITION?;
                    List(<Object*>) fields = desc.array;

                    // We use C3 vectors instead of structs.
                    switch (struct_name)
                    {
                        case "ImVec1": struct_name = "Old_ImVec1";
                        case "ImVec2": struct_name = "Old_ImVec2";
                        case "ImVec4": struct_name = "Old_ImVec4";
                    }

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
                        enum_name.starts_with("ImGui") ?
                        enum_name.strip("ImGui") :
                        // Some enum names don't start with `ImGui` but only with `Im`.
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
                            if (enum_types.has_key(c3_item_type))
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

fn void! generate_code()
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
    io::printfn("// Using C3 vectors instead of structs ImVec1, ImVec2 and ImVec4 is more convenient.");
    io::printfn("// Hopefully their layout is same. We only check that their size is same.");
    io::printfn("def ImVec1 = float[<1>];");
    io::printfn("$assert(ImVec1.sizeof == Old_ImVec1.sizeof);");
    io::printfn("def ImVec2 = float[<2>];");
    io::printfn("$assert(ImVec2.sizeof == Old_ImVec2.sizeof);");
    io::printfn("def ImVec4 = float[<4>];");
    io::printfn("$assert(ImVec4.sizeof == Old_ImVec4.sizeof);");
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
    io::printfn("def FontBuilder_Build = fn CBool(ImFontAtlas* atlas);");
    io::printfn("def Platform_GetClipboardTextFn = fn ZString(ImGuiContext* ctx);");
    io::printfn("def Platform_SetClipboardTextFn = fn void(ImGuiContext* ctx, ZString text);");
    io::printfn("def Platform_OpenInShellFn = fn CBool(ImGuiContext* ctx, ZString path);");
    io::printfn("def Platform_SetImeDataFn = fn void(ImGuiContext* ctx, ImGuiViewport* viewport, ImGuiPlatformImeData* data);");
    io::printfn("def Platform_WindowActionFn = fn void(ImGuiViewport* vp);");
    io::printfn("def Platform_SetWindowPosOrSizeFn = fn void(ImGuiViewport* vp, ImVec2 pos_or_size);");
    io::printfn("def Platform_GetWindowPosOrSizeFn = fn ImVec2(ImGuiViewport* vp);");
    io::printfn("def Platform_GetWindowWorkAreaInsetsFn = fn ImVec4(ImGuiViewport* vp);");
    io::printfn("def Platform_GetWindowBoolPropFn = fn CBool(ImGuiViewport* vp);");
    io::printfn("def Platform_SetWindowTitleFn = fn void(ImGuiViewport* vp, ZString str);");
    io::printfn("def Platform_SetWindowAlphaFn = fn void(ImGuiViewport* vp, float alpha);");
    io::printfn("def Platform_RenderActionFn = fn void(ImGuiViewport* vp, void* render_arg);");
    io::printfn("def Platform_GetWindowDpiScaleFn = fn float(ImGuiViewport* vp);");
    io::printfn("def Platform_CreateVkSurfaceFn = fn CInt(ImGuiViewport* vp, ImU64 vk_inst, void* vk_allocators, ImU64* out_vk_surface);");
    io::printfn("def SelectionStorage_AdapterIndexToStorageIdFn = fn ImGuiID(ImGuiSelectionBasicStorage* self, CInt idx);");
    io::printfn("def SelectionStorage_AdapterSetItemSelectedFn = fn void(ImGuiSelectionExternalStorage* self, CInt idx, CBool selected);");

    char[] bytes = file::load_temp("imgui-generator/definitions/cimgui/typedefs_dict.json")!;
    Object* obj = json::parse_string((String)bytes)!;
    generate_typedefs(obj)!;

    bytes = file::load_temp("imgui-generator/definitions/cimgui/structs_and_enums.json")!;
    obj = json::parse_string((String)bytes)!;
    generate_structs_and_enums(obj)!;
}

fn void! main()
{
    generate_code()!;
}
