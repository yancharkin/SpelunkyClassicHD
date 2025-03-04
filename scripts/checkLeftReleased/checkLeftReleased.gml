function checkLeftReleased() {
	if (gamepad.leftReleased or
	        gamepad_button_check_released(global.joyid, global.joyLeftVal) or
	        keyboard_check_released(global.keyLeftVal)) {
	    return true;
	} else {
	    return false;
	}



}
