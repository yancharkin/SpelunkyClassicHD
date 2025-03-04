function checkUp() {
	if (!global.html5Build) {
	        if (gamepad.up or
	            gamepad_button_check(global.joyid, global.joyUpVal) or
	            (gamepad_axis_value(global.joyid, gp_axislv) < -0.6) or
	            keyboard_check(global.keyUpVal)) {
	        return true;
	    } else {
	        return false;
	    }
	} else {
	    if ((html5_gamepad_axis_value(global.joyid, 1) < -0.6) or
	            (html5_gamepad_axis_value(global.joyid, 5) < -0.6) or
	            keyboard_check(global.keyUpVal)) {
	        return true;
	    } else {
	        return false;
	    }   
	}



}
