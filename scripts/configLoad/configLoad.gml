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
	global.keyLangVal = ord("L");
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
		global.joyLeftVal = gp_padl;
		global.joyRightVal = gp_padr;
		global.joyUpVal = gp_padu;
		global.joyDownVal = gp_padd;	
		global.joyLangVal = gp_stickr;
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
	    global.locale = is_undefined(settingsMap[? "locale"]) ? global.locale : settingsMap[? "locale"];
		global.locale2 = is_undefined(settingsMap[? "locale2"]) ? global.locale : settingsMap[? "locale2"];
	    global.fullscreen = is_undefined(settingsMap[? "fullscreen"]) ? global.fullscreen : settingsMap[? "fullscreen"];
	    global.music = is_undefined(settingsMap[? "music"]) ? global.music : settingsMap[? "music"];
	    global.toggleRunEnabled = is_undefined(settingsMap[? "toggleRunEnabled"]) ? global.toggleRunEnabled : settingsMap[? "toggleRunEnabled"];
	    global.firstLaunch = is_undefined(settingsMap[? "firstLaunch"]) ? global.firstLaunch : settingsMap[? "firstLaunch"];
	    global.touchControlsVisibility = is_undefined(settingsMap[? "touchControlsVisibility"]) ? global.touchControlsVisibility : int64(settingsMap[? "touchControlsVisibility"]);
	    ds_map_destroy(settingsMap);
	}

	if (file_exists(working_directory + "keys.json")) {
	    var keysMap = json2dsmap(working_directory + "keys.json");
	    global.keyUpVal = is_undefined(keysMap[? "keyUpVal"]) ? global.keyUpVal : int64(keysMap[? "keyUpVal"]);
	    global.keyDownVal =  is_undefined(keysMap[? "keyDownVal"]) ? global.keyDownVal : int64(keysMap[? "keyDownVal"]);
	    global.keyLeftVal =  is_undefined(keysMap[? "keyLeftVal"]) ? global.keyLeftVal : int64(keysMap[? "keyLeftVal"]);
	    global.keyRightVal =  is_undefined(keysMap[? "keyRightVal"]) ? global.keyRightVal : int64(keysMap[? "keyRightVal"]);
	    global.keyJumpVal =  is_undefined(keysMap[? "keyJumpVal"]) ? global.keyJumpVal : int64(keysMap[? "keyJumpVal"]);
	    global.keyAttackVal =  is_undefined(keysMap[? "keyAttackVal"]) ? global.keyAttackVal : int64(keysMap[? "keyAttackVal"]);
	    global.keyItemVal =  is_undefined(keysMap[? "keyItemVal"]) ? global.keyItemVal : int64(keysMap[? "keyItemVal"]);
	    global.keyRunVal =  is_undefined(keysMap[? "keyRunVal"]) ? global.keyRunVal : int64(keysMap[? "keyRunVal"]);
	    global.keyBombVal =  is_undefined(keysMap[? "keyBombVal"]) ? global.keyBombVal : int64(keysMap[? "keyBombVal"]);
	    global.keyRopeVal =  is_undefined(keysMap[? "keyRopeVal"]) ? global.keyRopeVal : int64(keysMap[? "keyRopeVal"]);
	    global.keyFlareVal =  is_undefined(keysMap[? "keyFlareVal"]) ? global.keyFlareVal : int64(keysMap[? "keyFlareVal"]);
	    global.keyPayVal =  is_undefined(keysMap[? "keyPayVal"]) ? global.keyPayVal : int64(keysMap[? "keyPayVal"]);
		global.keyLangVal =  is_undefined(keysMap[? "keyLangVal"]) ? global.keyLangVal : int64(keysMap[? "keyLangVal"]);
	    ds_map_destroy(keysMap);
	}

	if (file_exists(working_directory + "gamepad.json")) {
	    var joyMap = json2dsmap(working_directory + "gamepad.json");
	    global.joyJumpVal =  is_undefined(joyMap[? "joyJumpVal"]) ? global.joyJumpVal : int64(joyMap[? "joyJumpVal"]);
	    global.joyAttackVal =  is_undefined(joyMap[? "joyAttackVal"]) ? global.joyAttackVal : int64(joyMap[? "joyAttackVal"]);
	    global.joyItemVal =  is_undefined(joyMap[? "joyItemVal"]) ? global.joyItemVal : int64(joyMap[? "joyItemVal"]);
	    global.joyRunVal =  is_undefined(joyMap[? "joyRunVal"]) ? global.joyRunVal : int64(joyMap[? "joyRunVal"]);
	    global.joyBombVal =  is_undefined(joyMap[? "joyBombVal"]) ? global.joyBombVal : int64(joyMap[? "joyBombVal"]);
	    global.joyRopeVal =  is_undefined(joyMap[? "joyRopeVal"]) ? global.joyRopeVal : int64(joyMap[? "joyRopeVal"]);
	    global.joyFlareVal =  is_undefined(joyMap[? "joyFlareVal"]) ? global.joyFlareVal : int64(joyMap[? "joyFlareVal"]);
	    global.joyPayVal =  is_undefined(joyMap[? "joyPayVal"]) ? global.joyPayVal : int64(joyMap[? "joyPayVal"]);
	    global.joyStartVal =  is_undefined(joyMap[? "joyStartVal"]) ? global.joyStartVal : int64(joyMap[? "joyStartVal"]);
		global.joyLeftVal =  is_undefined(joyMap[? "joyLeftVal"]) ? global.joyLeftVal : int64(joyMap[? "joyLeftVal"]);
		global.joyRightVal =  is_undefined(joyMap[? "joyRightVal"]) ? global.joyRightVal : int64(joyMap[? "joyRightVal"]);
		global.joyUpVal =  is_undefined(joyMap[? "joyUpVal"]) ? global.joyUpVal : int64(joyMap[? "joyUpVal"]);
		global.joyDownVal =  is_undefined(joyMap[? "joyDownVal"]) ? global.joyDownVal : int64(joyMap[? "joyDownVal"]);
		global.joyLangVal =  is_undefined(joyMap[? "joyLangVal"]) ? global.joyLangVal : int64(joyMap[? "joyLangVal"]);
	    ds_map_destroy(joyMap);
	}

	if (file_exists(working_directory + "gamepadmapping.json")) {
	    global.gamepadMapping = json2dsmap(working_directory + "gamepadmapping.json");
	} else {
	    global.gamepadMapping = ds_map_create();
	}

}
