function checkDownPressed() {
	if (gamepad.downPressed or
	        gamepad_button_check_pressed(global.joyid, global.joyDownVal) or
	        global.analogLDownPressed or
	        keyboard_check_pressed(global.keyDownVal)) {
	    return true;
	} else {
	    return false;
	}



}
