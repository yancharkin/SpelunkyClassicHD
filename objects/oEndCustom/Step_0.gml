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
    alarm[6] = 1;
}


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
    if (drawStatus == 7)
    {
        if (moneyCount < global.money)
        {
            moneyCount = global.money;
        }
        else
        {
            fadeOut = true;
        }
    }
    else if (drawStatus == 8)
    {
        if (gamepad.attackPressed) gamepad.attackPressed = false;
        if (gamepad.startPressed) gamepad.startPressed = false;
        scrClearGlobals();
        room_goto(rHighscores);
    }
}

if (drawStatus > 2)
{
    moneyDiff = global.money - moneyCount;
    if (moneyDiff > 1000)
        moneyCount += 1000;
    else if (moneyDiff > 100)
        moneyCount += 100;
    else
        moneyCount += moneyDiff;
        
    if (drawStatus == 3 and moneyDiff == 0 and not poop)
    {   
        alarm[11] = 50;
        poop = true;
    }
}

if (fadeOut)
{
    if (fadeLevel < 1) fadeLevel += 0.1;
    else drawStatus = 8;
}

