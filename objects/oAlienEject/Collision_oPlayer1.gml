// jumped on - oCaveman, oManTrap replaces this script with its own
if (not other.dead and (other.state == 15 or other.state == 16) and other.y < y-3 and not other.swimming)
{
    other.yVel = -6 - 0.2 * other.yVel;
    other.fallTimer = 0;
    playSound(global.sndHit);
    repeat(3)
    {
        instance_create(other.x+8, other.y+8, oBlood);
    }
    if (countsAsKill)
    {
        if (isRealLevel()) global.enemyKills[15] += 1;
        global.aliens += 1;
        global.kills += 1;
    }
    instance_destroy();
}
else if (other.invincible == 0)
{
    other.blink = 30
    other.invincible = 30
    if (other.y < y)
        other.yVel = -6
    if (other.x < x)
        other.xVel = -6
    else
        other.xVel = 6
    
    if (global.plife > 0) global.plife -= 1;
    playSound(global.sndHurt);
}

