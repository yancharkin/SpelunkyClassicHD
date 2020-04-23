//
// scrRoomGen2()
//
// Room generation for Area 2, the Lush Jungle.
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
roomPathAbove = -1;
if (scrGetRoomY(y) != 0) roomPathAbove = global.roomPath[scrGetRoomX(x), scrGetRoomY(y-128)];

if (scrGetRoomX(x) == global.startRoomX and scrGetRoomY(y) == global.startRoomY) // start room
{
    if (roomPath == 2) n = rand(3,4);
    else n = rand(1,2);
    switch(n)
    {
        case 1: { strTemp = "60000600000000000000000000000000000000000008000000000000000000000000001111111111"; break; }
        case 2: { strTemp = "11111111112222222222000000000000000000000008000000000000000000000000001111111111"; break; }
        // hole
        case 3: { strTemp = "60000600000000000000000000000000000000000008000000000000000000000000002021111120"; break; }
        case 4: { strTemp = "11111111112222222222000000000000000000000008000000000000000000000000002021111120"; break; }
    }
}
else if (scrGetRoomX(x) == global.endRoomX and scrGetRoomY(y) == global.endRoomY) // end room
{
    if (global.lake) n = rand(5,5);
    else if (roomPathAbove == 2) n = rand(1,2);
    else n = rand(3,4);
    switch(n)
    {
        case 1: { strTemp = "00000000000000000000000000000000000000000008000000000000000000000000001111111111"; break; }
        case 2: { strTemp = "00000000000011111100000000000000000000000008000000000000000000000000001111111111"; break; }
        case 3: { strTemp = "60000600000000000000000000000000000000000008000000000000000000000000001111111111"; break; }
        case 4: { strTemp = "11111111112222222222000000000000000000000008000000000000000000000000001111111111"; break; }
        case 5: { strTemp = "000000000000000900000221111220wwvvvvvvwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"; break; }
    }
}
else if (roomPath == 0 and rand(1,3) <= 2) // side room
{
    if (not oGame.altar and rand(1,12) == 1)
    {
        n = 10;
        oGame.altar = true;
    }
    else if (oGame.idol)
    {
        n = rand(1,8);
    }
    else
    {
        n = rand(1,9);
        if (n == 9) oGame.idol = true;
    }

    switch(n)
    {
        // upper plats
        case 1: { strTemp = "00000000000010111100000000000000011010000050000000000000000000000000001111111111"; break; }
        case 2: { strTemp = "111111111111V0000211120000021100000002110000000211112000021111120021111111001111"; break; }
        case 3: { strTemp = "1111111111112V000011112000002111200000001120000000112000021111120021111111001111"; break; }
        case 4: { strTemp = "11120021111100000222120000021100000002220000000211112000022211177T71111111111111"; break; }
        case 5: { strTemp = "1112002111222000001111200000212220000000112000000022200002111117T771111111111111"; break; }
        case 6: { strTemp = "1112002111222000001111200000212220000000112000000022200002111117T771111111111111"; break; }
        // water rooms
        case 7: { strTemp = "000000000011wwwwww1111wwwwww11113wwww311113wwww311113wwww31111133331111111111111"; break; }
        case 8: { strTemp = "00000000000000rr0000000rttr00000rrrrrr0000V0000000000000000000000000000000000000"; break; }
        // idols
        case 9:
        {
            if (global.cemetary) strTemp = "ttttttttttttttttttttttp0C00pttttt0tt0ttt4000000004ttt0tt0tttttp0000ptt1111111111";
            else strTemp = "01000000100000I0000001BBBBBB10110000001111wwwwww1111wwwwww11113wwww3111111111111";
            break;
        }
        // altars
        case 10: { strTemp = "220000002200000000000000000000000000000000000000000000x0000002211112201111111111"; break; }
    }
}
else if (roomPath == 0 or roomPath == 1)
{
    switch(rand(1,10))
    {
        // basic rooms
        case 1: { strTemp = "60000600000000000000000000000000000000000050000000000000000000000000001111111111"; break; }
        case 2: { strTemp = "60000600000000000000000000000000000000005000050000000000000000000000001111111111"; break; }
        case 3: { strTemp = "60000600000000000000000000000050000500000000000000000000000011111111111111111111"; break; }
        case 4: { strTemp = "60000600000000000000000000000000000000000000000000000111110000111111001111111111"; break; }
        case 5: { strTemp = "2222222222000000000000000000000000tt000000r0220r0000t0tt0t000rtrttrtr01111111111"; break; }
        case 6: {
            if (rand(1,2) == 1) strTemp = "0L000000001L111111110L222222200L000000000002002000011122111011200002111111111111";
            else strTemp = "00000000L011111111L102222222L000000000L00002002000011122111011200002111111111111";
            break;
        }
        // spikes
        case 7: { strTemp = "1111111111V0000V000000000000000000000000000000000010000000011ssssssss11111111111"; break; }
        // upper plats
        case 8: { strTemp = "00000000000000000000000000000000000000005000050000000000000000000000001111111111"; break; }
        // water
        case 9: { strTemp = "000000000000000000000000000000013wwww310013wwww310113wwww31111133331111111111111"; break; }
        case 10: { strTemp = "0060000000000000000000000000000000000000013wwww310113wwww31111133331111111111111"; break; }
    }
}
else if (roomPath == 3)
{
    switch(rand(1,7))
    {
        // basic rooms
        case 1: { strTemp = "00000000000000000000000000000000000000000050000000000000000000000000001111111111"; break; }
        case 2: { strTemp = "00000000000000000000000000000000000000005000050000000000000000000000001111111111"; break; }
        case 3: { strTemp = "00000000000000000000000000000050000500000000000000000000000011111111111111111111"; break; }
        
        // upper plats
        case 4: { strTemp = "00000000000000000000000000000000000000000002222220001111111011111111111111111111"; break; }
        case 5: { strTemp = "00000000000000000000000000000000000000000000000221000002211100002211111111111111"; break; }
        // water
        case 6: { strTemp = "000000000000000000000000000000013wwww310013wwww310113wwww31111133331111111111111"; break; }
        case 7: { strTemp = "0000000000006000000000000000000000000000013wwww310113wwww31111133331111111111111"; break; }
    }
}
else if (roomPath == 4) // shop
{
    strTemp = "111111111111111111111111221111111l000211...000W010...00000k0..Kiiii000bbbbbbbbbb";
    
    switch(rand(1,7))
    {
        case 1: { shopType = "General"; break; }
        case 2: { shopType = "Bomb"; break; }
        case 3: { shopType = "Weapon"; break; }
        case 4: { shopType = "Rare"; break; }
        case 5: { shopType = "Clothing"; break; }
        case 6: { shopType = "Craps"; strTemp = "11111111111111111111111122111111Kl000211..bQ00W010.0+00000k0.q+uu00000bbbbbbbbbb"; break; }
        case 7: { shopType = "Kissing"; strTemp = "111111111111111111111111221111111l000211...000W010...00000k0..K00D0000bbbbbbbbbb"; oGame.damsel = true; break; }
    }   
}
else if (roomPath == 5) // shop
{
    strTemp = "111111111111111111111111221111112000l11101W0000...0k00000...000iiiiK..bbbbbbbbbb";
        
    switch(rand(1,7))
    {
        case 1: { shopType = "General"; break; }
        case 2: { shopType = "Bomb"; break; }
        case 3: { shopType = "Weapon"; break; }
        case 4: { shopType = "Rare"; break; }
        case 5: { shopType = "Clothing"; break; }
        case 6: { shopType = "Craps"; strTemp = "111111111111111111111111221111112000lK1101W0Q00b..0k00000+0.00000uu+q.bbbbbbbbbb"; break; }
        case 7: { shopType = "Kissing"; strTemp = "111111111111111111111111221111112000l11101W0000...0k00000...0000D00K..bbbbbbbbbb"; oGame.damsel = true; break; }
    }
}
else if (roomPath == 7) // Lake Bottom
{
    switch(rand(1,8))
    {
        case 1: { strTemp = "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"; break; }
        case 2: { strTemp = "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww,,,,,,,,,,"; break; }
        case 3: { strTemp = "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww,,wwwwww,,wwwwwwwwwwwwwwwwwwww,,,,,,,,,,"; break; }
        case 4: { strTemp = "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww,v,wwwwwwwwwv,wwwwwww,v,wwwwww,,v,,,,,ww"; break; }
        case 5: { strTemp = "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww,v,wwwwww,vwwwwwwww,v,ww,,,,,,v,,"; break; }
        case 6: { strTemp = "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww,,wwwwwww,vv,wwwwww,vv,wwwww,,vv,,ww,,,vvvv,,,"; break; }
        case 7: { strTemp = "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww,,,,wwwww,vvvv,www,v,w,vv,ww,wwww,vv,,,,,,,,,,,"; break; }
        case 8: { strTemp = "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww,,,,wwwww,vvvv,www,vv,w,v,w,vv,wwww,w,,,,,,,,,,"; break; }
    }
}
else if (roomPath == 8) // Lake Top
{
    if (global.roomPath[scrGetRoomX(x), scrGetRoomY(y-128)] == 2)
        n = rand(1,5);
    else
        n = rand(1,8);
    switch(n)
    {
        case 1: { strTemp = "000000000000000000000001111000w,,vvvv,,wwwww,,wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"; break; }
        case 2: { strTemp = "000000000000000000001200000000vvwwwwwwww,wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"; break; }
        case 3: { strTemp = "000000000000000000000000000021wwwwwwwwvvwwwwwwwww,wwwwwwwwwwwwwwwwwwwwwwwwwwwwww"; break; }
        case 4: { strTemp = "000000000000000000000000000000wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"; break; }
        case 5: { strTemp = "000000000000000000000001111000w,,vvvv,,wwww,vv,wwwwwwwvvwwwwwwww,,wwwwwwwwwwwwww"; break; }
        case 6: { strTemp = "000022000000021120000001111000w,,vvvv,,wwww,vv,wwwwwwwvvwwwwwwww,,wwwwwwwwwwwwww"; break; }
        case 7: { strTemp = "600006000000000000000000000000wwwvvvvwwwwwww,,wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"; break; }
        case 8: { strTemp = "000022000000021120000221111220www,,,,wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"; break; }
    }
}
else if (roomPath == 9) // Mega Mouth
{
    switch(rand(1,1))
    {
        case 1: { strTemp = "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwJwwwwwwwwwwwwwwwwwwwwwwwwww,,,,,,,,,,"; break; }
    }
}
else // drop
{
    if (roomPathAbove != 2) n = rand(1,6);
    else n = rand(1,5);
    switch(n)
    {
        case 1: { strTemp = "00000000000000000000000000000000000000000000000000000000002200000002111111202111"; break; }
        case 2: { strTemp = "000000000000000000000000000000000000000000000000002200000000112T0000001111202111"; break; }
        case 3: { strTemp = "00000000006000000000000000000000000000000000000000000000000000000000001000000001"; break; }
        case 4: { strTemp = "00000000000000000000000000000000000000000000000000000000000020000222221000111111"; break; }
        case 5: { strTemp = "00000000000000000000000000000000000000000000000000000000000022222000021111110001"; break; }
        //
        case 6: { strTemp = "11111111111111111111120000002100000000000000000000022000022021120021121111001111"; break; }
    }
}

// Add obstacles

for (i = 1; i < 81; i += 1)
{
    j = i;
  
    strObs1 = "00000";
    strObs2 = "00000";
    strObs3 = "00000";
    strObs4 = "00000";
    tile = string_char_at(strTemp, i);
    
    if (tile == "8")
    {
        n = rand(1,1);
        switch(n)
        {
            case 1: { strObs1 = "00900"; strObs2 = "01110"; strObs3 = "11111"; break; }
        }
    }
    else if (tile == "5") // ground
    {
        if (rand(1,8) == 1) n = rand(100,102);
        else n = rand(1,2);
        switch(n)
        {
            case 1: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "22222"; break; }
            case 2: { strObs1 = "00000"; strObs2 = "22222"; strObs3 = "11111"; break; }
            case 100: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "0T022"; break; }
            case 101: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "20T02"; break; }
            case 102: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "220T0"; break; }
        }
    }
    else if (tile == "6") // air
    {
        n = rand(1,4);
        switch(n)
        {
            case 1: { strObs1 = "11112"; strObs2 = "22220"; strObs3 = "00000"; break; }
            case 2: { strObs1 = "21111"; strObs2 = "02222"; strObs3 = "00000"; break; }
            case 3: { strObs1 = "22222"; strObs2 = "00000"; strObs3 = "00000"; break; }
            case 4: { strObs1 = "11111"; strObs2 = "21112"; strObs3 = "00000"; break; }
        }
    }
    else if (tile == "V") // vines
    {
        n = rand(1,3);
        switch(n)
        {
            case 1: { strObs1 = "L0L0L"; strObs2 = "L0L0L"; strObs3 = "L000L"; strObs4 = "L0000"; break; }
            case 2: { strObs1 = "L0L0L"; strObs2 = "L0L0L"; strObs3 = "L000L"; strObs4 = "0000L"; break; }
            case 3: { strObs1 = "0L0L0"; strObs2 = "0L0L0"; strObs3 = "0L0L0"; strObs4 = "000L0"; break; }
        }
    }
    
    if (tile == "5" or tile == "6" or tile == "8" or tile == "V")
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
    if (tile == "V")
    {
        j += 10;
        strTemp = string_delete(strTemp, j, 5);
        strTemp = string_insert(strObs4, strTemp, j);
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
            instance_create(xpos, ypos, oLush);
        }
        else if (tile == "2" and rand(1,2) == 1 and not collision_point(xpos, ypos, oSolid, 0, 0))
        {
            instance_create(xpos, ypos, oLush);
        }
        if (tile == "t" and not collision_point(xpos, ypos, oSolid, 0, 0))
        {
            instance_create(xpos, ypos, oTemple);
        }
        if (tile == "r" and not collision_point(xpos, ypos, oSolid, 0, 0))
        {
            if (rand(1,2) == 1) instance_create(xpos, ypos, oTemple);
            else instance_create(xpos, ypos, oLush);
        }
        else if (tile == "3" and not collision_point(xpos, ypos, oSolid, 0, 0))
        {
            if (rand(1,2) == 1) instance_create(xpos, ypos, oWaterSwim);
            else instance_create(xpos, ypos, oLush);
        }
        else if (tile == "L") instance_create(xpos, ypos, oVine);
        else if (tile == "P") instance_create(xpos, ypos, oVineTop);
        else if (tile == "7" and rand(1,3) == 1) instance_create(xpos, ypos, oSpikes);
        else if (tile == "s") instance_create(xpos, ypos, oSpikes);
        else if (tile == "4") instance_create(xpos, ypos, oPushBlock);
        else if (tile == "9")
        {
            block = instance_create(xpos, ypos+16, oLush);
            if (scrGetRoomX(x) == global.startRoomX and scrGetRoomY(y) == global.startRoomY)
                instance_create(xpos, ypos, oEntrance);
            else
            {
                instance_create(xpos, ypos, oExit);
                global.exitX = xpos;
                global.exitY = ypos;
                block.invincible = true;
            }
        }
        else if (tile == "c")
        {
            instance_create(xpos, ypos, oChest);
        }
        else if (tile == "d")
        {
            instance_create(xpos, ypos, oWaterSwim);
            instance_create(xpos, ypos, oChest);
        }
        else if (tile == "w")
        {
            instance_create(xpos, ypos, oWaterSwim);
        }
        else if (tile == "v")
        {
            instance_create(xpos, ypos, oWaterSwim);
            instance_create(xpos, ypos, oLush);
        }
        else if (tile == ",")
        {
            instance_create(xpos, ypos, oWaterSwim);
            if (rand(1,2)==1) instance_create(xpos, ypos, oLush);
        }
        else if (tile == "J")
        {
            instance_create(xpos, ypos, oWaterSwim);
            instance_create(xpos, ypos, oJaws);
        }
        else if (tile == "I")
        {
            instance_create(xpos+16, ypos+12, oGoldIdol);
        }
        else if (tile == "C")
        {
            instance_create(xpos+16, ypos+12, oCrystalSkull);
        }
        else if (tile == "." and not collision_point(xpos, ypos, oSolid, 0, 0))
        {
            obj = instance_create(xpos, ypos, oLush);
            obj.shopWall = true;
        }
        else if (tile == "Q")
        {
            if (shopType == "Craps")
            {
                tile_add(bgDiceSign, 0, 0, 48, 32, xpos, ypos, 9004);
            }
        }
        else if (tile == "q")
        {
            n = rand(1,6);
            scrGenerateItem(xpos+8, ypos+8, 1);
            obj.inDiceHouse = true;
        }
        else if (tile == "+")
        {
            obj = instance_create(xpos, ypos, oSolid);
            obj.sprite_index = sIceBlock;
            obj.shopWall = true;
        }
        else if (tile == "W")
        {
            if (global.murderer or global.thiefLevel > 0)
            {
                if (global.isDamsel) tile_add(bgWanted, 32, 0, 32, 32, xpos, ypos, 9004);
                else if (global.isTunnelMan) tile_add(bgWanted, 64, 0, 32, 32, xpos, ypos, 9004);
                else tile_add(bgWanted, 0, 0, 32, 32, xpos, ypos, 9004);
            }
        }
        else if (tile == "b")
        {
            obj = instance_create(xpos, ypos, oBrickSmooth);
            obj.sprite_index = sLushSmooth;
            obj.shopWall = true;
        }
        else if (tile == "l")
        {
            if (oGame.damsel) instance_create(xpos, ypos, oLampRed);
            else instance_create(xpos, ypos, oLamp);
        }
        else if (tile == "K")
        {
            obj = instance_create(xpos, ypos, oShopkeeper);
            obj.style = shopType;
        }
        else if (tile == "k")
        {
            obj = instance_create(xpos, ypos, oSign);
            if (shopType == "General") obj.sprite_index = sSignGeneral;
            else if (shopType == "Bomb") obj.sprite_index = sSignBomb;
            else if (shopType == "Weapon") obj.sprite_index = sSignWeapon;
            else if (shopType == "Clothing") obj.sprite_index = sSignClothing;
            else if (shopType == "Rare") obj.sprite_index = sSignRare;
            else if (shopType == "Craps") obj.sprite_index = sSignCraps;
            else if (shopType == "Kissing") obj.sprite_index = sSignKissing;
        }
        else if (tile == "i")
        {
            scrShopItemsGen();
        }
        else if (tile == "u")
        {
            instance_create(xpos+8, ypos+8, oDice);
        }
        else if (tile == "D")
        {
            obj = instance_create(xpos+8, ypos+8, oDamsel);
            obj.forSale = true;
            obj.status = 5;
        }
        else if (tile == "B")
        {
            obj = instance_create(xpos, ypos, oTrapBlock);
            obj.deathTimer = 40-abs(obj.x-(oGoldIdol.x-8));
            if (obj.deathTimer < 0) obj.deathTimer = 0;
        }
        else if (tile == "x")
        {
            instance_create(xpos, ypos, oSacAltarLeft);
            instance_create(xpos+16, ypos, oSacAltarRight);
            tile_add(bgKaliBody, 0, 0, 64, 64, xpos-16, ypos-48, 10001);
            instance_create(xpos+16, ypos-80+16, oKaliHead);
        }
        else if (tile == "p")
        {
            if (rand(1,2)) instance_create(xpos, ypos, oFakeBones);
            else instance_create(xpos+8, ypos+10, oJar);
        }
        else if (tile == "T")
        {
            instance_create(xpos, ypos, oTree);
            n = 0;
            tx = xpos;
            ty = ypos-16;
            b1 = false;
            b2 = false;
            for (m = 0; m < 5; m += 1)
            {
                if (rand(0,m) > 2)
                {
                    break;
                }
                else
                {
                    if (not collision_point(tx, ty-16, oSolid, 0, 0) and
                        not collision_point(tx-16, ty-16, oSolid, 0, 0) and
                        not collision_point(tx+16, ty-16, oSolid, 0, 0))                    
                    {
                        instance_create(tx, ty, oTree);
                        if (m < 4)
                        {
                            if (rand(1,5) < 4 and not b1)
                            {
                                instance_create(tx+16, ty, oTreeBranch);
                                b1 = true;
                            }
                            else if (b1) b1 = false;
                            if (rand(1,5) < 4 and not b2)
                            {
                                instance_create(tx-16, ty, oTreeBranch);
                                b2 = true;
                            }
                            else if (b2) b2 = false;
                        }
                    }
                    else
                    {
                        break;
                    }
                }
                ty -= 16;
            }
            instance_create(tx-16, ty+16, oLeaves);
            instance_create(tx+16, ty+16, oLeaves);
        }
    }
}
