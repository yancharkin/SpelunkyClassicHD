function checkAttackReleased() {
	if (gamepad.attackReleased or keyboard_check_released(global.keyAttackVal)) {
	    return true;
	} else {
	    return false;
	}
}