function checkRopePressed() {
	if (gamepad.ropePressed or keyboard_check_pressed(global.keyRopeVal)) {
	    return true;
	} else {
	    return false;
	}
}