if (gamepad.downPressed or
        gamepad_button_check_pressed(global.joyid, gp_padd) or
        oGame.analogLDownPressed or
        keyboard_check_pressed(global.keyDownVal)) {
    return true;
} else {
    return false;
}
