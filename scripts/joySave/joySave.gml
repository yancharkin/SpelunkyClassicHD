/// @description joySave
function joySave() {

	if (file_exists(working_directory + "gamepad.json")) {
	    var joyMap = json2dsmap(working_directory + "gamepad.json");
	} else {
	    var joyMap = ds_map_create();
	}

	ds_map_replace(joyMap, "joyJumpVal", int64(global.joyJumpVal));
	ds_map_replace(joyMap, "joyAttackVal", int64(global.joyAttackVal));
	ds_map_replace(joyMap, "joyItemVal", int64(global.joyItemVal));
	ds_map_replace(joyMap, "joyRunVal", int64(global.joyRunVal));
	ds_map_replace(joyMap, "joyBombVal", int64(global.joyBombVal));
	ds_map_replace(joyMap, "joyRopeVal", int64(global.joyRopeVal));
	ds_map_replace(joyMap, "joyFlareVal", int64(global.joyFlareVal));
	ds_map_replace(joyMap, "joyPayVal", int64(global.joyPayVal));
	ds_map_replace(joyMap, "joyStartVal", int64(global.joyStartVal));

	dsmap2json(joyMap, working_directory + "gamepad.json");
	ds_map_destroy(joyMap);



}
