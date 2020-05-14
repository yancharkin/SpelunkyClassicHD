if (gamepad.down or
        gamepad_button_check(global.joyid, gp_padd) or
        (gamepad_axis_value(global.joyid, gp_axislv) > 0.6) or
        keyboard_check(global.keyDownVal)) {
    return true;
} else {
    return false;
}
