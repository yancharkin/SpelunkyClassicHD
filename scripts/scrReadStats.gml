//
// scrReadStats()
//
// Read the stats file if it exists.
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

global.gameStart = false;
global.totalCrates = 0;
global.totalChests = 0;
global.idolsGrabbed = 0;
global.idolsConverted = 0;
global.damselsGrabbed = 0;
global.kissesBought = 0;
global.damselsBought = 0;
global.damselsSavedTotal = 0;
global.damselsKilledTotal = 0;
global.itemsBought = 0;
global.itemsStolen = 0;
global.diceGamesPlayed = 0;
global.diceGamesWon = 0;
global.diceGamesLost = 0;

for (i = 0; i < 16; i += 1)
{
    global.levelDeaths[i] = 0;
}

for (i = 0; i < 24; i += 1)
{
    global.enemyDeaths[i] = 0;
}

for (i = 0; i < 12; i += 1)
{
    global.miscDeaths[i] = 0;
}

for (i = 0; i < 22; i += 1)
{
    global.enemyKills[i] = 0;
}

global.totalMonkeyKills = 0;

file = file_text_open_read("stats.txt");

if (file)
{
    file_text_readln(file);
    file_text_readln(file);
    file_text_readln(file);
    file_text_readln(file);
    str = file_text_read_string(file);
    str = string_delete(str, 1, 20);
    global.totalCrates = real(str);
    file_text_readln(file);
    str = file_text_read_string(file);
    str = string_delete(str, 1, 20);
    global.totalChests = real(str);
    file_text_readln(file);
    file_text_readln(file);
    str = file_text_read_string(file);
    str = string_delete(str, 1, 20);
    global.idolsGrabbed = real(str);
    file_text_readln(file);
    str = file_text_read_string(file);
    str = string_delete(str, 1, 20);
    global.idolsConverted = real(str);
    file_text_readln(file);
    file_text_readln(file);
    str = file_text_read_string(file);
    str = string_delete(str, 1, 20);
    global.damselsGrabbed = real(str);
    file_text_readln(file);
    str = file_text_read_string(file);
    str = string_delete(str, 1, 20);
    global.kissesBought = real(str);
    file_text_readln(file);
    str = file_text_read_string(file);
    str = string_delete(str, 1, 20);
    global.damselsBought = real(str);
    file_text_readln(file);
    str = file_text_read_string(file);
    str = string_delete(str, 1, 20);
    global.damselsSavedTotal = real(str);
    file_text_readln(file);
    str = file_text_read_string(file);
    str = string_delete(str, 1, 20);
    global.damselsKilledTotal = real(str);
    file_text_readln(file);
    file_text_readln(file);
    str = file_text_read_string(file);
    str = string_delete(str, 1, 20);
    global.itemsBought = real(str);
    file_text_readln(file);
    str = file_text_read_string(file);
    str = string_delete(str, 1, 20);
    global.itemsStolen = real(str);
    file_text_readln(file);
    file_text_readln(file);
    str = file_text_read_string(file);
    str = string_delete(str, 1, 20);
    global.diceGamesPlayed = real(str);
    file_text_readln(file);
    str = file_text_read_string(file);
    str = string_delete(str, 1, 20);
    global.diceGamesWon = real(str);
    file_text_readln(file);
    str = file_text_read_string(file);
    str = string_delete(str, 1, 20);
    global.diceGamesLost = real(str);
    file_text_readln(file);
    
    file_text_readln(file);
    file_text_readln(file);
    str = file_text_read_string(file);
    for (i = 0; i < 16; i += 1)
    {
        file_text_readln(file);
        str = file_text_read_string(file);
        str = string_delete(str, 1, 14);
        global.levelDeaths[i] = real(str);
    }
    file_text_readln(file);
    file_text_readln(file);
    file_text_readln(file);
    
    file_text_readln(file);
    file_text_readln(file);
    for (i = 0; i < 24; i += 1)
    {
        file_text_readln(file);
        str = file_text_read_string(file);
        str = string_delete(str, 1, 14);
        global.enemyDeaths[i] = real(str);
    }
    file_text_readln(file);
    
    file_text_readln(file);
    file_text_readln(file);
    for (i = 0; i < 12; i += 1)
    {
        file_text_readln(file);
        str = file_text_read_string(file);
        str = string_delete(str, 1, 14);
        global.miscDeaths[i] = real(str);
    }
    file_text_readln(file);
    
    file_text_readln(file);
    file_text_readln(file);
    for (i = 0; i < 22; i += 1)
    {
        file_text_readln(file);
        str = file_text_read_string(file);
        str = string_delete(str, 1, 14);
        global.enemyKills[i] = real(str);
        if (i == 8)
        {
            file_text_readln(file);
            str = file_text_read_string(file);
            str = string_delete(str, 1, 14);
            global.totalMonkeyKills = real(str);
        }
    }
    file_text_readln(file);
    
    file_text_close(file);
}
