var skipCondition = (keyboard_check_pressed(global.keyEnter) or
        keyboard_check_pressed(global.keyEscape) or 
        checkAttackPressed() or checkStartPressed());

if (skipCondition) {
    if (gamepad.attackPressed) gamepad.attackPressed = false;
    if (gamepad.startPressed) gamepad.startPressed = false;
    global.gameStart = false;
    room_goto(rEnd3);
}