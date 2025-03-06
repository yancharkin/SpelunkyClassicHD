/// @description Detect new gamepads.

var ev_type = ds_map_find_value(async_load, "event_type");
var pad_ind = ds_map_find_value(async_load, "pad_index");

if (ev_type == "gamepad discovered")
{
	//----------------------------------------
	// * Use only first detected gamepad
	// * TODO(?) - add options to select gamepad - gamepad_get_description(global.joyid) ?
	//----------------------------------------
    //global.gamepadOn = true;
    //global.joyid = pad_ind;
	//----------------------------------------
	if (!global.gamepadOn) {
		global.joyid = pad_ind;
	}
	global.gamepadOn = true;
	//----------------------------------------
    gamepad_set_button_threshold(global.joyid, 1); // we need this to be pretty high, as analogue triggers are treated like analogue triggers and not like buttons!
}
else
{
    global.gamepadOn = false;
    global.joyid = -1;
}

