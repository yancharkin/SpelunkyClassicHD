function checkRightReleased() {
	if (gamepad.rightReleased or
	        gamepad_button_check_released(global.joyid, gp_padr) or
	        keyboard_check_released(global.keyRightVal)) {
	    return true;
	} else {
	    return false;
	}



}
