dist = distance_to_object(oCharacter)
if (status == IDLE)
{
    if (oPlayer1.y > y and dist < 96 and abs(oPlayer1.x - x) < 8)
    {
        status = DROP;
    }
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
    }
}
else if (status == WAIT)
{
    if (isCollisionBottom(1)) y -= 1;
    if (counter > 0) counter -= 1;
    else
    {
        status = RETURN;
        yVel = -1;
    }
}
else if (status == RETURN)
{
    if (isCollisionTop(1))
    {
        yVel = 0;
        status = IDLE;
    }
}
