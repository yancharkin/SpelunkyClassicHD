function checkRightReleased() {
	if (gamepad.rightReleased or
	        gamepad_button_check_released(global.joyid, global.joyRightVal) or
	        keyboard_check_released(global.keyRightVal)) {
	    return true;
	} else {
	    return false;
	}



}
