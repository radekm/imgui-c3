
import std;
import libc;
import sokol;
import ig;
import igfd;

struct State
{
    sg::PassAction pass_action;
    FileDialog* file_dialog;
}

State state;

fn void init()
{
    sg::setup(&&(sg::Desc) {
        .environment = sglue::environment(),
        .logger.func = &slog::func,
    });
    simgui::setup(&&(simgui::Desc) {});
    state.file_dialog = igfd::new_file_dialog();

    // initial clear color
    state.pass_action.colors[0] = { .load_action = load_action::CLEAR, .clear_value = { 0.0f, 0.5f, 1.0f, 1.0 } };
}

fn void frame()
{
    simgui::new_frame(&&(simgui::FrameDesc) {
        .width = sapp::width(),
        .height = sapp::height(),
        .delta_time = sapp::frame_duration(),
        .dpi_scale = sapp::dpi_scale(),
    });

    /*=== UI CODE STARTS HERE ===*/
    ig::set_next_window_pos({10, 10}, ig::cond::ONCE);
    ig::set_next_window_size({600, 500}, ig::cond::ONCE);
    ig::begin("Hello Dear ImGui!", null, window_flags::NONE);

    if (ig::button("Open file dialog"))
    {
        FileDialogConfig config = igfd::file_dialog_config_init();
        config.path = ".";
        state.file_dialog.open("ChooseFileDlgKey", "Choose File", ".c3,.json", config);
    }

    ig::end();

    if (state.file_dialog.display("ChooseFileDlgKey", min_size: {700, 500}))
    {
        io::printfn("Dialog closed");
        if (state.file_dialog.is_ok())
        {
            io::printfn("Some file selected");
            ZString file_path_name = state.file_dialog.get_file_path_name();
            defer libc::free(file_path_name);
            ZString file_path = state.file_dialog.get_current_path();
            defer libc::free(file_path);
            io::printfn("File path name '%s', file path '%s'", file_path_name, file_path);
        }
        else
        {
            io::printfn("No file selected");
        }

        state.file_dialog.close();
    }
    /*=== UI CODE ENDS HERE ===*/

    sg::begin_pass(&&(sg::Pass) { .action = state.pass_action, .swapchain = sglue::swapchain() });
    simgui::render();
    sg::end_pass();
    sg::commit();
}

fn void event(sapp::Event* ev)
{
    simgui::handle_event(ev);
}

fn void cleanup()
{
    state.file_dialog.destroy();
    simgui::shutdown();
    sg::shutdown();
}

fn void main()
{
    sapp::run(&&(sapp::Desc) {
        .init_cb = &init,
        .frame_cb = &frame,
        .cleanup_cb = &cleanup,
        .event_cb = &event,
        .width = 800,
        .height = 600,
        .window_title = "Hello Sokol + Dear ImGui + ImGuiFileDialog",
        .icon = { .sokol_default = true },
        .logger = { .func = &slog::func },
    });
}
