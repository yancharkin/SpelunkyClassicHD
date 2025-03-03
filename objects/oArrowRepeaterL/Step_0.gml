firing = false;
if (fired > 0) fired -= 1;
else if (not oPlayer1.dead)
{
        arrow = instance_create(x-2, y+4, oArrow);
        arrow.xVel = -8;
        fired = rand(100,200);
        playSound(global.sndArrowTrap);
}
