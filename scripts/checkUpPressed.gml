if (gamepad.upPressed or
        gamepad_button_check_pressed(global.joyid, gp_padu) or
        oGame.analogLUpPressed or
        keyboard_check_pressed(global.keyUpVal)) {
    return true;
} else {
    return false;
}
