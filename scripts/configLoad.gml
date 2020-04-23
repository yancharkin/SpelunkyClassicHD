///configLoad

if (file_exists(working_directory + "settings.json")) {
    var settingsMap = json2dsmap(working_directory + "settings.json");
    global.locale = settingsMap[? "locale"];
    global.fullscreen = settingsMap[? "fullscreen"];
    global.toggleRunEnabled = settingsMap[? "toggleRunEnabled"];
    global.firstLaunch = settingsMap[? "firstLaunch"];
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
