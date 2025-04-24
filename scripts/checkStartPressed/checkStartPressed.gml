function checkStartPressed() {
	if (gamepad.startPressed or keyboard_check_pressed(global.keyStartVal)) {
	    return true;
	} else {
	    return false;
	}
}