if (gamepad.jumpReleased or
        gamepad_button_check_released(global.joyid, global.joyJumpVal) or
        keyboard_check_released(global.keyJumpVal)) {
    return true;
} else {
    return false;
}
