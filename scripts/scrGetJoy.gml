//
// scrGetJoy(key)
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

switch (argument0)
{
    case 1: { return "B1"; break; }
    case 2: { return "B2"; break; }
    case 3: { return "B3"; break; }
    case 4: { return "B4"; break; }
    case 5: { return "B5"; break; }
    case 6: { return "B6"; break; }
    case 7: { return "B7"; break; }
    case 8: { return "B8"; break; }
    case 9: { return "B9"; break; }
    default: { return "B" + string(argument0); break; }
}
