function checkDown() {
	if (gamepad.down or keyboard_check(global.keyDownVal)) {
	    return true;
	} else {
	    return false;
	}
}