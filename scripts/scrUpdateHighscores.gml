//
// scrUpdateHighscores(type)
//
// type: 0 = game over, 1 = win, 2 = minigame
//
// Update "highscores".  Spelunky uses Game Maker's built-in highscore system to
// keep track of various data.  To ensure that each value is added to the right
// slot, we add a high number (some multiple of a million) to the value.
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


if (global.keepScore)
{
    ini_open("spelunky.ini")
    
    // retrieve highscore values from highscore list
    tMoney   = ini_read_real("highscore","value1",0);
    tTime    = ini_read_real("highscore","value2",0);
    tKills   = ini_read_real("highscore","value3",0);
    tSaves   = ini_read_real("highscore","value4",0);
    tPlays   = ini_read_real("highscore","value5",0);
    tWins    = ini_read_real("highscore","value6",0);
    tDeaths  = ini_read_real("highscore","value7",0);
    tTunnel1 = ini_read_real("highscore","value8",0);
    tTunnel2 = ini_read_real("highscore","value9",0);
    tMini1   = floor(ini_read_real("highscore","value10",0) / 10000);
    tMini2   = floor((ini_read_real("highscore","value10",0)-(tMini1*10000)) / 100);
    tMini3   = floor(ini_read_real("highscore","value10",0)-(tMini1*10000)-(tMini2*100));
        
    if (global.money > tMoney)
    {
        highscore_add2(1,"MONEY", max(0,real(global.money)))

        global.newMoney = true;
    }
    else
    {
        highscore_add2(1,"MONEY", max(0,real(tMoney)))
    }
    
    // convert time from 1000/sec to sec to prevent overflow
    global.time = floor(global.time / 1000);
    
    if (argument0 == 1 and (global.time < tTime or tTime == 0) and not global.usedShortcut)
    {
        highscore_add2(2,"TIME", global.time);
        global.newTime = true;
    }
    else highscore_add2(2,"TIME", tTime);
        
    if (global.kills > tKills)
    {
        highscore_add2(3,"KILLS", global.kills);
        global.newKills = true;
    }
    else highscore_add2(3,"KILLS", tKills);
        
    if (global.damsels > tSaves)
    {
        highscore_add2(4,"SAVES", global.damsels);
        global.newSaves = true;
    }
    else highscore_add2(4,"SAVES", tSaves);
        
    if (argument0 == 2) highscore_add2(5,"PLAYS", tPlays);
    else highscore_add2(5,"PLAYS", tPlays + 1);
    
    if (argument0 == 1)
    {
        highscore_add2(6,"WINS", tWins + 1);
        highscore_add2(7,"DEATHS", tDeaths);
    }
    else if (argument0 == 2)
    {
        highscore_add2(6,"WINS", tWins);
        highscore_add2(7,"DEATHS", tDeaths);
    }
    else
    {
        highscore_add2(6,"WINS", tWins);
        highscore_add2(7,"DEATHS", tDeaths + 1);
    }
    
    highscore_add2(8,"TUNNEL1", global.tunnel1);
    
    highscore_add2(9,"TUNNEL2", global.tunnel2);
    
    if (global.mini1 > tMini1)
    {
        tMini1 = global.mini1;
        with oSunRoom { highscore = true; }
    }
    if (global.mini2 > tMini2)
    {
        tMini2 = global.mini2;
        with oMoonRoom { highscore = true; }
    }
    if (global.mini3 > tMini3)
    {
        tMini3 = global.mini3;
        with oStarsRoom { highscore = true; }
    }
    
    highscore_add2(10,"MINIGAMES", (tMini1*10000)+(tMini2*100)+tMini3);
    
    ini_close()
}
