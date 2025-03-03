function checkFlarePressed() {
	if (gamepad.flarePressed or 
	        gamepad_button_check_pressed(global.joyid, global.joyFlareVal) or
	        global.bFlarePressed or
	        keyboard_check_pressed(global.keyFlareVal)) {
	    return true;
	} else {
	    return false;
	}



}
