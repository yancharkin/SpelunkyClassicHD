if (!global.html5Build) {
    var skipCondition = (keyboard_check_pressed(global.keyEnter) or
            keyboard_check_pressed(global.keyEscape) or checkAttack());
} else {
    var skipCondition = (keyboard_check_pressed(global.keyEnter) or
            html5_gamepad_button_check(global.joyid, global.joyAttackVal) or
            keyboard_check_pressed(global.keyEscape) or checkAttack());
}

if (skipCondition) {
    if (instance_exists(oCamel))
    {
        if (fadeIn)
        {
            fadeLevel = 0;
        }
        else
        {
            if (gamepad.attackPressed) gamepad.attackPressed = false;
            if (gamepad.startPressed) gamepad.startPressed = false;
            fadeOut = true;
        }
    }
}

if (instance_exists(oCamel))
{
    if (oCamel.x <= 160 and not scrollStart)
    {
        with oDesertScroll
        {
            scroll = true;
        }
        alarm[1] = 1;
        alarm[2] = 20;
        scrollStart = true;
        scrolling = true;
    }
}

if (fadeIn)
{
    if (fadeLevel > 0) fadeLevel -= 0.1;
    else
    {
        fadeIn = false;
        alarm[0] = 20;
    }
}
else if (fadeOut)
{
    if (fadeLevel < 1) fadeLevel += 0.1;
    else
    {
        stopAllMusic();
        scrUpdateHighscores(1);
        scrClearGlobals();
        global.drawHUD = false;
        global.gameStart = false;
        room_goto(rHighscores);
    }
}

