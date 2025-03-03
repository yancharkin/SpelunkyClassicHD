if ((x < __view_get( e__VW.XView, 0 )-4 or x > __view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+4 or
        y < __view_get( e__VW.YView, 0 )-4 or y > __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )+4))
{
    instance_destroy();
}

if (life > 0) life -= 1;
else instance_destroy();

moveTo(xVel, yVel);

if (collision_point(x, y-4, oLava, 0, 0))
{
    instance_destroy();
}

if (bounce)
{
    if (yVel < 6)
    {
        yVel += grav;
    }
    
    if (isCollisionTop(1) and yVel < 0)
    {
        yVel = -yVel * 0.8;
    }
    
    if (isCollisionLeft(1) or isCollisionRight(1))
    {
        xVel = -xVel * 0.5;
    }
    
    if (isCollisionBottom(1))
    {
        // bounce
        if (yVel > 1) yVel = -yVel * 0.5;
        else yVel = 0;
    }
}
