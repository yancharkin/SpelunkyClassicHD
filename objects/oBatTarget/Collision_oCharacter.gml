// jumped on - oCaveman, oManTrap replaces this script with its own
if (abs(other.x-(x+8)) > 12)
{
    // do nothing
}
else if (not other.dead and (other.state == 15 or other.state == 16) and other.y < y+8 and not other.swimming)
{
    other.yVel = -6 - 0.2 * other.yVel;
    playSound(global.sndHit);
    playSound(global.sndCoin);
    oMoonRoom.baskets += difficulty;

    instance_create(x, -64, oBatTarget);

    scrCreateBlood(x+8, y+8, 3);
    instance_destroy();
}
else if (other.invincible == 0)
{
    other.blink = 30;
    other.invincible = 30;
    if (other.x < x)
        other.xVel = -6;
    else
        other.xVel = 6;
    
    if (global.plife > 0) global.plife -= 1;
    scrCreateBlood(x+4, y+4, 1);
    playSound(global.sndHurt);
}
