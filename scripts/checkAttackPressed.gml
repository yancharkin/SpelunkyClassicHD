if (gamepad.attackPressed or 
        gamepad_button_check_pressed(global.joyid, global.joyAttackVal) or
        keyboard_check_pressed(global.keyAttackVal)) {
    return true;
} else {
    return false;
}
