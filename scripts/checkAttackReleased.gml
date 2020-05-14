if (gamepad.attackReleased or
        gamepad_button_check_released(global.joyid, global.joyAttackVal) or
        keyboard_check_released(global.keyAttackVal)) {
    return true;
} else {
    return false;
}
