var pressedKey;

if (!global.mobileBuild) {
    pressedKey = keyboard_key;
} else {
    pressedKey = global.keyEscape;
    for (var i = 2; i < 256; i++) { // on Android key press firt generate 0 or 1 for any key
        if (keyboard_check_pressed(i)) {
            pressedKey = i;
        }
    }
}

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
    }
}

status += 1;
if (status > 10) room_goto(rTitle);

