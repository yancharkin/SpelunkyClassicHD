var skipCondition = (keyboard_check_pressed(global.keyEnter) or
        keyboard_check_pressed(global.keyEscape) or 
        checkAttackPressed() or checkStartPressed());

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