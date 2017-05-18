if (gamepad.downPressed)
    return gamepad.downPressed;
else
    return (keyboard_check_pressed(global.keyDownVal));
