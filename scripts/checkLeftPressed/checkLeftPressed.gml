function checkLeftPressed() {
	if (gamepad.leftPressed or
	        gamepad_button_check_pressed(global.joyid, global.joyLeftVal) or
			global.analogLLeftPressed or
	        keyboard_check_pressed(global.keyLeftVal)) {
	    return true;
	} else {
	    return false;
	}
}