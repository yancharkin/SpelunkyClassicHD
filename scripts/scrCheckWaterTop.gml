//
// scrCheckWaterTop()
//
// recursive function called in scrInitLevel() that checks for the surface of a
// pool of water or lava and sets the sprite accordingly
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

obj = instance_place(x-16, y, oWater);
if (instance_exists(obj))
{
    if (obj.sprite_index != sWaterTop and obj.sprite_index != sLavaTop)
    {
        with obj
        {
            if (type == "Lava") sprite_index = sLavaTop;
            else sprite_index = sWaterTop;
            scrCheckWaterTop();  
        }
    }
}
obj = instance_place(x+16, y, oWater);
if (instance_exists(obj))
{
    if (obj.sprite_index != sWaterTop and obj.sprite_index != sLavaTop)
    {
        with obj
        {
            if (type == "Lava") sprite_index = sLavaTop;
            else sprite_index = sWaterTop;
            scrCheckWaterTop();  
        }
    }
}
