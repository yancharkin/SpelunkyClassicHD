function checkUpPressed() {
	if (gamepad.upPressed or
	        gamepad_button_check_pressed(global.joyid, global.joyUpVal) or
	        global.analogLUpPressed or
	        keyboard_check_pressed(global.keyUpVal)) {
	    return true;
	} else {
	    return false;
	}



}
