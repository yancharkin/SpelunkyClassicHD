function checkRopePressed() {
	if (gamepad.ropePressed or 
	        gamepad_button_check_pressed(global.joyid, global.joyRopeVal) or
	        global.bRopePressed or
	        keyboard_check_pressed(global.keyRopeVal)) {
	    return true;
	} else {
	    return false;
	}



}
