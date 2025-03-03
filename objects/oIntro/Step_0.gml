if (!global.html5Build) {
    var skipCondition = (keyboard_check_pressed(global.keyEnter) or
            keyboard_check_pressed(global.keyEscape) or
            checkAttackPressed() or
            checkStartPressed());
} else {
    var skipCondition = (keyboard_check_pressed(global.keyEnter) or
            keyboard_check_pressed(global.keyEscape) or
            html5_gamepad_button_check(global.joyid, global.joyJumpVal) or
            html5_gamepad_button_check(global.joyid, global.joyAttackVal) or
            html5_gamepad_button_check(global.joyid, global.joyStartVal) or
            checkAttackPressed() or
            checkStartPressed());
}

if (skipCondition) {
    if (not instance_exists(oPDummy3)) fadeIn = true;
    else
    {
        fadeIn = false;
        fadeOut = true;
    }
}

if (fadeIn)
{
    drawStatus = -1;
    if (fadeLevel > 0) fadeLevel -= 0.1;
    else
    {
        fadeIn = false;
        if (not instance_exists(oPDummy3)) instance_create(-32, 184, oPDummy3);
    }
}
else if (fadeOut)
{
    if (fadeLevel < 1) fadeLevel += 0.1;
    else
    {
        global.gameStart = false;
        room_goto(rTitle);
    }
}

