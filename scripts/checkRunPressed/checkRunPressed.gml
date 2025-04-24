function checkRunPressed(){
	if (gamepad.runPressed or keyboard_check_pressed(global.keyRunVal)) {
	    return true;
	} else {
	    return false;
	}
}