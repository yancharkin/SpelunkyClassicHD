function checkJumpPressed() {
	if (gamepad.jumpPressed or
	        gamepad_button_check_pressed(global.joyid, global.joyJumpVal) or
	        global.bJumpPressed or
	        keyboard_check_pressed(global.keyJumpVal)) {
	    return true;
	} else {
	    return false;
	}



}
