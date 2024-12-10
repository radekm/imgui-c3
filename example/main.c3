
import std;
import sokol;
import ig;

struct State
{
    sg::PassAction pass_action;
}

State state;

fn void init()
{
    sg::setup(&&sg::Desc {
        .environment = sglue::environment(),
        .logger.func = &slog::func,
    });
    simgui::setup(&&simgui::Desc {});

    // initial clear color
    state.pass_action.colors[0] = { .load_action = load_action::CLEAR, .clear_value = { 0.0f, 0.5f, 1.0f, 1.0 } };
}

fn void frame()
{
    simgui::new_frame(&&simgui::FrameDesc {
        .width = sapp::width(),
        .height = sapp::height(),
        .delta_time = sapp::frame_duration(),
        .dpi_scale = sapp::dpi_scale(),
    });

    /*=== UI CODE STARTS HERE ===*/
    ig::set_next_window_pos({10, 10}, cond::ONCE);
    ig::set_next_window_size({400, 100}, cond::ONCE);
    ig::begin("Hello Dear ImGui!", null, window_flags::NONE);
    ig::color_edit3("Background", (float[3]*)&state.pass_action.colors[0].clear_value.r);
    ig::end();
    /*=== UI CODE ENDS HERE ===*/

    sg::begin_pass(&&sg::Pass { .action = state.pass_action, .swapchain = sglue::swapchain() });
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
    simgui::shutdown();
    sg::shutdown();
}

fn void main()
{
    sapp::run(&&sapp::Desc {
        .init_cb = &init,
        .frame_cb = &frame,
        .cleanup_cb = &cleanup,
        .event_cb = &event,
        .width = 800,
        .height = 600,
        .window_title = "Hello Sokol + Dear ImGui",
        .icon = { .sokol_default = true },
        .logger = { .func = &slog::func },
    });
}
