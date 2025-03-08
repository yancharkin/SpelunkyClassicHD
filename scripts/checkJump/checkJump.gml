function checkJump() {
	if (!global.html5Build) {
	    if (gamepad.jump or
	            gamepad_button_check(global.joyid, global.joyJumpVal) or
	            (gamepad_button_value(global.joyid, global.joyJumpVal) > 0.6) or
	            keyboard_check(global.keyJumpVal)) {
	        return true;
	    } else {
	        return false;
	    }
	} else {
	    if (html5_gamepad_button_check(global.joyid, global.joyJumpVal) or
	            keyboard_check(global.keyJumpVal)) {
	        return true;
	    } else {
	        return false;
	    }   
	}
}
