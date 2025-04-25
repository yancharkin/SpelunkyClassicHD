/// @description menuToggleFullscreen
function menuToggleFullscreen() {
	global.fullscreen = !global.fullscreen;
	if (global.fullscreen) {
		window_set_fullscreen(true);
	} else {
	    window_set_fullscreen(false);
	    window_set_size(800, 800/(display_get_width()/display_get_height()));
	}
}