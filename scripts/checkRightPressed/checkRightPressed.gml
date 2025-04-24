function checkRightPressed() {
	if (gamepad.rightPressed or keyboard_check_pressed(global.keyRightVal)) {
	    return true;
	} else {
	    return false;
	}
}