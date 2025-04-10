/// @description menuTouchControls
function menuTouchControls() {
	global.touchControlsVisibility += global.touchVisChangeBy;
	if (global.touchControlsVisibility >= 3) {
	    global.touchControlsVisibility = 0;
	}
	if (global.touchControlsVisibility < 0) {
	    global.touchControlsVisibility = 2;
	}
}