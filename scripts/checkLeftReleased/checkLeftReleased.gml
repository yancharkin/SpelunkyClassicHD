function checkLeftReleased() {
	if (gamepad.leftReleased or
	        gamepad_button_check_released(global.joyid, gp_padl) or
	        keyboard_check_released(global.keyLeftVal)) {
	    return true;
	} else {
	    return false;
	}



}
