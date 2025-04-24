function checkUpPressed() {
	if (gamepad.upPressed or keyboard_check_pressed(global.keyUpVal)) {
	    return true;
	} else {
	    return false;
	}
}