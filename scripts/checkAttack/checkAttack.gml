function checkAttack() {
	if (gamepad.attack or keyboard_check(global.keyAttackVal)) {
	    return true;
	} else {
	    return false;
	}
}