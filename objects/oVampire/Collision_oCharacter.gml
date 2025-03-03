if (abs(other.x-(x+8)) > 8)
{
    // do nothing
}
else if (not other.dead and (other.state == 15 or other.state == 16) and other.y < y+5 and not other.swimming)
{
    // Jumped on
    if (status < STUNNED)
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
}
else if (other.invincible == 0)
{
    if (status < STUNNED)
    {
        other.blink = 30
        other.invincible = 30
        if (other.y < y)
            other.yVel = -6
        if (other.x < x)
            other.xVel = -6
        else
            other.xVel = 6
        instance_create(other.x, other.y, oBlood);
    
        if (global.plife > 0) global.plife -= 1;
        playSound(global.sndHurt);
    }
}
