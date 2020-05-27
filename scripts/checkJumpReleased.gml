if (gamepad.jumpReleased or
        gamepad_button_check_released(global.joyid, global.joyJumpVal) or
        global.bJumpReleased or
        keyboard_check_released(global.keyJumpVal)) or
        keyboard_check_released(ord('J')) {
    return true;
} else {
    return false;
}
