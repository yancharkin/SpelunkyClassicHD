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
    //Item
    if (html5_gamepad_button_check(global.joyid, global.joyItemVal)) {
        if (global.bItemPreviousState == false) {
            global.bItemPressed = true;
            global.bItemPreviousState = true;
        }
    } else {
        global.bItemPreviousState = false;
    }
    //Bomb
    if (html5_gamepad_button_check(global.joyid, global.joyBombVal)) {
        if (global.bBombPreviousState == false) {
            global.bBombPressed = true;
            global.bBombPreviousState = true;
        }
    } else {
        global.bBombPreviousState = false;
    }
    //Run
    if (html5_gamepad_button_check(global.joyid, global.joyRunVal)) {
        if (global.bRunPreviousState == false) {
            global.bRunPressed = true;
            global.bRunPreviousState = true;
        }
    } else {
        global.bRunPreviousState = false;
    }
    //Rope
    if (html5_gamepad_button_check(global.joyid, global.joyRopeVal)) {
        if (global.bRopePreviousState == false) {
            global.bRopePressed = true;
            global.bRopePreviousState = true;
        }
    } else {
        global.bRopePreviousState = false;
    }
    //Flare
    if (html5_gamepad_button_check(global.joyid, global.joyFlareVal)) {
        if (global.bFlarePreviousState == false) {
            global.bFlarePressed = true;
            global.bFlarePreviousState = true;
        }
    } else {
        global.bFlarePreviousState = false;
    }
    //Pay
    if (html5_gamepad_button_check(global.joyid, global.joyPayVal)) {
        if (global.bPayPreviousState == false) {
            global.bPayPressed = true;
            global.bPayPreviousState = true;
        }
    } else {
        global.bPayPreviousState = false;
    }
    alarm[0] = 1;
}


///Check if any gamepad connected (HTML5)
if (global.html5Build) {
    global.gamepadOn = html5_gamepad_connected();
}

