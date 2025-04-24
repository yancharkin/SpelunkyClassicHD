/// @description checkJoyButton()
function checkJoyButton() {
	for (var i = 0; i < gamepad_button_count(global.joyid); i++) {
		if (not array_contains(global.assignedButtons, i)) { // Prevent assignment of one button to the multiple actions
			if (gamepad_button_value(global.joyid, i) > 0.6) {
				return i;
			} else {
				for (var j = 0; j < gamepad_axis_count(global.joyid); j++) {
					var axis_value = gamepad_axis_value(global.joyid, j);
					if (axis_value > 0.6) {
						return "a" + string(j);
					}
				}
				for (var h = 0; h < gamepad_hat_count(global.joyid); h++) {
					var hat_value = gamepad_hat_value(global.joyid, h);
					if (hat_value) {
						return "h" + string(h) + "-" + string(hat_value);
					}
				}
			}
		}
	}
	return -1;
}