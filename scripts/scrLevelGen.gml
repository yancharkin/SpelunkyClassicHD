//
// scrLevelGen()
//
// Sets the "room path" that Spelunky uses to determine the no-bombs/no-rope (in theory)
// route to the exit.
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

//DFK start room X is hard coded to 0 because I'm lazy
//global.startRoomX = rand(0,3);
global.startRoomX = 0;
global.startRoomY = 0;
roomX = global.startRoomX;
roomY = 0;
prevX = global.startRoomX;
prevY = 0;
global.roomPath[roomX, roomY] = 1;
noStartX = -1;
n = rand(0,3);

global.sacrificePit = false;
global.snakePit = false;
global.alienCraft = false;
global.yetiLair = false;

// Black Market
global.blackMarket = false;
//if (global.levelType == 1)

if (global.levelType == 1 and not global.madeBlackMarket and global.genBlackMarket)
{
    global.blackMarket = true;
    global.startRoomX = 0;
    global.startRoomY = 0;
    global.endRoomX = 3;
    global.endRoomY = 3;
    global.roomPath[0, 0] = 2;
    global.roomPath[0, 1] = 2;
    global.roomPath[0, 2] = 2;
    global.roomPath[0, 3] = 3;
    global.roomPath[1, 0] = 4;
    global.roomPath[1, 1] = 4;
    global.roomPath[1, 2] = 4;
    global.roomPath[1, 3] = 1;
    global.roomPath[2, 0] = 4;
    global.roomPath[2, 1] = 4;
    global.roomPath[2, 2] = 5;
    global.roomPath[2, 3] = 1;
    global.roomPath[3, 0] = 2;
    global.roomPath[3, 1] = 2;
    global.roomPath[3, 2] = 4;
    global.roomPath[3, 3] = 3;
    global.madeBlackMarket = true;
    return 0;
}

if (global.levelType == 3 and rand(1,global.probSacPit) == 1)
{
    while (n == roomX)
    {
        n = rand(0,3);
    }
    
    for (i = 0; i < 4; i += 1)
    {
        if (i == 0) global.roomPath[n, i] = 7;
        else if (i == 3) global.roomPath[n, i] = 9;
        else global.roomPath[n, i] = 8;
    }
    global.sacrificePit = true;
    oGame.idol = true;
    oGame.damsel = true;
}

while (roomY < 4)
{
    d = false;
    if (roomX == 0) n = rand(3,5) // right
    else if (roomX == 3) n = rand(5,7) // left
    else n = rand(1,5);
    
    if (n < 3 or n > 5) // move left
    {
        if (roomX > 0)
            if (global.roomPath[roomX-1, roomY] == 0) roomX -= 1;
        else if (roomX < 3)
            if (global.roomPath[roomX+1, roomY] == 0) roomX += 1;
        else n = 5;
    }
    else if (n == 3 or n == 4) // move right
    {
        if (roomX < 3)
            if (global.roomPath[roomX+1, roomY] == 0) roomX += 1;
        else if (roomX > 0)
            if (global.roomPath[roomX-1, roomY] == 0) roomX -= 1;
        else n = 5;
    }
    
    if (n == 5) // move down
    {
        roomY += 1;
        d = true;
        if (roomY < 4)
        {
            global.roomPath[prevX, prevY] = 2;
            global.roomPath[roomX, roomY] = 3;
            d = true;
        }
        else
        {
            global.endRoomX = roomX;
            global.endRoomY = roomY-1;
        }
    }
    
    if (not d) global.roomPath[roomX, roomY] = 1;
    prevX = roomX;
    prevY = roomY;
}

// City of Gold
if (global.cityOfGold) global.roomPath[rand(0,3), 2] = 6;

// snake pit
sX1 = 0;
sX2 = 0;
// global.probSnakePit = 1;
if (global.levelType == 0)
{
    for (j = 0; j < 2; j += 1)
    {
        for (i = 0; i < 4; i += 1)
        {
            if (global.roomPath[i,j] == 0 and global.roomPath[i,j+1] == 0 and global.roomPath[i,j+2] == 0 and rand(1,global.probSnakePit) == 1)
            {
                global.roomPath[i,j] = 7; // top of pit
                if (true)
                {
                    if (global.roomPath[i,j+2] == 0)
                    {
                        global.roomPath[i,j+1] = 8;
                        if (j == 0)
                        {
                            if (global.roomPath[i,j+3] == 0)
                            {
                                global.roomPath[i,j+2] = 8; // middle of pit
                                global.roomPath[i,j+3] = 9; // bottom of pit
                            }
                            else
                            {
                                global.roomPath[i,j+2] = 9;
                            }
                        }
                        else
                        {
                            global.roomPath[i,j+2] = 9;
                        }
                    }
                }
                else
                {
                    global.roomPath[i,j+1] = 9;
                }
                global.snakePit = true;
                i = 99;
                j = 99;
                break;
            }
        }
    }
}

global.roomPath[0,4] = 0;
global.roomPath[1,4] = 0;
global.roomPath[2,4] = 0;
global.roomPath[3,4] = 0;

//  Lake
//global.lake = false;
if (global.lake)
{
    global.roomPath[0,3] = 8;
    global.roomPath[1,3] = 8;
    global.roomPath[2,3] = 8;
    global.roomPath[3,3] = 8;
    global.roomPath[0,4] = 7;
    global.roomPath[1,4] = 7;
    global.roomPath[2,4] = 7;
    global.roomPath[3,4] = 7;
    n = rand(0,3);
    while (n == global.endRoomX)
    {
        n = rand(0,3);
    }
    global.roomPath[n,4] = 9;
}

// Moai
if (not global.madeMoai and global.levelType == 2)
{
    if (global.currLevel == 9 and rand(1,4) == 1) global.madeMoai = true;
    else if (global.currLevel == 10 and rand(1,3) == 1) global.madeMoai = true;
    else if (global.currLevel == 11 and rand(1,2) == 1) global.madeMoai = true;
    else if (global.currLevel == 12) global.madeMoai = true;
    
    if (global.madeMoai) global.roomPath[rand(0,3), rand(1,2)] = 6;
}
else if (global.levelType == 2 and rand(1,global.probAlien) == 1) // alien craft
{
    k = rand(0,2);
    j = rand(1,2);
    for (i = k; i < 4; i += 1)
    {
        if (i == k) global.roomPath[i,j] = 7;
        else if (i == 3) global.roomPath[i,j] = 9;
        else global.roomPath[i,j] = 8;
    }
    global.alienCraft = true;
}
else if (global.levelType == 2 and not global.alienCraft and rand(1,global.probYetiLair) == 1) // yeti
{
    global.yetiLair = true;
}

// shop
if (rand(1,global.currLevel) <= 2 and global.currLevel > 1 and not global.madeBlackMarket)
{
    i = 0;
    for (k = 0; k < 4; k += 1)
    {
    for (j = 0; j < 4; j += 1)
    {
        global.roomPoss[j,k] = 0;
        //j = rand(0,3);
        //k = rand(0,3);
        if (global.roomPath[j,k] == 0)
        {
            if (j < 3)
            {
                if (global.roomPath[j+1,k] == 1 or global.roomPath[j+1,k] == 2)
                {
                    //global.roomPath[j,k] = 4;
                    global.roomPoss[j,k] = 4;
                    i += 1;
                    //global.shop = true;
                    //break;
                }
            }
            else if (j > 0)
            {
                if (global.roomPath[j-1,k] == 1 or global.roomPath[j-1,k] == 2)
                {
                    //global.roomPath[j,k] = 5;
                    global.roomPoss[j,k] = 5;
                    i += 1;
                    //global.shop = true;
                    //break;
                }
            }
        }
    }}
    
    if (i > 0) {
    n = rand(0,i-1);
    for (k = 0; k < 4; k += 1)
    {
        for (j = 0; j < 4; j += 1)
        {
            if (global.roomPoss[j,k] != 0)
            {
                if (n == 0)
                {
                    global.roomPath[j,k] = global.roomPoss[j,k];
                    global.shop = true;
                    j = 4;
                    k = 4;
                    break;
                }
                else n -= 1;
            }
        }
    }}
}
