//
// scrPlayerIsDucking()
//
// Is the player ducking or what?!
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

if (sprite_index == sDuckLeft or
    sprite_index == sCrawlLeft or
    sprite_index == sDamselDuckL or
    sprite_index == sDamselCrawlL or
    sprite_index == sTunnelDuckL or
    sprite_index == sTunnelCrawlL)
{
    return true;
}
else return false;
