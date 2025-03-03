// jumped on - oCaveman, oManTrap replaces this script with its own
if (abs(other.x-(x+16)) > 16)
{
    // do nothing
}
else if (not other.dead and (other.state == 15 or other.state == 16) and other.y < y+16 and not other.swimming)
{
    other.yVel = -6 - 0.2 * other.yVel;
    if (global.hasSpikeShoes) { hp -= (3 * (floor(other.fallTimer/16)+1)); if (not bloodless) instance_create(other.x, other.y+8, oBlood); }
    else hp -= (1 * (floor(other.fallTimer/16)+1));
    other.fallTimer = 0;
    instance_create(x+16, y+24, oBlood);
    playSound(global.sndHit);
}
else if (other.invincible == 0)
{
    if (true)
    {
        other.blink = 30
        other.invincible = 30
        if (other.y < y)
            other.yVel = -6
        if (other.x < x)
            other.xVel = -6
        else
            other.xVel = 6
    
        if (global.plife > 0)
        {
            global.plife -= 2;
            if (global.plife <= 0 and isRealLevel()) global.enemyDeaths[3] += 1;
        }
        playSound(global.sndHurt);
    }
}

