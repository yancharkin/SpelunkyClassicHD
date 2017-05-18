if (gamepad.jump){
    return gamepad.jump;
}else{
    return (keyboard_check(global.keyJumpVal));
}
