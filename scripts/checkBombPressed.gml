if (gamepad.bombPressed)
    return gamepad.bombPressed;
else
    return (keyboard_check_pressed(global.keyBombVal));
