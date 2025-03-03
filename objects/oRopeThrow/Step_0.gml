action_inherited();
if (armed and yVel >= 0)
{
    move_snap(16, 1);
    if (px < x)
    {
        if (not collision_point(x-8, y, oSolid, 0, 0)) x -= 8;
        else x += 8;
    }
    else
    {
        if (not collision_point(x+8, y, oSolid, 0, 0)) x += 8;
        else x -= 8;
    }
    instance_create(x, y, oRopeTop);
    armed = false;
    falling = true;
    xVel = 0;
    yVel = 0;
}

if (falling)
{
    xVel = 0;
    yVel = 0;
    y += 8;
    fallCount += 1;
    if (isCollisionBottom(1) or fallCount > 16)
    {
        falling = false;
        y -= 8;
        instance_destroy();
    }
    else instance_create(x-8, y, oRope);
}
