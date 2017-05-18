//
// scrFireBow()
//
// Fire the bow.  Must be called by oPlayer1.
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

if (holdItem)
{
    if (holdItem.type == "Bow")
    {
        if (facing == LEFT)
        {
            if (collision_point(x-14, y, oSolid, 0, 0)) obj = instance_create(x, y, oArrow);
            else obj = instance_create(x-14, y, oArrow);
            obj.xVel = xVel - 1 - bowStrength;
            if (obj.xVel >= -1) obj.xVel = -1;
            obj.yVel = 0;
            obj.direction = 180;
            obj.safe = true;
            obj.alarm[2] = 10;
            playSound(global.sndArrowTrap);
            firing = 10;
        }
        else if (facing == RIGHT)
        {
            if (collision_point(x+14, y, oSolid, 0, 0)) obj = instance_create(x, y, oArrow);
            else obj = instance_create(x+14, y, oArrow);
            obj.xVel = xVel + 1 + bowStrength;
            if (obj.xVel < 1) obj.xVel = 1;
            obj.yVel = 0;
            obj.direction = 0;
            obj.safe = true;
            obj.alarm[2] = 10;
            playSound(global.sndArrowTrap);
            firing = 10;
        }
        if (holdArrow == ARROW_BOMB)
        {
            obj.sprite_index = sBombArrowRight;
            obj.alarm[1] = bombArrowCounter;
            bombArrowCounter = 80;
        }
        
        holdArrow = 0;
        global.arrows -= 1;
        
        if (sprite_index == sDuckLeft or sprite_index == sDamselDuckL)
        {
            obj.y += 4;
        }
    
        bowArmed = false;
        bowStrength = 0;
        if (SS_IsSoundPlaying(global.sndBowPull)) SS_StopSound(global.sndBowPull);
    }
}
