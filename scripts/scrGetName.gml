//
// scrGetName()
//
// Return a random name (for shopkeeper).
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

n = round(random_range(1,32));
switch(n)
{
    case 1: { return global.Ahkmed; }
    case 2: { return global.Terry; }
    case 3: { return global.Smithy; }
    case 4: { return global.Leon; }
    case 5: { return global.Ali; }
    case 6: { return global.Elbert; }
    case 7: { return global.Kao; }
    case 8: { return global.Duke; }
    case 9: { return global.Tony; }
    case 10: { return global.Guert; }
    case 11: { return global.Pancho; }
    case 12: { return global.Earl; }
    case 13: { return global.Ivan; }
    case 14: { return global.Ollie; }
    case 15: { return global.Spoony; }
    case 16: { return global.Bob; }
    case 17: { return global.Rudy; }
    case 18: { return global.Jimbo; }
    case 19: { return global.Tor; }
    case 20: { return global.Willy; }
    case 21: { return global.Hamish; }
    case 22: { return global.Lazlo; }
    case 23: { return global.Wang; }
    case 24: { return global.Herbie; }
    case 25: { return global.Andy; }
    case 26: { return global.Dong; }
    case 27: { return global.Lemmy; }
    case 28: { return global.Barney; }
    case 29: { return global.Lou; }
    case 30: { return global.Tarn; }
    case 31: { return global.Slash; }
    case 32: { return global.Brom; }
}

//return global.Ahkmed;
