action_inherited();
if (xVel > 0 and yVel < 0)
{
    direction = radtodeg(arctan(-yVel/xVel));
}
else if (xVel < 0 and yVel < 0)
{
    direction = 180 - radtodeg(arctan(-yVel/-xVel));
}
else if (xVel > 0 and yVel > 0)
{
    direction = radtodeg(arctan(yVel/xVel));
}
else if (xVel < 0 and yVel > 0)
{
    direction = 180 + radtodeg(arctan(yVel/-xVel));
}
else if (xVel < 0) direction = 180;
else if (not stuck) direction = 0;

image_angle = direction;

// ensure the arrow does not shoot through the target in the Moon challenge
if (isRoom("rMoon"))
{
    if (instance_exists(oTarget))
    {
        if (x > oTarget.x and y > oTarget.y-16 and y < oTarget.y+16 and
            distance_to_object(oTarget) < 4)
        {
            x = oTarget.x+4;
            xVel = 0;
            yVel = 0;
        }
    }
}
