if (trapID == 0)
{
    instance_destroy();
}
else if (abs(other.xVel) > 0 or abs(other.yVel) > 0 or
         (oPlayer1.sprite_index = sDuckToHangL and oPlayer1.image_index > 6) or
         (oPlayer1.sprite_index = sDamselDtHL and oPlayer1.image_index > 6) or
         (oPlayer1.sprite_index = sTunnelDtHL and oPlayer1.image_index > 6))
{
    with trapID
    {
        if (fired == 0)
        {
            if (facing == 0)
            {
                arrow = instance_create(x-2, y+4, oArrow);
                arrow.xVel = -8;
            }
            else
            {
                arrow = instance_create(x+18, y+4, oArrow);
                arrow.xVel = 8;
            }
            fired += 1;
            playSound(global.sndArrowTrap);
        }
    }
    instance_destroy();
}
