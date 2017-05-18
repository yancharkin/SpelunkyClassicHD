if (gamepad.rightReleased)
    return gamepad.rightReleased;
else
    return (keyboard_check_released(global.keyRightVal));
