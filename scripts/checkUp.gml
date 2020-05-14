if (gamepad.up or
        gamepad_button_check(global.joyid, gp_padu) or
        (gamepad_axis_value(global.joyid, gp_axislv) < -0.6) or
        keyboard_check(global.keyUpVal)) {
    return true;
} else {
    return false;
}
