if (true)
{
    x += xVel;
    y += yVel;

    if (xVel < 0) xVel += 0.1;
    
    if (yVel < 6)
    {
        yVel += myGrav;
    }
    
    if (y > 240)
        room_goto(rEnd3);
}
