dist = distance_to_object(oCharacter)
if (status == IDLE)
{
    // nothing
}
else if (status == DROP)
{
    yVel += myGrav;
    if (yVel > 6) yVel = 6;
    if (isCollisionBottom(1))
    {
        status = WAIT;
        yVel = 0;
        counter = 100;
        depth = 100;
    }
}
else if (status == WAIT)
{
    if (isCollisionBottom(1)) y -= 1;
}
