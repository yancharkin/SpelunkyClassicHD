/// @description joySave
function joySave() {
	
	var joyMap = ds_map_create();

	if (file_exists(working_directory + "gamepad.json")) {
	    joyMap = json2dsmap(working_directory + "gamepad.json");
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
	ds_map_replace(joyMap, "joyLeftVal", int64(global.joyLeftVal));
	ds_map_replace(joyMap, "joyRightVal", int64(global.joyRightVal));
	ds_map_replace(joyMap, "joyUpVal", int64(global.joyUpVal));
	ds_map_replace(joyMap, "joyDownVal", int64(global.joyDownVal));
	ds_map_replace(joyMap, "joyLangVal", int64(global.joyLangVal));

	dsmap2json(joyMap, working_directory + "gamepad.json");
	ds_map_destroy(joyMap);

}
