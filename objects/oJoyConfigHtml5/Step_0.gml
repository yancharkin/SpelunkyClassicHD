for (var i = 0; i < 31; i++) {
    if (html5_gamepad_button_check(global.joyid, i)) {
        if (buttonPreviousState == false) {
            buttonPressed = true;
            buttonPreviousState = true;
            button = i;
        }
    }
}
alarm[0] = 1;

if (buttonPressed) {
    if (status == 0) {   
        global.joyJumpVal = button;
    } else if (status == 1) {
        global.joyAttackVal = button;
    } else if (status == 2) {
        global.joyItemVal = button;
    } else if (status == 3) {
        global.joyRunVal = button;
    } else if (status == 4) {
        global.joyBombVal = button;
    } else if (status == 5) {
        global.joyRopeVal = button;
    } else if (status == 6) {
        global.joyPayVal = button;
    } else if (status == 7) {
        global.joyStartVal = button;
    }
}

if (buttonPressed or keyboard_check_pressed(vk_escape)) {
    status += 1;
    if (status > 7) room_goto(rTitle);
}

