var joyReleased = false;
var joyPressed = false;

if (status == -3) {
	if ((gamepads_n <= 1) or keyboard_check_pressed(vk_escape)
			or keyboard_check_pressed(global.keyEnter)
			or keyboard_check_pressed(global.keyAttackVal)
			or keyboard_check_pressed(global.keyJumpVal)
			or alarm[0] == alarmSec*fps) {
		status += 1;
	} else {
		if (keyboard_check_pressed(global.keyRightVal)) {
			global.gamepad_i += 1;
			if (global.gamepad_i >= gamepads_n) global.gamepad_i = 0;
		} else if (keyboard_check_pressed(global.keyLeftVal)) {
			global.gamepad_i -= 1;
			if (global.gamepad_i < 0) global.gamepad_i = gamepads_n-1;
		}
		global.joyid = gamepads[global.gamepad_i][0];
		global.joySaved = gamepads[global.gamepad_i][1];
	}
	configLoad(true);
}

if (status == -2) { // do not catch input from gamepad here to prevent assigning previously pressed button (while selecting menu item)
	if (keyboard_check_pressed(vk_escape) or (alarm[0] == 4.5*fps)) {
		status += 1;
		alarm[0] = alarmSec*fps;
	}
} else if (status = -1) { // if there is two keycodes send by one button this MAY catch first and make gamepad usable (have to keep pressing button BEFORE the text appears)
	var joyKey = checkJoyButton();
	if ((joyKey != -1) or keyboard_check_pressed(vk_escape) or (alarm[0] == 4.5*fps)) {
		array_push(global.assignedButtons, joyKey);
		status += 1;
		alarm[0] = alarmSec*fps;
	}
} else if (status > -2) {
	if (!buttonsVisible) {
		 oJoyConfigClearBtn.visible = true;
		 oJoyConfigSkipBtn.visible = true;
		 buttonsVisible = true;
	}
	var joyKey = checkJoyButton();
	if (joy) {
	    if (joyKey != -1) {
	        joy = true;
	    } else{
	        joyReleased = true;
	        joy = false;
	    }
	} else {
	    if (joyKey != -1) {
	        joyPressed = true;
	        joy = true;
	    } else {
	        joy = false;
	    }
	}

	// Start button can't be an axis
	if ((status == 7) and (is_string(joyKey))) joyPressed = false;

	// Prevent assignment of one button to the multiple actions
	if (array_contains(global.assignedButtons, joyKey)) joyPressed = false;

	if (joyPressed or clearBtnPressed) {
		if (joyPressed) array_push(global.assignedButtons, joyKey);
		if (clearBtnPressed) joyKey = -1;
	    if (status == 0) {
			global.joyJumpVal = joyKey;
	    } else if (status == 1) {
	        global.joyAttackVal = joyKey;
	    } else if (status == 2) {
	        global.joyItemVal = joyKey;
	    } else if (status == 3) {
	        global.joyRunVal = joyKey;
	    } else if (status == 4) {
	        global.joyBombVal = joyKey;
	    } else if (status == 5) {
	        global.joyRopeVal = joyKey;
	    } else if (status == 6) {
	        global.joyPayVal = joyKey;
	    } else if (status == 7) {
	        global.joyStartVal = joyKey;
		} else if (status == 8) {
	        global.joyLangVal = joyKey;
	    } else if (status == 9) {
	        global.joyLeftVal = joyKey;
	    } else if (status == 10) {
	        global.joyRightVal = joyKey;
	    } else if (status == 11) {
	        global.joyUpVal = joyKey;
	    } else if (status == 12) {
	        global.joyDownVal = joyKey;
	    } else if (status == 13) {
	        global.joyRestartVal = joyKey;
	    }
	}

	if (joyPressed or clearBtnPressed or keyboard_check_pressed(vk_escape) or alarm[0] == alarmSec*fps) {
		status += 1;
		alarm[0] = alarmSec*fps;
		if (gamepad.attackPressed) gamepad.attackPressed = false;
		if (gamepad.startPressed) gamepad.startPressed = false;
		if (status > 12 and not global.debugBuild) {
			window_set_cursor(cr_none);
			room_goto(rTitle);
		} else if (status > 13) {
			window_set_cursor(cr_none);
			room_goto(rTitle);
		}
	}
}