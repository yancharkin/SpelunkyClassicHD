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
	global.keyLangVal = ord("L");
	global.keyStartVal = vk_escape;
	global.keyEscape = vk_escape;
	global.keyEnter = vk_enter;
	global.keyRestartVal = vk_f5;
	if ((global.html5Build) and (not global.html5StandaloneBuild)) global.keyStartVal = vk_tab;

	global.joyJumpVal = -1;
	global.joyAttackVal = -1;
	global.joyItemVal = -1;
	global.joyRunVal = -1;
	global.joyBombVal = -1;
	global.joyRopeVal = -1;
	global.joyFlareVal = -1;
	global.joyPayVal = -1;
	global.joyStartVal = -1;
	global.joyLeftVal = -1;
	global.joyRightVal = -1;
	global.joyUpVal = -1;
	global.joyDownVal = -1;
	global.joyLangVal = -1;
	global.joyRestartVal = -1;

	if (file_exists(getWorkingDirPath("settings.json"))) {
	    var settingsMap = json2dsmap(getWorkingDirPath("settings.json"));
	    global.locale = is_undefined(settingsMap[? "locale"]) ? global.locale : settingsMap[? "locale"];
		global.locale2 = is_undefined(settingsMap[? "locale2"]) ? global.locale : settingsMap[? "locale2"];
	    global.fullscreen = is_undefined(settingsMap[? "fullscreen"]) ? global.fullscreen : settingsMap[? "fullscreen"];
	    global.music = is_undefined(settingsMap[? "music"]) ? global.music : settingsMap[? "music"];
	    global.toggleRunEnabled = is_undefined(settingsMap[? "toggleRunEnabled"]) ? global.toggleRunEnabled : settingsMap[? "toggleRunEnabled"];
	    global.firstLaunch = is_undefined(settingsMap[? "firstLaunch"]) ? global.firstLaunch : settingsMap[? "firstLaunch"];
	    global.touchControlsVisibility = is_undefined(settingsMap[? "touchControlsVisibility"]) ? global.touchControlsVisibility : real(settingsMap[? "touchControlsVisibility"]);
		if ((not global.mobileBuild) and (not global.html5Mobile)) global.touchControlsVisibility = 0;
		global.vkeySize = is_undefined(settingsMap[? "touchButtonsSize"]) ? global.vkeySize : int64(settingsMap[? "touchButtonsSize"]);
		global.touchOffsetH = is_undefined(settingsMap[? "touchOffsetH"]) ? global.touchOffsetH : real(settingsMap[? "touchOffsetH"]);
	    ds_map_destroy(settingsMap);
	}

	if (file_exists(getWorkingDirPath("keys.json"))) {
	    var keysMap = json2dsmap(getWorkingDirPath("keys.json"));
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
		global.keyRestartVal =  is_undefined(keysMap[? "keyRestartVal "]) ? global.keyRestartVal  : int64(keysMap[? "keyRestartVal "]);
	    ds_map_destroy(keysMap);
	}

	if (file_exists(getWorkingDirPath("gamepad.json"))) {
	    var joyMap = json2dsmap(getWorkingDirPath("gamepad.json"));
	    global.joyJumpVal =  is_undefined(joyMap[? "joyJumpVal"]) ? global.joyJumpVal : getJoyBtnOrAxisId(joyMap[? "joyJumpVal"]);
	    global.joyAttackVal =  is_undefined(joyMap[? "joyAttackVal"]) ? global.joyAttackVal : getJoyBtnOrAxisId(joyMap[? "joyAttackVal"]);
	    global.joyItemVal =  is_undefined(joyMap[? "joyItemVal"]) ? global.joyItemVal : getJoyBtnOrAxisId(joyMap[? "joyItemVal"]);
	    global.joyRunVal =  is_undefined(joyMap[? "joyRunVal"]) ? global.joyRunVal : getJoyBtnOrAxisId(joyMap[? "joyRunVal"]);
	    global.joyBombVal =  is_undefined(joyMap[? "joyBombVal"]) ? global.joyBombVal : getJoyBtnOrAxisId(joyMap[? "joyBombVal"]);
	    global.joyRopeVal =  is_undefined(joyMap[? "joyRopeVal"]) ? global.joyRopeVal : getJoyBtnOrAxisId(joyMap[? "joyRopeVal"]);
	    global.joyFlareVal =  is_undefined(joyMap[? "joyFlareVal"]) ? global.joyFlareVal : getJoyBtnOrAxisId(joyMap[? "joyFlareVal"]);
	    global.joyPayVal =  is_undefined(joyMap[? "joyPayVal"]) ? global.joyPayVal : getJoyBtnOrAxisId(joyMap[? "joyPayVal"]);
	    global.joyStartVal =  is_undefined(joyMap[? "joyStartVal"]) ? global.joyStartVal : getJoyBtnOrAxisId(joyMap[? "joyStartVal"]);
		global.joyLeftVal =  is_undefined(joyMap[? "joyLeftVal"]) ? global.joyLeftVal : getJoyBtnOrAxisId(joyMap[? "joyLeftVal"]);
		global.joyRightVal =  is_undefined(joyMap[? "joyRightVal"]) ? global.joyRightVal : getJoyBtnOrAxisId(joyMap[? "joyRightVal"]);
		global.joyUpVal =  is_undefined(joyMap[? "joyUpVal"]) ? global.joyUpVal : getJoyBtnOrAxisId(joyMap[? "joyUpVal"]);
		global.joyDownVal =  is_undefined(joyMap[? "joyDownVal"]) ? global.joyDownVal : getJoyBtnOrAxisId(joyMap[? "joyDownVal"]);
		global.joyLangVal =  is_undefined(joyMap[? "joyLangVal"]) ? global.joyLangVal : getJoyBtnOrAxisId(joyMap[? "joyLangVal"]);
		global.joyRestartVal =  is_undefined(joyMap[? "joyRestartVal "]) ? global.joyRestartVal  : getJoyBtnOrAxisId(joyMap[? "joyRestartVal "]);
	    ds_map_destroy(joyMap);
	}

	if (file_exists(getWorkingDirPath("gamepadmapping.json"))) {
	    global.gamepadMapping = json2dsmap(getWorkingDirPath("gamepadmapping.json"));
	} else {
	    global.gamepadMapping = ds_map_create();
	}
}