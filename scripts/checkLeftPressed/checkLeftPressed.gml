function checkLeftPressed() {
	if (gamepad.leftPressed or keyboard_check_pressed(global.keyLeftVal)) {
	    return true;
	} else {
	    return false;
	}
}