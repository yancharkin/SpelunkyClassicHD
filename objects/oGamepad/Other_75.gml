/// @description Detect new gamepads.

var ev_type = ds_map_find_value(async_load, "event_type");
//var pad_ind = ds_map_find_value(async_load, "pad_index");

if (ev_type == "gamepad discovered" or ev_type == "gamepad lost") {
	findGamepads();
}

//if (ev_type == "gamepad discovered") {
//	if (gamepad_is_connected(pad_ind) and !global.gamepadOn) { // if more than 1 gamepads detected at the same time, use only the first
//		global.joyid = pad_ind;
//		global.gamepadOn = true;
//	}
//    gamepad_set_button_threshold(global.joyid, 1); // we need this to be pretty high, as analogue triggers are treated like analogue triggers and not like buttons!
//} else {
//    global.gamepadOn = false;
//    global.joyid = -1;
//}