if (gamepad.jump or 
        gamepad_button_check(global.joyid, global.joyJumpVal) or
        keyboard_check(global.keyJumpVal)) or
        (gamepad_button_value(global.joyid, global.joyJumpVal) > 0.6) {
    return true;
} else {
    return false;
}
