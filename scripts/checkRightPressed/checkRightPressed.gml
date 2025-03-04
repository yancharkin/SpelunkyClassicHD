function checkRightPressed() {
	if (gamepad.rightPressed or
	        gamepad_button_check_pressed(global.joyid, global.joyRightVal) or
	        keyboard_check_pressed(global.keyRightVal)) {
	    return true;
	} else {
	    return false;
	}



}
