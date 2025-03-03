if (status == IDLE)
{
    // nothing
}
else if (status == DROP)
{
    if (counter > 0) counter -= 1;
    else
    {
        counter = 3;
        y += 1;
    }
    yVel = 0;
    if (collision_point(x+8, y+17, oSolid, 0, 0)) status = WAIT;
    if (sprite_index = sBlock) sprite_index = sCeilingTrapS;
}
else if (status == WAIT)
{
    yVel = 0;
    if (isCollisionBottom(1)) y -= 1;
}
