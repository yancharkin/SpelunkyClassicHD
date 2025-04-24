function checkItemPressed() {
	if (gamepad.itemPressed or keyboard_check_pressed(global.keyItemVal)) {
	    return true;
	} else {
	    return false;
	}
}