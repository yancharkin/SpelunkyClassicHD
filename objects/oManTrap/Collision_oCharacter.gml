if (abs(other.x-(x+8)) > 8)
{
    // do nothing
}
else if ((global.hasSpikeShoes or status == EATING) and not other.dead and not other.stunned and (other.state == 15 or other.state == 16) and other.y < y+5 and not other.swimming)
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
else if (other.visible and other.invincible == 0)
{
    if (status != STUNNED and status != EATING)
    {
        xVel = 0;
        status = EATING;
        if (other.x > x+8) facing = RIGHT;
        else facing = LEFT;
        if (global.isDamsel)
        {
            sprite_index = sManTrapEatDamselL;
        }
        else if (global.isTunnelMan)
        {
            sprite_index = sManTrapEatTunnelL;
        }
        else
        {
            sprite_index = sManTrapEatL;
        }
        
        other.visible = false;
        other.invincible = 9999;
        other.bounced = true;
        global.plife = -99;
        playSound(global.sndDie);
        global.drawHUD = false;
        if (isRealLevel()) global.enemyDeaths[10] += 1;
                
        if (other.holdItem)
        {
            if (held) held = false;
            else
            {
                other.holdItem.held = false;
                if (facing == LEFT) other.holdItem.xVel = -2;
                else other.holdItem.xVel = 2;
                other.holdItem.yVel = -4;
            }
            other.holdItem = 0;
            other.pickupItemType = "";
        }
    }
}

