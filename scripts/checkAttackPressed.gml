if (gamepad.attackPressed)
    return gamepad.attackPressed;
else{
    return (keyboard_check_pressed(global.keyAttackVal));
}
