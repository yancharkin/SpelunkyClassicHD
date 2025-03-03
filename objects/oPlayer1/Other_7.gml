if (sprite_index = sAttackLeft or sprite_index = sDamselAttackL or sprite_index = sTunnelAttackL)
{
    whipping = false;
    if (holdItem) holdItem.visible = true;
}
else if (sprite_index = sDuckToHangL or sprite_index = sDamselDtHL or sprite_index = sTunnelDtHL)
{
    y = y + 16;
    move_snap(1, 8);
    xVel = 0;
    yVel = 0;
    xAcc = 0;
    yAcc = 0;
    grav = 0;
    if (facing == LEFT)
    {
        obj = collision_point(x-8, y, oLadder, 0, 0);
        if (!obj) obj = collision_point(x-8, y, oLadderTop, 0, 0);
    }
    else
    {
        obj = collision_point(x+8, y, oLadder, 0, 0);
        if (!obj) obj = collision_point(x+8, y, oLadderTop, 0, 0);
    }
    if (instance_exists(obj))
    {
        state = CLIMBING;
        x = obj.x + 8;
    }
    else if (facing == LEFT)
    {
        state = HANGING;
        facing = RIGHT;
        x = x- 6;
        x += 1;
    }
    else
    {
        state = HANGING;
        facing = LEFT;
        x = x + 6;
    }
}
else if (sprite_index == sPExit or sprite_index == sDamselExit or sprite_index == sTunnelExit)
{
    if (global.collect > 0)
    {
        global.money += global.collect;
        global.collect = 0;
    }

    if (pExit == xSTART and global.gameStart)
    {
        global.gameStart = false;
        // scrClearGlobals();
        if (global.currLevel == 16) global.cityOfGold = false;
        
        if (global.testLevel != "")
        {
            scrClearGlobals();
            room_goto(rLevelEditor);
        }
        else if (global.currLevel == 5) room_goto(rTransition1x);
        else if (global.currLevel == 9) room_goto(rTransition2x);
        else if (global.currLevel == 13) room_goto(rTransition3x);
        else if (global.levelType == 1) room_goto(rTransition2);
        else if (global.levelType == 2) room_goto(rTransition3);
        else if (global.levelType == 3) room_goto(rTransition4);
        else if (global.levelType == 4) room_goto(rTransition4);
        else room_goto(rTransition1);
    }
    else if (pExit == xSTART)
    {
        global.usedShortcut = false;
        global.gameStart = true;
        //DFK used to have global.firstTime in the conditonal
        if (global.firstTime)
        {
            global.currLevel = 0;
            global.bombs = 0;
            global.rope = 2;
            global.firstTime = false;
            room_goto(rTutorial);
        }
        else if (global.levelType == 2) room_goto(rLevel2);
        else room_goto(rLevel);
    }
    else if (pExit == xTUTORIAL)
    {
        global.usedShortcut = false;
        global.gameStart = true;
        global.currLevel = 0;
        global.bombs = 0;
        global.rope = 2;
        room_goto(rTutorial);
    }
    else if (pExit == xSCORES)
    {
        global.gameStart = false;
        if (isRoom("rTitle"))
            global.scoresStart = 0;
        else if (isRoom("rSun"))
            global.scoresStart = 1;
        else if (isRoom("rMoon"))
            global.scoresStart = 2;
        else if (isRoom("rStars"))
            global.scoresStart = 3;
        else global.scoresStart = 0;
        room_goto(rHighscores);
    }
    else if (pExit == xTITLE)
    {
        global.gameStart = false;
        if (isRoom("rHighscores"))
            global.titleStart = 1;
        else if (isRoom("rTutorial"))
        {
            scrClearGlobals();
            global.titleStart = 3;
            global.currLevel = 1;
            shakeToggle = false;
            global.darkLevel = false;
            global.snakePit = false;
            global.messageTimer = 0;
            global.mini1 = 0;
            global.mini2 = 0;
            global.mini3 = 0;
            global.hasJordans = false;
            global.arrows = 0;
        }
        room_goto(rTitle);
    }
    else if (pExit == xEND)
    {
        global.gameStart = false;
        room_goto(rEnd);
    }
    else if (pExit == xSHORTCUT5)
    {
        global.usedShortcut = true;
        global.currLevel = 5;
        global.gameStart = true;
        room_goto(rLevel);
    }
    else if (pExit == xSHORTCUT9)
    {
        global.usedShortcut = true;
        global.currLevel = 9;
        global.gameStart = true;
        room_goto(rLevel2);
    }
    else if (pExit == xSHORTCUT13)
    {
        global.usedShortcut = true;
        global.currLevel = 13;
        global.gameStart = true;
        room_goto(rLevel);
    }
    else if (pExit == xSUN)
    {
        global.gameStart = false;
        room_goto(rSun);
    }
    else if (pExit == xMOON)
    {
        global.gameStart = false;
        room_goto(rMoon);
    }
    else if (pExit == xSTARS)
    {
        global.gameStart = false;
        room_goto(rStars);
    }
    else if (pExit == xCHANGE)
    {
        global.isDamsel = not global.isDamsel;
        active = true;
        depth = 50;
        invincible = 0;
        state = STANDING;
        facing = LEFT;
        if (global.isDamsel)
        {
            global.isTunnelMan = false;
            sprite_index = sDamselLeft;
        }
        else sprite_index = sStandLeft;
        global.plife = 4;
        global.bombs = 4;
        global.rope = 4;
        xVel = 0;
    }
    else if (pExit == xCHANGE2)
    {
        global.isTunnelMan = not global.isTunnelMan;
        if (global.isTunnelMan) global.isDamsel = false;
        active = true;
        depth = 50;
        invincible = 0;
        state = STANDING;
        facing = RIGHT;
        if (global.isTunnelMan)
        {
            global.isDamsel = false;
            sprite_index = sTunnelLeft;
            global.plife = 2;
            global.bombs = 0;
            global.rope = 0;
        }
        else
        {
            sprite_index = sStandLeft;
            global.plife = 4;
            global.bombs = 4;
            global.rope = 4;
        }
        xVel = 0;
        // room_goto(rStars);
    }
    
    global.cleanSolids = true;
}

