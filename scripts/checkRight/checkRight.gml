function checkRight() {
	if (!global.html5Build) {
	    if (gamepad.right or
	            gamepad_button_check(global.joyid, global.joyRightVal) or
	            (gamepad_axis_value(global.joyid, gp_axislh) > 0.6) or
	            keyboard_check(global.keyRightVal)) {
	        return true;
	    } else {
	        return false;
	    }
	} else {
	    if ((html5_gamepad_axis_value(global.joyid, 0) > 0.6) or
	            (html5_gamepad_axis_value(global.joyid, 4) > 0.6) or
	            keyboard_check(global.keyRightVal)) {
	        return true;
	    } else {
	        return false;
	    }   
	}



}
