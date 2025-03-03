// treasure only active within view
if (x > __view_get( e__VW.XView, 0 )-16 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )+16 and
        y > __view_get( e__VW.YView, 0 )-16 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )+16 and
        state == ACTIVE)
{
    colLeft = false;
    colRight = false;
    colBot = false;
    if (isCollisionLeft(1)) colLeft = true;
    if (isCollisionRight(1)) colRight = true;
    if (isCollisionBottom(1)) colBot = true;

    moveTo(xVel, yVel);

    if (not colBot) yVel += myGrav;
    if (yVel > 8) yVel = 8;
    
    if (isCollisionTop(1))
    {
        if (yVel < 0) yVel = -yVel * 0.8;
        else y += 1;
    }
    
    if (colLeft or colRight)
    {
        xVel = -xVel * 0.5;
    }
    
    if (colBot)
    {
        /*
        // bounce
        if (yVel > 1) yVel = -yVel * 0.5;
        else yVel = 0;
        */
        
        // friction
        if (abs(xVel) < 0.1) xVel = 0;
        else if (abs(xVel) != 0) xVel *= 0.3;
        
        y -= 1;
        
        if (not isCollisionBottom(1))
        {
            y += 1;
            status = STATIC;
        }
        yVel = 0;
    }
    // else status = STATIC;
    
    if (colLeft)
    {
        if (not colRight) x += 1;
        //yVel = 0;
    }
    else if (colRight)
    {
        x -= 1;
        //yVel = 0;
    }

    if (global.hasSpectacles or global.hasUdjatEye)
    {
        depth = 0;
    }
    else depth = 101;
    
    if (collision_rectangle(x-3, y-3, x+3, y+3, oLava, 0, 0))
    {
        myGrav = 0;
        xVel = 0;
        yVel = 0;
        y += 0.05;
    }
    if (collision_point(x, y-5, oLava, 0, 0))
    {
        instance_destroy();
    }
}
/* */
/*  */
