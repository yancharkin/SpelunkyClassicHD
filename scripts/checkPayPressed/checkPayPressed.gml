function checkPayPressed() {
	if (gamepad.payPressed or 
	        gamepad_button_check_pressed(global.joyid, global.joyPayVal) or
	        global.bPayPressed or
	        keyboard_check_pressed(global.keyPayVal)) {
	    return true;
	} else {
	    return false;
	}



}
