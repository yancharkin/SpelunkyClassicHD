function checkAttackPressed() {
	if (gamepad_button_check_pressed(global.joyid, global.joyAttackVal) or
	        global.bAttackPressed or
	        keyboard_check_pressed(global.keyAttackVal)) {
	    return true;
	} else {
	    return false;
	}



}
