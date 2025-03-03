// jumped on - oCaveman, oManTrap replaces this script with its own
if (abs(other.x-(x+8)) > 4 or status == GRAB)
{
    // do nothing
}
else if (not other.dead and (other.state == 15 or other.state == 16) and other.y < y+2 and not other.swimming)
{
    other.yVel = -6 - 0.2 * other.yVel;
    other.fallTimer = 0;
    hp -= 1;
    playSound(global.sndHit);
}
else if (not other.invincible and grabCounter == 0)
{
    if ((y+8) > oPlayer1.y+2) y = oPlayer1.y+2-8;
    if ((y+8) < oPlayer1.y-2) y = oPlayer1.y-2-8;
    status = GRAB;
    xVel = 0;
    yVel = 0;
    grabX = x - oPlayer1.x;
    grabY = y - oPlayer1.y;
    counter = rand(40,80);
}

