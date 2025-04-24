function checkUp() {
	    if (gamepad.up or keyboard_check(global.keyUpVal)) {
	    return true;
	} else {
	    return false;
	}
}