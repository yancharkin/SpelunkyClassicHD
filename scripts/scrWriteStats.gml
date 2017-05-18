//
// scrWriteStats()
//
// Write out a stat file.
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

file_delete("stats.txt");
file = file_text_open_write("stats.txt");

file_text_write_string(file, "+---------------------------+");
file_text_writeln(file);
file_text_write_string(file, "|  SPELUNKY EXTENDED STATS  |");
file_text_writeln(file);
file_text_write_string(file, "+---------------------------+");
file_text_writeln(file);
file_text_writeln(file);

file_text_write_string(file, "CRATES OPENED:      ");
file_text_write_string(file, string(global.totalCrates));
file_text_writeln(file);
file_text_write_string(file, "CHESTS OPENED:      ");
file_text_write_string(file, string(global.totalChests));
file_text_writeln(file);
file_text_writeln(file);
file_text_write_string(file, "IDOLS GRABBED:      ");
file_text_write_string(file, string(global.idolsGrabbed));
file_text_writeln(file);
file_text_write_string(file, "IDOLS CONVERTED:    ");
file_text_write_string(file, string(global.idolsConverted));
file_text_writeln(file);
file_text_writeln(file);
file_text_write_string(file, "DAMSELS GRABBED:    ");
file_text_write_string(file, string(global.damselsGrabbed));
file_text_writeln(file);
file_text_write_string(file, "KISSES BOUGHT:      ");
file_text_write_string(file, string(global.kissesBought));
file_text_writeln(file);
file_text_write_string(file, "DAMSELS BOUGHT:     ");
file_text_write_string(file, string(global.damselsBought));
file_text_writeln(file);
file_text_write_string(file, "DAMSELS SAVED:      ");
file_text_write_string(file, string(global.damselsSavedTotal));
file_text_writeln(file);
file_text_write_string(file, "DAMSELS KILLED:     ");
file_text_write_string(file, string(global.damselsKilledTotal));
file_text_writeln(file);
file_text_writeln(file);
file_text_write_string(file, "ITEMS BOUGHT:       ");
file_text_write_string(file, string(global.itemsBought));
file_text_writeln(file);
file_text_write_string(file, "ITEMS STOLEN:       ");
file_text_write_string(file, string(global.itemsStolen));
file_text_writeln(file);
file_text_writeln(file);
file_text_write_string(file, "DICE GAMES PLAYED:  ");
file_text_write_string(file, string(global.diceGamesPlayed));
file_text_writeln(file);
file_text_write_string(file, "DICE GAMES WON:     ");
file_text_write_string(file, string(global.diceGamesWon));
file_text_writeln(file);
file_text_write_string(file, "DICE GAMES LOST:    ");
file_text_write_string(file, string(global.diceGamesLost));
file_text_writeln(file);
file_text_writeln(file);

file_text_write_string(file, "LEVEL        DEATHS");
file_text_writeln(file);
file_text_write_string(file, "------------+------------");
file_text_writeln(file);

totalDeaths = 0;
for (i = 0; i < 16; i += 1)
{
    if (i+1 < 10) file_text_write_string(file, " " + string(i+1) + "          | ");
    else file_text_write_string(file, " " + string(i+1) + "         | ");
    totalDeaths += global.levelDeaths[i];
    file_text_write_string(file, string(global.levelDeaths[i]));
    file_text_writeln(file);
}

file_text_write_string(file, string("------------+------------"));
file_text_writeln(file);
file_text_write_string(file, string(" TOTAL      | "));
file_text_write_string(file, string(totalDeaths));
file_text_writeln(file);
file_text_writeln(file);

file_text_write_string(file, "ENEMY        DEATHS");
file_text_writeln(file);
file_text_write_string(file, "------------+------------");
file_text_writeln(file);

for (i = 0; i < 24; i += 1)
{
    if (global.enemyDeaths[i] == 0) file_text_write_string(file, " ???        | ");
    else {
    switch (i)
    {
        case 0: { file_text_write_string(file, " BAT        | "); break; }
        case 1: { file_text_write_string(file, " SNAKE      | "); break; }
        case 2: { file_text_write_string(file, " SPIDER     | "); break; }
        case 3: { file_text_write_string(file, " G. SPIDER  | "); break; }
        case 4: { file_text_write_string(file, " CAVEMAN    | "); break; }
        case 5: { file_text_write_string(file, " SKELETON   | "); break; }
        case 6: { file_text_write_string(file, " ZOMBIE     | "); break; }
        case 7: { file_text_write_string(file, " VAMPIRE    | "); break; }
        case 8: { file_text_write_string(file, " FROG       | "); break; }
        case 9: { file_text_write_string(file, " FIRE FROG  | "); break; }
        case 10: { file_text_write_string(file, " MANTRAP    | "); break; }
        case 11: { file_text_write_string(file, " PIRANHA    | "); break; }
        case 12: { file_text_write_string(file, " MEGAMOUTH  | "); break; }
        case 13: { file_text_write_string(file, " YETI       | "); break; }
        case 14: { file_text_write_string(file, " YETI KING  | "); break; }
        case 15: { file_text_write_string(file, " ALIEN      | "); break; }
        case 16: { file_text_write_string(file, " UFO        | "); break; }
        case 17: { file_text_write_string(file, " ALIEN BOSS | "); break; }
        case 18: { file_text_write_string(file, " HAWKMAN    | "); break; }
        case 19: { file_text_write_string(file, " SHOPKEEPER | "); break; }
        case 20: { file_text_write_string(file, " TOMB LORD  | "); break; }
        case 21: { file_text_write_string(file, " MAGMA MAN  | "); break; }
        case 22: { file_text_write_string(file, " OLMEC      | "); break; }
        case 23: { file_text_write_string(file, " GHOST      | "); break; }
    }}
    file_text_write_string(file, string(global.enemyDeaths[i]));
    file_text_writeln(file);
}
file_text_writeln(file);

file_text_write_string(file, "MISC         DEATHS");
file_text_writeln(file);
file_text_write_string(file, "------------+------------");
file_text_writeln(file);

for (i = 0; i < 12; i += 1)
{
    if (global.miscDeaths[i] == 0) file_text_write_string(file, " ???        | ");
    else {
    switch (i)
    {
        case 0: { file_text_write_string(file, " ROCK       | "); break; }
        case 1: { file_text_write_string(file, " EXPLOSION  | "); break; }
        case 2: { file_text_write_string(file, " CRUSHED    | "); break; }
        case 3: { file_text_write_string(file, " LONG FALL  | "); break; }
        case 4: { file_text_write_string(file, " SPIKES     | "); break; }
        case 5: { file_text_write_string(file, " BOULDER    | "); break; }
        case 6: { file_text_write_string(file, " ARROW TRAP | "); break; }
        case 7: { file_text_write_string(file, " SPEAR TRAP | "); break; }
        case 8: { file_text_write_string(file, " SMASH TRAP | "); break; }
        case 9: { file_text_write_string(file, " CEILING T. | "); break; }
        case 10: { file_text_write_string(file, " PIT        | "); break; }
        case 11: { file_text_write_string(file, " LAVA       | "); break; }
    }}
    file_text_write_string(file, string(global.miscDeaths[i]));
    file_text_writeln(file);
}
file_text_writeln(file);

file_text_write_string(file, "ENEMY        KILLS");
file_text_writeln(file);
file_text_write_string(file, "------------+------------");
file_text_writeln(file);

totalKills = 0;
for (i = 0; i < 22; i += 1)
{
    if (global.enemyKills[i] == 0) file_text_write_string(file, " ???        | ");
    else {
    switch (i)
    {
        case 0: { file_text_write_string(file, " BAT        | "); break; }
        case 1: { file_text_write_string(file, " SNAKE      | "); break; }
        case 2: { file_text_write_string(file, " SPIDER     | "); break; }
        case 3: { file_text_write_string(file, " G. SPIDER  | "); break; }
        case 4: { file_text_write_string(file, " CAVEMAN    | "); break; }
        case 5: { file_text_write_string(file, " SKELETON   | "); break; }
        case 6: { file_text_write_string(file, " ZOMBIE     | "); break; }
        case 7: { file_text_write_string(file, " VAMPIRE    | "); break; }
        case 8: { file_text_write_string(file, " FROG       | "); break; }
        case 9: { file_text_write_string(file, " FIRE FROG  | "); break; }
        case 10: { file_text_write_string(file, " MANTRAP    | "); break; }
        case 11: { file_text_write_string(file, " PIRANHA    | "); break; }
        case 12: { file_text_write_string(file, " MEGAMOUTH  | "); break; }
        case 13: { file_text_write_string(file, " YETI       | "); break; }
        case 14: { file_text_write_string(file, " YETI KING  | "); break; }
        case 15: { file_text_write_string(file, " ALIEN      | "); break; }
        case 16: { file_text_write_string(file, " UFO        | "); break; }
        case 17: { file_text_write_string(file, " ALIEN BOSS | "); break; }
        case 18: { file_text_write_string(file, " HAWKMAN    | "); break; }
        case 19: { file_text_write_string(file, " SHOPKEEPER | "); break; }
        case 20: { file_text_write_string(file, " TOMB LORD  | "); break; }
        case 21: { file_text_write_string(file, " OLMEC      | "); break; }
    }}
    totalKills += global.enemyKills[i];
    file_text_write_string(file, string(global.enemyKills[i]));
    file_text_writeln(file);
    
    if (i == 8)
    {
        if (global.totalMonkeyKills == 0) file_text_write_string(file, " ???        | ");
        else
        {
            file_text_write_string(file, " MONKEY     | ");
        }
        totalKills += global.totalMonkeyKills;
        file_text_write_string(file, string(global.totalMonkeyKills));
        file_text_writeln(file);
    }
}

file_text_write_string(file, string("------------+------------"));
file_text_writeln(file);
file_text_write_string(file, string(" TOTAL      | "));
file_text_write_string(file, string(totalKills));
file_text_writeln(file);

file_text_close(file);
