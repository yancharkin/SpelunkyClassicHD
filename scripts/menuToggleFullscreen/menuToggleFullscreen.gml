/// @description menuToggleFullscreen
function menuToggleFullscreen() {

	global.fullscreen = !global.fullscreen;
	if (global.fullscreen) {
	    if (!global.html5Build) {
	        window_set_fullscreen(true);
	    } else {
	        if (global.electronBuild) {
	            newSize = electronSetFullscreen(true);
	            window_set_size(newSize[0], newSize[1]);
	        } else if (global.browserBuild) {
	            newSize = html5_set_fullscreen(true);
	            window_set_size(newSize[0], newSize[1]);
	        }
	    }
	} else {
	    if (!global.html5Build) {
	        window_set_fullscreen(false);
	        window_set_size(800, 800/(display_get_width()/display_get_height()));
	    } else {
	        if (global.electronBuild) {
	            newSize = electronSetFullscreen(false);
	            window_set_size(newSize[0], newSize[1]);
	        } else if (global.browserBuild) {
	            newSize = html5_set_fullscreen(false);
	            window_set_size(newSize[0], newSize[1]);
	        }
	    }
	}



}
