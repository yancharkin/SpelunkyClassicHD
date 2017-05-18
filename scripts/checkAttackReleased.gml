if (gamepad.attackReleased)
    return gamepad.attackReleased;
else
    return (keyboard_check_released(global.keyAttackVal));
