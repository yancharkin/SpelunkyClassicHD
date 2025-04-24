function checkDownPressed() {
	if (gamepad.downPressed or keyboard_check_pressed(global.keyDownVal)) {
	    return true;
	} else {
	    return false;
	}
}