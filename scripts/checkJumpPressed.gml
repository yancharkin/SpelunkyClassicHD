if (gamepad.jumpPressed or
        gamepad_button_check_pressed(global.joyid, global.joyJumpVal) or
        global.bJumpPressed or
        keyboard_check_pressed(global.keyJumpVal)) or
        keyboard_check_pressed(ord('J')) {
    return true;
} else {
    return false;
}
