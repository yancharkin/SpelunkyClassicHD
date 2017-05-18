//
// scrGetChar(key)
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
    case vk_space: { return " "; }
    case ord("1"): { if (keyboard_check(vk_shift)) return "!"; else return "1"; }
    case ord("2"): { if (keyboard_check(vk_shift)) return "@"; else return "2"; }
    case ord("3"): { if (keyboard_check(vk_shift)) return ""; else return "3"; }
    case ord("4"): { if (keyboard_check(vk_shift)) return "$"; else return "4"; }
    case ord("5"): { if (keyboard_check(vk_shift)) return "%"; else return "5"; }
    case ord("6"): { if (keyboard_check(vk_shift)) return ""; else return "6"; }
    case ord("7"): { if (keyboard_check(vk_shift)) return "&"; else return "7"; }
    case ord("8"): { if (keyboard_check(vk_shift)) return ""; else return "8"; }
    case ord("9"): { if (keyboard_check(vk_shift)) return "("; else return "9"; }
    case ord("0"): { if (keyboard_check(vk_shift)) return ")"; else return "0"; }
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
    case 190: { return "."; }
    case 191: { return "?"; }
    default: { return ""; }
}
