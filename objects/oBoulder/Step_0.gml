action_inherited();
if (true)
{
    colLeft = false;
    colRight = false;
    moveTo(xVel, yVel)
    //x += xVel;
    //y += yVel;
    
    if (yVel < 8)
    {
        yVel += myGrav;
    }

    if (x-17 <= 16 and xVel < 0)
    {
        x += 1;
        xVel = -xVel;
    }
    
    if (x+17 >= 656 and xVel > 0)
    {
        x -= 1;
        xVel = -xVel;
    }
    
    if (isCollisionTop(1) and yVel < 0)
    {
        yVel = -yVel * 0.8;
    }
    
    if (isCollisionBottom(1))
    {
        // bounce
        if (yVel > 3) yVel = -yVel * 0.3;
        else yVel = 0;
        
        // friction
        if (abs(xVel) != 0) xVel *= 0.99;
        
        if (not bounced and xVel == 0)
        {
            if (oPlayer1.x < x)
            {
                xVel = -4.5;
            }
            else
            {
                xVel = 4.5;
            }
            bounced = true;
        }
        
        if (abs(xVel) < 0.5) xVel = 0;
    }
    
    if (not collision_point(x, y+16, oSolid, 0, 0))
    {
        colLeft = collision_rectangle(x-16, y-16, x-8, y+16, oSolid, false, true);
        colRight = collision_rectangle(x+8, y-16, x+16, y+16, oSolid, false, true);
        if (colLeft and not colRight) x += 1;
        else if (colRight and not colLeft) x -= 1;
    }
    
    image_speed = abs(xVel) / 5;
    
    if (xVel < 0)
    {
        sprite_index = sBoulderRotateL;
    }
    else if (xVel > 0)
    {
        sprite_index = sBoulderRotateR;
    }
    else
    {
        sprite_index = sBoulder;
    }

    /*
    if (xVel == 0 and yVel == 0)
    {
        instance_create(x, y, oBoulderStatic);
        instance_destroy();
    }
    */
}

/* */
/*  */
