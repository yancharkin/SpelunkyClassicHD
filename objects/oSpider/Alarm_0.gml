status = BOUNCE;
if (isCollisionBottom(1))
{
    yVel = -1 * rand(2,5);
    if (oCharacter.x < x)
    {
        xVel = -2.5;
    }
    else
    {
        xVel = 2.5;
    }
}
