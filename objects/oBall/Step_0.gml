action_inherited();
if (distance_to_object(oPlayer1) >= 24)
{
    if (abs(oPlayer1.x - x) >= 24 or not colBot)
    {
        if (abs(oPlayer1.x-x) < 1)
        {
            x = oPlayer1.x;
            xVel = 0;
        }
        
        if (oPlayer1.x > x)
        {
            if (oPlayer1.xVel > 0 and y >= oPlayer1.y) xVel = oPlayer1.xVel;
            else if (xVel < 0) xVel *= -0.5;
            else if (xVel == 0) xVel = 2;
        }
        else if (oPlayer1.x < x)
        {
            if (oPlayer1.xVel < 0 and y >= oPlayer1.y) xVel = oPlayer1.xVel;
            else if (xVel > 0) xVel *= -0.5;
            else if (xVel == 0) xVel = -2;
        }
    }
    else
    {
        xVel *= 0.5;
        if (abs(xVel) < 0.5) xVel = 0;
    }
    
    if (abs(oPlayer1.y - y) >= 24)
    {
        if (oPlayer1.y < y) yVel = 0;
    }
}
else if (colBot)
{
    xVel = 0;
}
