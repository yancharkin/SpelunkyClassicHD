if (dir == UP)
{
    y -= difficulty;
    if (y <= 64)
    {
        dir = DOWN;
    }
}
else if (dir == DOWN)
{
    y += difficulty;
    if (y >= 160)
    {
        dir = UP;
    }
}
    
if (oMoonRoom.timer <= 20 and y > 64)
{
    x = xMid - abs(sin(xDiff)*32);
    xDiff += 0.01;
}
