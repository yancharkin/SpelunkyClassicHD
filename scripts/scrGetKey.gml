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
    case vk_up: { return "UP ARR" break; }
    case vk_down: { return "DOWN ARR" break; }
    case vk_left: { return "LEFT ARR" break; }
    case vk_right: { return "RIGHT ARR" break; }
    case vk_shift: { return "SHIFT" break; }
    case vk_control: { return "CTRL" break; }
    case vk_alt: { return "ALT" break; }
    case vk_space: { return "SPACE" break; }
    case vk_enter: { return "ENTER" break; }
    case ord("A"): { return "A" break; }
    case ord("B"): { return "B" break; }
    case ord("C"): { return "C" break; }
    case ord("D"): { return "D" break; }
    case ord("E"): { return "E" break; }
    case ord("F"): { return "F" break; }
    case ord("G"): { return "G" break; }
    case ord("H"): { return "H" break; }
    case ord("I"): { return "I" break; }
    case ord("J"): { return "J" break; }
    case ord("K"): { return "K" break; }
    case ord("L"): { return "L" break; }
    case ord("M"): { return "M" break; }
    case ord("N"): { return "N" break; }
    case ord("O"): { return "O" break; }
    case ord("P"): { return "P" break; }
    case ord("Q"): { return "Q" break; }
    case ord("R"): { return "R" break; }
    case ord("S"): { return "S" break; }
    case ord("T"): { return "T" break; }
    case ord("U"): { return "U" break; }
    case ord("V"): { return "V" break; }
    case ord("W"): { return "W" break; }
    case ord("X"): { return "X" break; }
    case ord("Y"): { return "Y" break; }
    case ord("Z"): { return "Z" break; }
    default: { return "KEY " + string(argument0); break; }
}
