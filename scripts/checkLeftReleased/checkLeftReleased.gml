function checkLeftReleased() {
	if (gamepad.leftReleased or keyboard_check_released(global.keyLeftVal)) {
	    return true;
	} else {
	    return false;
	}
}