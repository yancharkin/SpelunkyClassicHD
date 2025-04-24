function checkLangPressed() {
	if (gamepad.langPressed or keyboard_check_pressed(global.keyLangVal)) {
	    return true;
	} else {
	    return false;
	}
}