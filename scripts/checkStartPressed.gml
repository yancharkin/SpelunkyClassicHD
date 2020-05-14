if (gamepad.startPressed or 
        gamepad_button_check_pressed(global.joyid, global.joyStartVal) or
        keyboard_check_pressed(vk_escape)) {
    return true;
} else {
    return false;
}
