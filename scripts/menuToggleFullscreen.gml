///menuToggleFullscreen

global.fullscreen = !global.fullscreen;
if (global.fullscreen) {
    if (!global.html5Build) {
        window_set_fullscreen(true);
    } else {
        newSize = electronSetFullscreen(true);
        window_set_size(newSize[0], newSize[1]);
    }
} else {
    if (!global.html5Build) {
        window_set_fullscreen(false);
        window_set_size(800, 800/(display_get_width()/display_get_height()));
    } else {
        newSize = electronSetFullscreen(false);
        window_set_size(newSize[0], newSize[1]);
    }
}
