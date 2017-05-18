//
// scrGetRoomX(x)
//
// Returns the horizontal room number of a room given the x-coord.
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

tx = argument0;

if (tx < 160+16) return 0;
else if (tx >= 160+16 and tx < 320+16) return 1;
else if (tx >= 320+16 and tx < 480+16) return 2;
else if (tx >= 480+16) return 3;

return -1;
