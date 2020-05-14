if (gamepad.right or
        gamepad_button_check(global.joyid, gp_padr) or
        (gamepad_axis_value(global.joyid, gp_axislh) > 0.6) or
        keyboard_check(global.keyRightVal)) {
    return true;
} else {
    return false;
}
