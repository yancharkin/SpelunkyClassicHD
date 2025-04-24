function checkRight() {
	if (gamepad.right or keyboard_check(global.keyRightVal)) {
		return true;
	} else {
		return false;
	}
}