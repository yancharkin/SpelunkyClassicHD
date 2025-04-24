function checkBombPressed() {
	if (gamepad.bombPressed or keyboard_check_pressed(global.keyBombVal)) {
	    return true;
	} else {
	    return false;
	}
}