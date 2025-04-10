var joyReleased = false;
var joyPressed = false;

var joyKey = checkJoyButton();

if (joy) {
    if (joyKey != 0) {
        joy = true;
    } else{
        joyReleased = true;
        joy = false;
    }
} else {
    if (joyKey != 0) {
        joyPressed = true;
        joy = true;
    } else {
        joy = false;
    }
}

if (joyPressed) {
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
    }
}

if (joyPressed or keyboard_check_pressed(vk_escape) or alarm[0] == alarmSec*fps) {
    status += 1;
	alarm[0] = alarmSec*fps;
	if (!gamepadFound) {
		room_goto(rTitle);
	};
    if (gamepad.attackPressed) gamepad.attackPressed = false;
    if (gamepad.startPressed) gamepad.startPressed = false;
	if (os_type == os_windows) {
		if (status > 8) room_goto(rTitle);
	}
    if (status > 12) room_goto(rTitle);
}