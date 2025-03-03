if (dying)
{
    if (life > 0) life -= 1;
    else
    {
        life = 20;
        dying = false;
    }
}
else
{
    if (dir == UP)
    {
        if (hard) y -= 2;
        else y -= 1;
        moveOff += 1;
        if (y <= 64 or moveOff > 64)
        {
            dir = DOWN;
            moveOff = 0;
        }
    }
    else if (dir == DOWN)
    {
        if (hard) y += 2;
        else y += 1;
        moveOff += 1;
        if (y >= 160 or moveOff > 64)
        {
            dir = UP;
            moveOff = 0;
        }
    }
    
    if (oMoonRoom.timer <= 30)
    {
        x = 240 - abs(sin(xDiff)*64);
        xDiff += 0.01;
    }
}
