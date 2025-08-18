function findGamepads() {
	gamepad_enumerate();
	global.gamepadOn = false;
	global.savedGamepadFound = false;
	gamepads = [];
	gamepad_count = gamepad_get_device_count();
	j = 0;
	if gamepad_count > 0 {
		for (var i = 0; i < gamepad_count; i++) {
			gamepad_description = gamepad_get_description(i);
			gamepad_guid = gamepad_get_guid(i);
		    if (gamepad_is_connected(i) and string_length(gamepad_description) > 1) {
				gamepads[j] = [i, gamepad_description, gamepad_guid];
				gamepad_id = gamepad_description + "," + gamepad_guid
				if (!global.gamepadOn) {
					if (gamepad_id == global.joySaved and !global.savedGamepadFound) {
						global.gamepadOn = true;
						global.savedGamepadFound = true;
						global.joyid = i;
						global.gamepad_i = j;
					}
				}
				j += 1;
		    }
		}
		if (!global.savedGamepadFound) {
			global.joyid = gamepads[0][0];
			global.joySaved = gamepads[0][1] + "," + gamepads[0][2];
			global.gamepadOn = true;
		}
	}
	gamepads_n = array_length(gamepads);
	if (global.gamepadOn)  gamepad_set_button_threshold(global.joyid, 1); // we need this to be pretty high, as analogue triggers are treated like analogue triggers and not like buttons!
	if (array_length(gamepads) == 0) {
		global.gamepadOn = false;
		global.joyid = -1;
	}
	configLoad(true);
	joySave();
}