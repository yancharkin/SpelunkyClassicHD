function checkRun() {
	if (gamepad.run) {
	    return gamepad.run;
	} else {
	        if (!global.toggleRunEnabled) {
	            return (keyboard_check(global.keyRunVal) or
	                    html5_gamepad_button_check(global.joyid, global.joyRunVal) or
	                    gamepad_button_check(global.joyid, global.joyRunVal));

	        } else {
	            return global.toggleRun;
	        }
	}



}
