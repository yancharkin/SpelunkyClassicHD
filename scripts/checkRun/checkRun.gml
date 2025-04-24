function checkRun() {
	if (!global.toggleRunEnabled) {
			if (gamepad.run or keyboard_check(global.keyRunVal)) {
				return true;
			} else {
				return false;
			}
	} else {
	    return global.toggleRun;
	}
}