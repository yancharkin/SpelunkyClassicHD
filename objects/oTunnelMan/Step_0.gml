if (!global.html5Build) {
    var skipCondition = checkAttackPressed();
} else {
    var skipCondition = global.bAttackPressed or checkAttackPressed();
}

if (skipCondition) {
    if (talk == 3) or (talk == 4) or (talk == 5) {
        talk = 6;
    }
    if (talk == 1) talk = 2;
    else if (talk == 2)
    {
        if (isRoom("rTransition1x") or isRoom("rTransition3x"))
        {
            if (donate > 0)
            {
                if (donate >= global.tunnel1) talk = 5;
                else talk = 3;
        
                global.money -= donate;
                global.tunnel1 -= donate;
            }
            else talk = 4;
        }
        else
        {
            if (donate > 0)
            {
                if (donate >= global.tunnel2)
                {
                    global.tunnel1 = global.tunnel3Max + 1;
                    talk = 5;
                }
                else talk = 3;
        
                global.money -= donate;
                global.tunnel2 -= donate;
            }
            else talk = 4;
        }
        
        with oPDummy
        {
            status = TRANSITION;
            if (global.isDamsel) sprite_index = sDamselRunL;
            else sprite_index = sRunLeft;
        }
    }}
    
    if (talk == 2)
    {
    if (checkUp())
    {
        upHeld += 1;
        downHeld = 0;
    
        if (upCounter < 20) upCounter += 1;
        else
        {
            if (upHeld > 100) donate += 1000;
            else donate += 100;
        }
        if (donate > global.money) donate = global.money;
        if (isRoom("rTransition1x") or isRoom("rTransition3x")) { if (donate > global.tunnel1) donate = global.tunnel1; }
        else { if (donate > global.tunnel2) donate = global.tunnel2; }
        downCounter = 0;
    }
    else if (checkDown())
    {
        downHeld += 1;
        upHeld = 0;
    
        if (downCounter < 20) downCounter += 1;
        else
        {
            if (downHeld > 100) donate -= 1000;
            else donate -= 100;
        }
        if (donate < 0) donate = 0;
        upCounter = 0;
    }
    else
    {
        upCounter = 0;
        downCounter = 0;
        
        upHeld = 0;
        downHeld = 0;
    }
}

