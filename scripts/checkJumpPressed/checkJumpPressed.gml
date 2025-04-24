function checkJumpPressed() {
	if (gamepad.jumpPressed or keyboard_check_pressed(global.keyJumpVal)) {
	    return true;
	} else {
	    return false;
	}
}