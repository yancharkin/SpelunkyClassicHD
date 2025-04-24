function checkJumpReleased() {
	if (gamepad.jumpReleased or keyboard_check_released(global.keyJumpVal)) {
	    return true;
	} else {
	    return false;
	}
}