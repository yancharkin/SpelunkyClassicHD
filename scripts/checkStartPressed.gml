if (gamepad.startPressed)
    return gamepad.startPressed;
else
    return (keyboard_check_pressed(vk_escape));
