//
// scrRoomGen5()
//
// Room generation for the final boss level (which is only partially randomized).
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

/*
Note:

ROOMS are 10x8 tile areas.

strTemp = "0000000000
           0000000000
           0000000000
           0000000000
           0000000000
           0000000000
           0000000000
           0000000000";

OBSTACLES are 5x3 tile chunks that are randomized within rooms.
           
strObs = "00000
          00000
          00000";
          
The string representing a room or obstacle must be laid out unbroken:
*/
strTemp = "00000000000000000000000000000000000000000000000000000000000000000000000000000000";

roomPath = global.roomPath[scrGetRoomX(x), scrGetRoomY(y)];
if (y < 480)
{
    switch(rand(1,6))
    {
        case 1: { strTemp = "60000000000000000000000000000000000000000000000000600000000000000000000000000000"; break; }
        case 2: { strTemp = "00000600000000000000000000000000000000000000000000600000000000000000000000000000"; break; }
        case 3: { strTemp = "60000000000000000000000000000000000000000000000000000006000000000000000000000000"; break; }
        case 4: { strTemp = "60000600000000000000000000000000000000000000000000000000000000000000000000000000"; break; }
        case 5: { strTemp = "00000000000000000000000000000000000000000000000000600006000000000000000000000000"; break; }
        case 6: { strTemp = "00000000000000000000000000000000600000000000000000000000000000000000000000000000"; break; }
    }
}
else
{
    switch(rand(1,6))
    {
        case 1: { strTemp = "11111111111111111111111111111111111111111111111111111111111111111111111111111111"; break; }
        case 2: { strTemp = "11111111111222111111122211111111111111111111111111111111111111111111111111111111"; break; }
        case 3: { strTemp = "11111111111111111111111111111111122221111112222111111111111111111111111111111111"; break; }
        case 4: { strTemp = "11111111111111112221111111222111111111111111111111111111111111111111111111111111"; break; }
        case 5: { strTemp = "11111111111111111111111111111111111111111111111111122211111112221111111111111111"; break; }
        case 6: { strTemp = "11111111111111111111111111111111111111111111111111111111222111111122211111111111"; break; }
    }
}

// Add obstacles

for (i = 1; i < 81; i += 1)
{
    j = i;
  
    strObs1 = "00000";
    strObs2 = "00000";
    strObs3 = "00000";
    tile = string_char_at(strTemp, i);
    
    if (tile == "8")
    {
        switch(rand(1,1))
        {
            case 1: { strObs1 = "00900"; strObs2 = "21112"; strObs3 = "21112"; break; }
        }
    }
    else if (tile == "5") // ground
    {
        switch(rand(1,8))
        {
            case 1: { strObs1 = "00000"; strObs2 = "02220"; strObs3 = "21112"; break; }
            case 2: { strObs1 = "00000"; strObs2 = "02020"; strObs3 = "21212"; break; }
            case 3: { strObs1 = "11100"; strObs2 = "11110"; strObs3 = "11111"; break; }
            case 4: { strObs1 = "00111"; strObs2 = "01111"; strObs3 = "11111"; break; }
            case 5: { strObs1 = "21112"; strObs2 = "22222"; strObs3 = "00000"; break; }
            case 6: { strObs1 = "00022"; strObs2 = "00011"; strObs3 = "00011"; break; }
            case 7: { strObs1 = "22000"; strObs2 = "11000"; strObs3 = "11000"; break; }
            case 8: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "00000"; break; }
        }
    }
    else if (tile == "6") // air
    {
        switch(rand(1,8))
        {
            case 1: { strObs1 = "0TTT0"; strObs2 = "21112"; strObs3 = "02220"; break; }
            case 2: { strObs1 = "0000T"; strObs2 = "0TTT1"; strObs3 = "21111"; break; }
            case 3: { strObs1 = "T0000"; strObs2 = "1TTT0"; strObs3 = "11112"; break; }
            case 4: { strObs1 = "1TT00"; strObs2 = "11112"; strObs3 = "12200"; break; }
            case 5: { strObs1 = "0TTT1"; strObs2 = "21111"; strObs3 = "00221"; break; }
            case 6: { strObs1 = "21112"; strObs2 = "TTTTT"; strObs3 = "11111"; break; }
        }
    }
    
    if (tile == "5" or tile == "6" or tile == "8")
    {
        strTemp = string_delete(strTemp, j, 5);
        strTemp = string_insert(strObs1, strTemp, j);
        j += 10;
        strTemp = string_delete(strTemp, j, 5);
        strTemp = string_insert(strObs2, strTemp, j);
        j += 10;
        strTemp = string_delete(strTemp, j, 5);
        strTemp = string_insert(strObs3, strTemp, j);
    }
}

// Generate the tiles
for (j = 0; j < 8; j += 1)
{
    for (i = 1; i < 11; i += 1)
    {
        tile = string_char_at(strTemp, i+j*10);
        xpos = x + (i-1)*16;
        ypos = y + j*16;
        if (tile == "1" and not collision_point(xpos, ypos, oSolid, 0, 0))
        {
            if (rand(1,10) == 1) instance_create(xpos, ypos, oBlock);
            else
            {
                instance_create(xpos, ypos, oTemple);
            }
        }
        else if (tile == "2" and rand(1,2) == 1 and not collision_point(xpos, ypos, oSolid, 0, 0))
        {
            if (rand(1,10) == 1) instance_create(xpos, ypos, oBlock);
            else
            {
                instance_create(xpos, ypos, oTemple);
            }
        }
        else if (tile == "L") instance_create(xpos, ypos, oVine);
        else if (tile == "P") instance_create(xpos, ypos, oVineTop);
        else if (tile == "7" and rand(1,3) == 1) instance_create(xpos, ypos, oSpikes);
        else if (tile == "4" and rand(1,4) == 1) instance_create(xpos, ypos, oPushBlock);
        else if (tile == "9")
        {
            if (scrGetRoomX(x) == global.startRoomX and scrGetRoomY(y) == global.startRoomY)
                instance_create(xpos, ypos, oEntrance);
            else
            {
                instance_create(xpos, ypos, oExit);
                global.exitX = xpos;
                global.exitY = ypos;
            }
            block = instance_create(xpos, ypos+16, oTemple);
            block.invincible = true;
        }
        else if (tile == "a")
        {
            if (rand(1,1) == 1) instance_create(xpos+8, ypos+8, oChest);
        }
        else if (tile == "T")
        {
            if (rand(1,15) == 1) instance_create(xpos+8, ypos+8, oChest);
            else if (rand(1,6) == 1) instance_create(xpos+8, ypos+8, oGoldBars);
            else if (rand(1,6) == 1) instance_create(xpos+8, ypos+12, oEmeraldBig);
            else if (rand(1,8) == 1) instance_create(xpos+8, ypos+12, oSapphireBig);
            else if (rand(1,10) == 1) instance_create(xpos+8, ypos+12, oRubyBig);
            else if (rand(1,10) == 1) instance_create(xpos+8, ypos+8, oCrate);
            else if (rand(1,10) == 1) instance_create(xpos, ypos, oBlock);
            else
            {
                instance_create(xpos, ypos, oTemple);
            }
        }
        else if (tile == "t")
        {
            instance_create(xpos, ypos, oThwompTrap);
        }
        else if (tile == "I")
        {
            if (rand(1,1) == 1) instance_create(xpos+16, ypos, oGoldIdol);
        }
        else if (tile == "C")
        {
            instance_create(xpos, ypos, oCeilingTrap);
        }
        else if (tile == "D")
        {
            instance_create(xpos, ypos, oTempleFake);
            instance_create(xpos, ypos+16, oTempleFake);
            instance_create(xpos, ypos, oDoor);
        }
        else if (tile == "w")
        {
            instance_create(xpos, ypos, oWaterSwim);
        }
    }
}
