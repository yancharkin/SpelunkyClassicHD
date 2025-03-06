/// @description keysSave
function keysSave() {
	
	var keysMap = ds_map_create();
	if (file_exists(working_directory + "keys.json")) {
	    keysMap = json2dsmap(working_directory + "keys.json");
	}
	
	ds_map_replace(keysMap, "keyUpVal", int64(global.keyUpVal));
	ds_map_replace(keysMap, "keyDownVal", int64(global.keyDownVal));
	ds_map_replace(keysMap, "keyLeftVal", int64(global.keyLeftVal));
	ds_map_replace(keysMap, "keyRightVal", int64(global.keyRightVal));
	ds_map_replace(keysMap, "keyJumpVal", int64(global.keyJumpVal));
	ds_map_replace(keysMap, "keyAttackVal", int64(global.keyAttackVal));
	ds_map_replace(keysMap, "keyItemVal", int64(global.keyItemVal));
	ds_map_replace(keysMap, "keyRunVal", int64(global.keyRunVal));
	ds_map_replace(keysMap, "keyBombVal", int64(global.keyBombVal));
	ds_map_replace(keysMap, "keyRopeVal", int64(global.keyRopeVal));
	ds_map_replace(keysMap, "keyFlareVal", int64(global.keyFlareVal));
	ds_map_replace(keysMap, "keyPayVal", int64(global.keyPayVal));
	ds_map_replace(keysMap, "keyLangVal", int64(global.keyLangVal));

	dsmap2json(keysMap, working_directory + "keys.json");
	ds_map_destroy(keysMap);

}
