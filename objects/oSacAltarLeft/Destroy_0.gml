if (not cleanDeath and not global.cleanSolids)
{
    rubble = instance_create(x+8+rand(0,8)-rand(0,8), y+8+rand(0,8)-rand(0,8), oRubble);
    rubble.sprite_index = sRubbleTan;
    rubble = instance_create(x+8+rand(0,8)-rand(0,8), y+8+rand(0,8)-rand(0,8), oRubbleSmall);
    rubble.sprite_index = sRubbleTanSmall;
    rubble = instance_create(x+8+rand(0,8)-rand(0,8), y+8+rand(0,8)-rand(0,8), oRubbleSmall);
    rubble.sprite_index = sRubbleTanSmall;
}

if (defile)
{

    global.message = tr("YOU DARE DEFILE MY ALTAR?");
    global.message2 = tr("I WILL PUNISH YOU!");
    global.messageTimer = 200;
    scrShake(10);
    global.favor -= 16;
    
    if (global.kaliPunish == 0)
    {
        with oKaliHead
        {
            alarm[0] = 1;
        }
    }
    else if (global.kaliPunish == 1)
    {
        instance_create(oPlayer1.x, oPlayer1.y, oBall);
        obj = instance_create(oPlayer1.x, oPlayer1.y, oChain);
        obj.linkVal = 1;
        obj = instance_create(oPlayer1.x, oPlayer1.y, oChain);
        obj.linkVal = 2;
        obj = instance_create(oPlayer1.x, oPlayer1.y, oChain);
        obj.linkVal = 3;
        obj = instance_create(oPlayer1.x, oPlayer1.y, oChain);
        obj.linkVal = 4;
    }
    else
    {
        if (global.darkLevel and global.ghostExists)
        {
            with oKaliHead
            {
                alarm[0] = 1;
            }
        }
        else
        {
            global.darkLevel = true;
            if (not global.ghostExists)
            {
                if (oPlayer1.x > room_width / 2) instance_create(__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+8, __view_get( e__VW.YView, 0 )+floor(__view_get( e__VW.HView, 0 ) / 2), oGhost);
                else instance_create(__view_get( e__VW.XView, 0 )-32,  __view_get( e__VW.YView, 0 )+floor(__view_get( e__VW.HView, 0 ) / 2), oGhost);
                global.ghostExists = true;
            }
        }
    }

    global.kaliPunish += 1;

    with oSacAltarLeft
    {
        defile = false;
        instance_destroy();
    }
}
