function checkStartPressed() {
	if (gamepad_button_check_pressed(global.joyid, global.joyStartVal) or
	        global.bStartPressed or
	        keyboard_check_pressed(vk_escape)) {
	    return true;
	} else {
	    return false;
	}



}
