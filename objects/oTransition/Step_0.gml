/// @description Gamepad in HTML5
    //Up/Down
    if (global.html5Build) {
    var downPressed = ((html5_gamepad_axis_value(global.joyid, 1) > 0.6) or
            (html5_gamepad_axis_value(global.joyid, 5) > 0.6));
    var upPressed = (html5_gamepad_axis_value(global.joyid, 1) < -0.6 or
            (html5_gamepad_axis_value(global.joyid, 5) < -0.6));
    
    if (downPressed) {
        if (global.analogLDownPreviousState == false) {
            global.analogLDownPressed = true;
            global.analogLDownPreviousState = true;
        }
    } else {
        global.analogLDownPreviousState = false;
    }
    if (upPressed) {
        if (global.analogLUpPreviousState == false) {
            global.analogLUpPressed = true;
            global.analogLUpPreviousState = true;
        }
    } else {
        global.analogLUpPreviousState = false;
    }
    //Start
    if (html5_gamepad_button_check(global.joyid, global.joyStartVal)) {
        if (global.bStartPreviousState == false) {
            global.bStartPressed = true;
            global.bStartPreviousState = true;
        }
    } else {
        global.bStartPreviousState = false;
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
    alarm[3] = 1;
}

if (!global.html5Build) {
    var skipCondition = checkAttackPressed() or checkStartPressed();
} else {
    var skipCondition = global.bAttackPressed or global.bStartPressed or
            checkAttackPressed() or checkStartPressed();
}

if (skipCondition) {
    n = 0;

    if (instance_exists(oTunnelMan))
    {
        person = instance_nearest(100, 100, oTunnelMan);
        if (person.talk != 6) n = 1;    
    }

    if (drawLoot == 2 and moneyCount == global.xmoney and n == 0)
    {
        if (gamepad.attackPressed) gamepad.attackPressed = false;
        if (gamepad.startPressed) gamepad.startPressed = false;
        if (alarm[0] > 1) alarm[0] = 1;
        if (alarm[1] > 1) alarm[1] = 1;
        global.gameStart = true;
        global.lake = false;
        if (global.customLevel) room_goto(rLoadLevel);
        else if (global.currLevel >= 5 and global.currLevel <= 8 and not global.genBlackMarket)
        {
            if (rand(1,global.probLake) == 1) { global.lake = true; room_goto(rLevel3); }
            else room_goto(rLevel);
        }
        else if (global.currLevel >= 9 and global.currLevel <= 12) room_goto(rLevel2);
        else if (global.currLevel == 16) room_goto(rOlmec);
        else room_goto(rLevel);
    }
    else
    {
        hurryup = true;
    }
}

if checkUpPressed()
{
    if (instance_exists(oTunnelMan))
    {
        person = instance_nearest(100, 100, oTunnelMan);
        person.donate += 100;
        if (isRoom("rTransition1x") or isRoom("rTransition3x"))
        {
            if (global.money > global.tunnel1)
            {
                if (person.donate > global.tunnel1) person.donate = global.tunnel1;
            }
            else if (person.donate > global.money) person.donate = global.money;
        }
        else
        {
            if (global.money > global.tunnel2)
            {
                if (person.donate > global.tunnel2) person.donate = global.tunnel2;
            }
            else if (person.donate > global.money) person.donate = global.money;
        }
    }
}
else if checkDownPressed()
{
    if (instance_exists(oTunnelMan))
    {
        person = instance_nearest(100, 100, oTunnelMan);
        person.donate -= 100;
        if (person.donate < 0) person.donate = 0;
    }
}

if (drawLoot == 2)
{
    if (moneyCount < global.xmoney)
    {
        if (hurryup) moneyCount = global.xmoney;
        else
        {
            moneyDiff = global.xmoney - moneyCount;
            if (moneyDiff > 100)
                moneyCount += 100;
            else
                moneyCount += moneyDiff;
        }
    }
}

debugCounter += 1;

