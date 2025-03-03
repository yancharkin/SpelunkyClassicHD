/// @description Gamepad in HTML5
if (global.html5Build) {
    //Start
    if (html5_gamepad_button_check(global.joyid, global.joyStartVal)) {
        if (global.bStartPreviousState == false) {
            global.bStartPressed = true;
            global.bStartPreviousState = true;
        }
    } else {
        global.bStartPreviousState = false;
    }
    //Jump
    if (html5_gamepad_button_check(global.joyid, global.joyJumpVal)) {
        global.bJumpReleasedPreviousState = false;
        if (global.bJumpPressedPreviousState == false) {
            global.bJumpPressed = true;
            global.bJumpPressedPreviousState = true;
        }
    } else {
        global.bJumpPressedPreviousState = false;
        if (global.bJumpReleasedPreviousState == false) {
            global.bJumpReleased = true;
            global.bJumpReleasedPreviousState = true;
        }
    }
    //Attack
    if (html5_gamepad_button_check(global.joyid, global.joyAttackVal)) {
        global.bAttackReleasedPreviousState = false;
        if (global.bAttackPressedPreviousState == false) {
            global.bAttackPressed = true;
            global.bAttackPressedPreviousState = true;
        }
    } else {
        global.bAttackPressedPreviousState = false;
        if (global.bAttackReleasedPreviousState == false) {
            global.bAttackReleased = true;
            global.bAttackReleasedPreviousState = true;
        }
    }
    alarm[0] = 1;
}


timer += 1;  
if (!global.html5Build) {
    var skipCondition = (keyboard_check_pressed(global.keyEnter) or
            keyboard_check_pressed(global.keyEscape) or 
            checkAttackPressed() or checkStartPressed());
} else {
    var skipCondition = (keyboard_check_pressed(global.keyEnter) or
            keyboard_check_pressed(global.keyEscape) or
            global.bAttackPressed or global.bStartPressed or
            checkAttackPressed() or checkStartPressed());
}

if (skipCondition) {
    if (timer > 50)
    {
        if (gamepad.attackPressed) gamepad.attackPressed = false;
        if (gamepad.startPressed) gamepad.startPressed = false;
        global.gameStart = false;
        room_goto(rEnd3);
    }
}

// shake the screen
if (global.shake > 0)
{
    if (shakeToggle) __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + rand(1,8) );
    else __view_set( e__VW.YView, 0, 0 );
    shakeToggle = not shakeToggle;
    global.shake -= 1;
}
else
{
    __view_set( e__VW.YView, 0, 0 );
}

if (__view_get( e__VW.XView, 0 ) < room_width - 320) __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (1) );

