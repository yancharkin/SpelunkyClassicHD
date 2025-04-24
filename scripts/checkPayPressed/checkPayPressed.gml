function checkPayPressed() {
	if (gamepad.payPressed or keyboard_check_pressed(global.keyPayVal)) {
	    return true;
	} else {
	    return false;
	}
}