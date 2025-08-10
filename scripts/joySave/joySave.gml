/// @description joySave
function joySave() {
	var joyMap = ds_map_create();
	if (file_exists(getWorkingDirPath("gamepad.json"))) {
	    joyMap = json2dsmap(getWorkingDirPath("gamepad.json"));
	}
	ds_map_replace(joyMap, "joyJumpVal", string(global.joyJumpVal));
	ds_map_replace(joyMap, "joyAttackVal", string(global.joyAttackVal));
	ds_map_replace(joyMap, "joyItemVal", string(global.joyItemVal));
	ds_map_replace(joyMap, "joyRunVal", string(global.joyRunVal));
	ds_map_replace(joyMap, "joyBombVal", string(global.joyBombVal));
	ds_map_replace(joyMap, "joyRopeVal", string(global.joyRopeVal));
	ds_map_replace(joyMap, "joyFlareVal", string(global.joyFlareVal));
	ds_map_replace(joyMap, "joyPayVal", string(global.joyPayVal));
	ds_map_replace(joyMap, "joyStartVal", string(global.joyStartVal));
	ds_map_replace(joyMap, "joyLeftVal", string(global.joyLeftVal));
	ds_map_replace(joyMap, "joyRightVal", string(global.joyRightVal));
	ds_map_replace(joyMap, "joyUpVal", string(global.joyUpVal));
	ds_map_replace(joyMap, "joyDownVal", string(global.joyDownVal));
	ds_map_replace(joyMap, "joyLangVal", string(global.joyLangVal));
	ds_map_replace(joyMap, "joyRestartVal", string(global.joyRestartVal));
	dsmap2json(joyMap, getWorkingDirPath("gamepad.json"));
	ds_map_destroy(joyMap);
}
