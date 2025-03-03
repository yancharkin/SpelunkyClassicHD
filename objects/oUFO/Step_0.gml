if ((x > __view_get( e__VW.XView, 0 )-20 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )+4 and
        y > __view_get( e__VW.YView, 0 )-20 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )+4))
{
moveTo(xVel, yVel);

if (hp < 1)
{
    instance_create(x, y, oUFOCrash);
    if (countsAsKill)
    {
        if (isRealLevel()) global.enemyKills[16] += 1;
        global.ufos += 1;
        global.kills += 1;
    }
    instance_destroy();
}

dir = 0;
dist = point_distance(x, y, oCharacter.x, oCharacter.y);
if (dist < 160 and not alerted)
{
    alerted = true;
    playSound(global.sndAlien);
}

if (status == DESTROY)
{
    yVel = 0;
    if (shiftToggle == 0) // right
    {
        xVel = 1;
        shift += 1;
        if (shift >= 64)
        {
            shiftToggle = 1;
        }
    }
    else
    {
        xVel = -1;
        shift -= 1;
        if (shift <= -64)
        {
            shiftToggle = 0;
        }
    }
    
    if (isCollisionLeft(1))
    {
        x += 1;
        shiftToggle = 0;
        shift = -64;
    }
    
    if (isCollisionRight(1))
    {
        x -= 1;
        shiftToggle = 1;
        shift = 64;
    }
    
    if (abs(oCharacter.x - (x+8)) < 8)
    {
        status = BLAST;
        playSound(global.sndLaserCharge);
    }
    
    if (oPlayer1.y < y or y < oPlayer1.y-96) status = SEARCH;
}
else if (status = BLAST)
{
    xVel = 0;
    yVel = 0;
    sprite_index = sUFOBlast;
    if (image_index == 16)
    {
        instance_create(x+8, y+16, oLaser);
        playSound(global.sndLaser);
    }
}
else if (instance_exists(oCharacter) and not oCharacter.swimming and not oCharacter.dead)
{
    if (y > oCharacter.y - 48)
    {
        if (yVel == 2) status = DESTROY;
        yVel = -2;
        //if (isCollisionTop(1)) y += 2;
    }
    else
    {
        if (yVel == -2) status = DESTROY;
        yVel = 2;
        //if (isCollisionBottom(1)) y -= 2;
    }

    if (shiftToggle == 0) // right
    {
        xVel = 1;
        shift += 1;
        if (shift >= 32)
        {
            shiftToggle = 1;
            if (oCharacter.x > x) shift = 0;
        }
    }
    else
    {
        xVel = -1;
        shift -= 1;
        if (shift <= -32)
        {
            shiftToggle = 0;
            if (oCharacter.x < x) shift = 0;
        }
    }
    
    if (isCollisionLeft(1))
    {
        x += 1;
        shiftToggle = 0;
        shift = -32;
    }
    
    if (isCollisionRight(1))
    {
        x -= 1;
        shiftToggle = 1;
        shift = 32;
    }
}
}
