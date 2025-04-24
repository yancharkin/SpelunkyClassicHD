/// @description gamepadButtonCheck(buttonId)
/// Universal button check, checks button state for regular buttons, triggers and buttons that detected as axis.
/// @param buttonId

function gamepadButtonCheck() {
	var buttonId = argument0;
	if (not is_string(buttonId)) {
		return (gamepad_button_value(global.joyid, buttonId) > 0.6);
		//return gamepad_button_check(global.joyid, buttonId);
	} else {
			if (string_starts_with(buttonId, "a")) {
				return gamepad_axis_value(global.joyid, int64(string_delete(buttonId, 0, 1))) > 0.6;
			} else if (string_starts_with(buttonId, "h")) {
				var hat = string_delete(buttonId, 0, 1);
				var d_pos = string_pos("-", hat);
				var last_pos = string_length(hat) - 1;
				var hat_id = int64(string_delete(hat, d_pos, last_pos-d_pos));
				var hat_value = int64(string_delete(hat, 0, d_pos));
				var pressed_btn = gamepad_hat_value(global.joyid, hat_id);
				switch (hat_value) {
					case 1: return array_contains([1, 3, 9], pressed_btn);
					case 2: return array_contains([2, 3, 6], pressed_btn);
					case 4: return array_contains([4, 6, 12], pressed_btn);
					case 8: return array_contains([8, 9, 12], pressed_btn);
					default: return false;
				}
			}
	}
}