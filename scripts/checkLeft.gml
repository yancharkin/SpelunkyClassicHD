if (gamepad.left or
        gamepad_button_check(global.joyid, gp_padl) or
        (gamepad_axis_value(global.joyid, gp_axislh) < -0.6) or
        keyboard_check(global.keyLeftVal)) {
    return true;
} else {
    return false;
}
