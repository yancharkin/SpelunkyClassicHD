status = -1;
joy = false;
alarmSec = 5
alarm[0] = alarmSec*fps;

if ((!gamepad_is_connected(global.joyid)) and 
	(string_length(gamepad_get_description(global.joyid)) < 1)) {
		gamepadFound = false;
} else {
	gamepadFound = true;
};