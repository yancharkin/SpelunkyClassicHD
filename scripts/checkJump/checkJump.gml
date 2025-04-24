function checkJump() {
	if (gamepad.jump or keyboard_check(global.keyJumpVal)) {
	    return true;
	} else {
	    return false;
	}
}