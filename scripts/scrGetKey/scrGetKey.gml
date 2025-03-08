function scrGetKey(argument0) {
	//
	// scrGetKey(key)
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
	    case vk_up: { return tr("UP ARR"); }
	    case vk_down: { return tr("DOWN ARR"); }
	    case vk_left: { return tr("LEFT ARR"); }
	    case vk_right: { return tr("RIGHT ARR"); }
	    case vk_shift: { return "SHIFT"; }
	    case vk_control: { return "CTRL"; }
	    case vk_alt: { return "ALT"; }
	    case vk_space: { return "SPACE"; }
	    case global.keyEnter: { return "ENTER"; }
	    case ord("A"): { return "A"; }
	    case ord("B"): { return "B"; }
	    case ord("C"): { return "C"; }
	    case ord("D"): { return "D"; }
	    case ord("E"): { return "E"; }
	    case ord("F"): { return "F"; }
	    case ord("G"): { return "G"; }
	    case ord("H"): { return "H"; }
	    case ord("I"): { return "I"; }
	    case ord("J"): { return "J"; }
	    case ord("K"): { return "K"; }
	    case ord("L"): { return "L"; }
	    case ord("M"): { return "M"; }
	    case ord("N"): { return "N"; }
	    case ord("O"): { return "O"; }
	    case ord("P"): { return "P"; }
	    case ord("Q"): { return "Q"; }
	    case ord("R"): { return "R"; }
	    case ord("S"): { return "S"; }
	    case ord("T"): { return "T"; }
	    case ord("U"): { return "U"; }
	    case ord("V"): { return "V"; }
	    case ord("W"): { return "W"; }
	    case ord("X"): { return "X"; }
	    case ord("Y"): { return "Y"; }
	    case ord("Z"): { return "Z"; }
	    default: { return string_upper(string(argument0));; }
	}
}
