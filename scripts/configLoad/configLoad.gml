/// @description configLoad
function configLoad() {

	//Default controls
	global.keyUpVal = vk_up;
	global.keyDownVal = vk_down;
	global.keyLeftVal = vk_left;
	global.keyRightVal = vk_right;
	global.keyJumpVal = ord("Z");
	global.keyAttackVal = ord("X");
	global.keyItemVal = ord("C");
	global.keyRunVal = vk_shift;
	global.keyBombVal = ord("A");
	global.keyRopeVal = ord("S");
	global.keyFlareVal = ord("F");
	global.keyPayVal = ord("P");
	global.keyStartVal = vk_escape;
	global.keyEscape = vk_escape;
	global.keyEnter = vk_enter;
	if (os_type == os_android) {
	    global.keyStartVal = 8;
	    global.keyEscape = 8
	    global.keyEnter = 10;
	}

	if (!global.html5Build) {
	    global.joyJumpVal = gp_face1;
	    global.joyAttackVal = gp_face2;
	    global.joyItemVal = gp_face3;
	    global.joyRunVal = gp_shoulderlb;
	    global.joyBombVal = gp_shoulderl;
	    global.joyRopeVal = gp_shoulderr;
	    global.joyFlareVal = gp_face4;
	    global.joyPayVal = gp_shoulderrb;
	    global.joyStartVal = gp_start;
	} else {
	    global.joyAttackVal = 0;
	    global.joyJumpVal = 1;
	    global.joyItemVal = 2;
	    global.joyRunVal = 3;
	    global.joyFlareVal = 4;
	    global.joyPayVal = 5;
	    global.joyBombVal = 6;
	    global.joyRopeVal = 7;
	    global.joyStartVal = 9;
	}

	if (file_exists(working_directory + "settings.json")) {
	    var settingsMap = json2dsmap(working_directory + "settings.json");
	    global.locale = settingsMap[? "locale"];
	    global.fullscreen = settingsMap[? "fullscreen"];
	    global.music = settingsMap[? "music"];
	    global.toggleRunEnabled = settingsMap[? "toggleRunEnabled"];
	    global.firstLaunch = settingsMap[? "firstLaunch"];
	    global.touchControlsVisibility = int64(settingsMap[? "touchControlsVisibility"]);
	    ds_map_destroy(settingsMap);
	}

	if (file_exists(working_directory + "keys.json")) {
	    var keysMap = json2dsmap(working_directory + "keys.json");
	    global.keyUpVal = int64(keysMap[? "keyUpVal"]);
	    global.keyDownVal =  int64(keysMap[? "keyDownVal"]);
	    global.keyLeftVal =  int64(keysMap[? "keyLeftVal"]);
	    global.keyRightVal =  int64(keysMap[? "keyRightVal"]);
	    global.keyJumpVal =  int64(keysMap[? "keyJumpVal"]);
	    global.keyAttackVal =  int64(keysMap[? "keyAttackVal"]);
	    global.keyItemVal =  int64(keysMap[? "keyItemVal"]);
	    global.keyRunVal =  int64(keysMap[? "keyRunVal"]);
	    global.keyBombVal =  int64(keysMap[? "keyBombVal"]);
	    global.keyRopeVal =  int64(keysMap[? "keyRopeVal"]);
	    global.keyFlareVal =  int64(keysMap[? "keyFlareVal"]);
	    global.keyPayVal =  int64(keysMap[? "keyPayVal"]);
	    ds_map_destroy(keysMap);
	}

	if (file_exists(working_directory + "gamepad.json")) {
	    var joyMap = json2dsmap(working_directory + "gamepad.json");
	    global.joyJumpVal =  int64(joyMap[? "joyJumpVal"]);
	    global.joyAttackVal =  int64(joyMap[? "joyAttackVal"]);
	    global.joyItemVal =  int64(joyMap[? "joyItemVal"]);
	    global.joyRunVal =  int64(joyMap[? "joyRunVal"]);
	    global.joyBombVal =  int64(joyMap[? "joyBombVal"]);
	    global.joyRopeVal =  int64(joyMap[? "joyRopeVal"]);
	    global.joyFlareVal =  int64(joyMap[? "joyFlareVal"]);
	    global.joyPayVal =  int64(joyMap[? "joyPayVal"]);
	    global.joyStartVal =  int64(joyMap[? "joyStartVal"]);
	    ds_map_destroy(joyMap);
	}

	if (file_exists(working_directory + "gamepadmapping.json")) {
	    global.gamepadMapping = json2dsmap(working_directory + "gamepadmapping.json");
	} else {
	    global.gamepadMapping = ds_map_create();
	}



}
