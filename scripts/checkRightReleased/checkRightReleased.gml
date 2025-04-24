function checkRightReleased() {
	if (gamepad.rightReleased or keyboard_check_released(global.keyRightVal)) {
	    return true;
	} else {
	    return false;
	}
}