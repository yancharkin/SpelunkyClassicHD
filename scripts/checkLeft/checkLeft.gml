function checkLeft() {
	if (gamepad.left or keyboard_check(global.keyLeftVal)) {
	    return true;
	} else {
	    return false;
	}
}