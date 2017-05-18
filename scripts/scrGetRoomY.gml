//
// scrGetRoomY(y)
//
// Returns the vertical room number of a room given the y-coord.
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

ty = argument0;

if (ty < 128+16) return 0;
else if (ty >= 128+16 and ty < 256+16) return 1;
else if (ty >= 256+16 and ty < 384+16) return 2;
else if (ty >= 384+16 and ty < 512+16) return 3;
else if (ty >= 512+16) return 4;

return -1;
