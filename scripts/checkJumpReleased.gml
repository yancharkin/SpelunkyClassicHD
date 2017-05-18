if (gamepad.jumpReleased)
    return gamepad.jumpReleased;
else
    return (keyboard_check_released(global.keyJumpVal));
