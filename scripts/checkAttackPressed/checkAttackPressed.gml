function checkAttackPressed() {
	if (gamepad.attackPressed or keyboard_check_pressed(global.keyAttackVal)) {
	    return true;
	} else {
	    return false;
	}
}