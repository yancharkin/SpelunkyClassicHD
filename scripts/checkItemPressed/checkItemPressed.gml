function checkItemPressed() {
	if (gamepad.itemPressed or
	        gamepad_button_check_pressed(global.joyid, global.joyItemVal) or
	        global.bItemPressed or
	        keyboard_check_pressed(global.keyItemVal)) {
	    return true;
	} else {
	    return false;
	}



}
