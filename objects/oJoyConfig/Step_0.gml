joyReleased = false;
joyPressed = false;

joyKey = checkJoyButton();

if (joy) {
    if (joyKey != 0) {
        joy = true;
    } else{
        joyReleased = true;
        joy = false;
    }
} else {
    if (joyKey != 0) {
        joyPressed = true;
        joy = true;
    } else {
        joy = false;
    }
}

if (joyPressed) {
    if (status == 0) {
        global.joyJumpVal = joyKey;
    } else if (status == 1) {
        global.joyAttackVal = joyKey;
    } else if (status == 2) {
        global.joyItemVal = joyKey;
    } else if (status == 3) {
        global.joyRunVal = joyKey;
    } else if (status == 4) {
        global.joyBombVal = joyKey;
    } else if (status == 5) {
        global.joyRopeVal = joyKey;
    } else if (status == 6) {
        global.joyPayVal = joyKey;
    } else if (status == 7) {
        global.joyStartVal = joyKey;
    }
}

if (joyPressed or keyboard_check_pressed(vk_escape)) {
    status += 1;
    if (gamepad.attackPressed) gamepad.attackPressed = false;
    if (gamepad.startPressed) gamepad.startPressed = false;
    if (status > 7) room_goto(rTitle);
}

