if (gamepad.payPressed or 
        gamepad_button_check_pressed(global.joyid, global.joyPayVal) or
        keyboard_check_pressed(global.keyPayVal)) {
    return true;
} else {
    return false;
}
