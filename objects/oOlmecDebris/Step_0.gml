action_inherited();
x += xVel;
y += yVel;

if (bounce)
{
    if (yVel < 6)
    {
        yVel += grav;
    }
    
    if (collision_point(x, y+4, oTemple, 0, 0))
    {
        // bounce
        if (yVel > 1) yVel = -yVel * 0.4;
        else
        {
            instance_create(x, y, oSmokePuff);
            instance_destroy();
        }
        
        // friction
        if (abs(xVel) < 0.1) xVel = 0;
        else if (abs(xVel) != 0) xVel *= 0.3;
    }
}
