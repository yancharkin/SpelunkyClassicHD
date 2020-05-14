if (gamepad.bombPressed or 
        gamepad_button_check_pressed(global.joyid, global.joyBombVal) or
        keyboard_check_pressed(global.keyBombVal)) {
    return true;
} else {
    return false;
}
