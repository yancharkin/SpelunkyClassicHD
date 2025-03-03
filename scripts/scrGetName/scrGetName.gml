function scrGetName() {
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
	    case 1: { return tr("AHKMED"); }
	    case 2: { return tr("TERRY"); }
	    case 3: { return tr("SMITHY"); }
	    case 4: { return tr("LEON"); }
	    case 5: { return tr("ALI"); }
	    case 6: { return tr("ELBERT"); }
	    case 7: { return tr("KAO"); }
	    case 8: { return tr("DUKE"); }
	    case 9: { return tr("TONY"); }
	    case 10: { return tr("GUERT"); }
	    case 11: { return tr("PANCHO"); }
	    case 12: { return tr("EARL"); }
	    case 13: { return tr("IVAN"); }
	    case 14: { return tr("OLLIE"); }
	    case 15: { return tr("SPOONY"); }
	    case 16: { return tr("BOB"); }
	    case 17: { return tr("RUDY"); }
	    case 18: { return tr("JIMBO"); }
	    case 19: { return tr("TOR"); }
	    case 20: { return tr("WILLY"); }
	    case 21: { return tr("HAMISH"); }
	    case 22: { return tr("LAZLO"); }
	    case 23: { return tr("WANG"); }
	    case 24: { return tr("HERBIE"); }
	    case 25: { return tr("ANDY"); }
	    case 26: { return tr("DONG"); }
	    case 27: { return tr("LEMMY"); }
	    case 28: { return tr("BARNEY"); }
	    case 29: { return tr("LOU"); }
	    case 30: { return tr("TARN"); }
	    case 31: { return tr("SLASH"); }
	    case 32: { return tr("BROM"); }
	}

	//return tr("AHKMED");



}
