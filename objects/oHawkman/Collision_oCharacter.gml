// jumped on
if (status != DEAD and status != STUNNED)
{
if (abs(other.x-(x+8)) > 8)
{
    // do nothing
}
else if (not other.dead and not other.stunned and (other.state == 15 or other.state == 16) and other.y < y+5 and not other.swimming)
{
    other.yVel=-6-0.2*other.yVel
    if (global.hasSpikeShoes) { hp -= (3 * (floor(other.fallTimer/16)+1)); if (not bloodless) instance_create(other.x, other.y+8, oBlood); }
    else hp -= (1 * (floor(other.fallTimer/16)+1));
    other.fallTimer = 0;
    countsAsKill = true;
    status = STUNNED;
    counter = stunTime;
    yVel = -6;
    if (other.x < x+8) xVel += 1;
    else xVel -= 1;
    image_speed = 0.5;
    playSound(global.sndHit);
}
else if (other.invincible == 0 and status < STUNNED)
{
    if (collision_point(x+8, y-4, oSolid, 0, 0))
    {
        other.blink = 30
        other.invincible = 30
        if (other.x < x)
            other.xVel = -6
        else
            other.xVel = 6
        instance_create(other.x, other.y, oBlood);
    
        if (global.plife > 0)
        {
            global.plife -= 1;
            if (global.plife <= 0 and isRealLevel()) global.enemyDeaths[18] += 1;
        }
        playSound(global.sndHurt);
    }
    else if (status != THROW)
    {
        status = THROW;
        xVel = 0;
        if (other.x > x+8)
        {
            facing = RIGHT;
            sprite_index = sHawkThrowL;
            other.x = x;
            other.y = y;
            other.yVel = -6;
            other.xVel = 6;
        }
        else
        {
            facing = LEFT;
            sprite_index = sHawkThrowL;
            other.x = x + 16;
            other.y = y;
            other.yVel = -6;
            other.xVel = -6;
        }
        
        other.stunned = true;
        other.bounced = false;
        other.wallHurt = 1;
        
        with other
        {
            if (holdItem)
            {
                if (holdItem.type == "Gold Idol") holdItem.y -= 8;
                scrDropItem(xVel, yVel);
            }
        }  
    }
}
}

