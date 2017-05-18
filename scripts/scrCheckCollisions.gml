//
// scrCheckCollisions()
//
// Generic collision adjustments made by enemies.
//

/**********************************************************************************
    Copyright (c) 2008, 2009 Derek Yu and Mossmouth, LLC
    
    This file is part of Spelunky.

    You can redistribute and/or modify Spelunky, including its source code, under
    the terms of the Spelunky User License.

    Spelunky is distributed in the hope that it will be entertaining and useful,
    but WITHOUT WARRANTY.  Please see the Spelunky User License for more details.

    The Spelunky User License should be available in "Game Information", which
    can be found in the Resource Explorer, or as an external file called COPYING.
    If not, please obtain a new copy of Spelunky from <http://spelunkyworld.com/>
    
***********************************************************************************/

setCollisionBounds(2, 6, 14, 16);

if (colLeft and not colRight)
{
    x += 1;
}
else if (colRight)
{
    x -= 1;
}

if (colLeft or colRight)
{
    xVel = -xVel * 0.5;
}

if (colTop and not colBot)
{
    y += 1;
}
else if (colBot)
{
    // bounce
    if (yVel > 1) yVel = -yVel * 0.5;
    else if (abs(yVel) < 1) yVel = 0;
        
    // friction
    if (abs(xVel) < 0.1) xVel = 0;
    else if (abs(xVel) != 0) xVel *= 0.3;
}
