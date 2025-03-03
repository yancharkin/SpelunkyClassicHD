function checkAttack() {
	if (!global.html5Build) {
	    if (gamepad.attack or 
	            gamepad_button_check(global.joyid, global.joyAttackVal) or
	            keyboard_check(global.keyAttackVal)) or
	            (gamepad_button_value(global.joyid, global.joyAttackVal) > 0.6) {
	        return true;
	    } else {
	        return false;
	    }
	} else {
	    if (html5_gamepad_button_check(global.joyid, global.joyAttackVal) or
	            keyboard_check(global.keyAttackVal)) {
	        return true;
	    } else {
	        return false;
	    }   
	}



}
