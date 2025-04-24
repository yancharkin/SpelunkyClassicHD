function checkFlarePressed() {
	if (gamepad.flarePressed or keyboard_check_pressed(global.keyFlareVal)) {
	    return true;
	} else {
	    return false;
	}
}