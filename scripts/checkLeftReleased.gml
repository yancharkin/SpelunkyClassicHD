if (gamepad.leftReleased)
    return gamepad.leftReleased;
else
    return (keyboard_check_released(global.keyLeftVal));
