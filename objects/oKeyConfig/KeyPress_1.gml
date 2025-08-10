var pressedKey  = keyboard_key;

if (pressedKey != global.keyEscape) {
    if (status == 0) {
        global.keyUpVal = pressedKey;
    } else if (status == 1) {
        global.keyDownVal = pressedKey;
    } else if (status == 2) {
        global.keyLeftVal = pressedKey;
    } else if (status == 3) {
        global.keyRightVal = pressedKey;
    } else if (status == 4) {
        global.keyJumpVal = pressedKey;
    } else if (status == 5) {
        global.keyAttackVal = pressedKey;
    } else if (status == 6) {
        global.keyItemVal = pressedKey;
    } else if (status == 7) {
        global.keyRunVal = pressedKey;
    } else if (status == 8) {
        global.keyBombVal = pressedKey;
    } else if (status == 9) {
        global.keyRopeVal = pressedKey;
    } else if (status == 10) {
        global.keyPayVal = pressedKey;
    } else if (status == 11) {
        global.keyLangVal = pressedKey;
    } else if (status == 12) {
        global.keyRestartVal = pressedKey;
    }
}

//status += 1;
alarm[0] = alarmSec*fps;
if (status > 11 and not global.debugBuild) room_goto(rTitle);
if (status > 12) room_goto(rTitle);