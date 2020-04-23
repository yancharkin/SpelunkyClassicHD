//
// scrRoomGen1()
//
// Room generation for Area 1, the Mines.
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
shopType = "General";
if (scrGetRoomY(y) != 0) roomPathAbove = global.roomPath[scrGetRoomX(x), scrGetRoomY(y-128)];

if (scrGetRoomX(x) == global.startRoomX and scrGetRoomY(y) == global.startRoomY) // start room
{
    if (roomPath == 2) n = rand(5,8);
    else n = rand(1,4);
    switch(n)
    {
        case 1: { strTemp = "60000600000000000000000000000000000000000008000000000000000000000000001111111111"; break; }
        case 2: { strTemp = "11111111112222222222000000000000000000000008000000000000000000000000001111111111"; break; }
        case 3: { strTemp = "00000000000008000000000000000000L000000000P111111000L111111000L00111111111111111"; break; }
        case 4: { strTemp = "0000000000008000000000000000000000000L000111111P000111111L001111100L001111111111"; break; }
        // hole
        case 5: { strTemp = "60000600000000000000000000000000000000000008000000000000000000000000002021111120"; break; }
        case 6: { strTemp = "11111111112222222222000000000000000000000008000000000000000000000000002021111120"; break; }
        case 7: { strTemp = "00000000000008000000000000000000L000000000P111111000L111111000L00011111111101111"; break; }
        case 8: { strTemp = "0000000000008000000000000000000000000L000111111P000111111L001111000L001111011111"; break; }
    }
}
else if (scrGetRoomX(x) == global.endRoomX and scrGetRoomY(y) == global.endRoomY) // end room
{
    if (roomPathAbove == 2) n = rand(2,4);
    else n = rand(3,6);
    switch(n)
    {
        case 1: { strTemp = "00000000006000060000000000000000000000000008000000000000000000000000001111111111"; break; }
        case 2: { strTemp = "00000000000000000000000000000000000000000008000000000000000000000000001111111111"; break; }
        case 3: { strTemp = "00000000000010021110001001111000110111129012000000111111111021111111201111111111"; break; }
        case 4: { strTemp = "00000000000111200100011110010021111011000000002109011111111102111111121111111111"; break; }
        // no drop
        case 5: { strTemp = "60000600000000000000000000000000000000000008000000000000000000000000001111111111"; break; }
        case 6: { strTemp = "11111111112222222222000000000000000000000008000000000000000000000000001111111111"; break; }
    }
}
else if (roomPath == 0) // side room
{
    if (global.currLevel > 1 and not oGame.altar and rand(1,16) == 1)
    {
        n = 11;
        oGame.altar = true;
    }
    else if (oGame.idol or scrGetRoomY(y) == 3)
    {
        n = rand(1,9);
    }
    else
    {
        n = rand(1,10);
        if (n == 10) oGame.idol = true;
        // else n = rand(1,9);
    }

    switch(n)
    {
        // upper plats
        case 1: { strTemp = "00000000000010111100000000000000011010000050000000000000000000000000001111111111"; break; }
        // high walls
        case 2: { strTemp = "110000000040L600000011P000000011L000000011L5000000110000000011000000001111111111"; break; }
        case 3: { strTemp = "00000000110060000L040000000P110000000L110050000L11000000001100000000111111111111"; break; }
        case 4: { strTemp = "110000000040L600000011P000000011L000000011L0000000110000000011000000001112222111"; break; }
        case 5: { strTemp = "00000000110060000L040000000P110000000L110000000L11000000001100000000111112222111"; break; }
        case 6: { strTemp = "11111111110221111220002111120000022220000002222000002111120002211112201111111111"; break; }
        case 7: { strTemp = "11111111111112222111112000021111102201111120000211111022011111200002111112222111"; break; }
        case 8: { strTemp = "11111111110000000000110000001111222222111111111111112222221122000000221100000011"; break; }
        case 9: { strTemp = "121111112100L2112L0011P1111P1111L2112L1111L1111L1111L1221L1100L0000L001111221111"; break; }
        // idols
        case 10: { strTemp = "22000000220000B0000000000000000000000000000000000000000000000000I000001111A01111"; break; }
        // altars
        case 11: { strTemp = "220000002200000000000000000000000000000000000000000000x0000002211112201111111111"; break; }
    }
}
else if (roomPath == 0 or roomPath == 1) // main room
{
    switch(rand(1,12))
    {
    
        // basic rooms
        case 1: { strTemp = "60000600000000000000000000000000000000000050000000000000000000000000001111111111"; break; }
        case 2: { strTemp = "60000600000000000000000000000000000000005000050000000000000000000000001111111111"; break; }
        case 3: { strTemp = "60000600000000000000000000000000050000000000000000000000000011111111111111111111"; break; }
        case 4: { strTemp = "60000600000000000000000600000000000000000000000000000222220000111111001111111111"; break; }
        case 5: { strTemp = "11111111112222222222000000000000000000000050000000000000000000000000001111111111"; break; }
        case 6: { strTemp = "11111111112111111112022222222000000000000050000000000000000000000000001111111111"; break; }
        // low ceiling
        case 7: { strTemp = "11111111112111111112211111111221111111120111111110022222222000000000001111111111"; break; }
        // ladders
        case 8: {
            if (rand(1,2) == 1) strTemp = "1111111111000000000L111111111P000000000L5000050000000000000000000000001111111111";
            else strTemp = "1111111111L000000000P111111111L0000000005000050000000000000000000000001111111111"; break;
        }
        case 9: { strTemp = "000000000000L0000L0000P1111P0000L0000L0000P1111P0000L1111L0000L1111L001111111111"; break; }
        // upper plats
        case 10: { strTemp = "00000000000111111110001111110000000000005000050000000000000000000000001111111111"; break; }
        case 11: { strTemp = "00000000000000000000000000000000000000000021111200021111112021111111121111111111"; break; }
        // treasure below
        case 12: {
            if (rand(1,2) == 1) strTemp = "2222222222000000000000000000L001111111P001050000L011000000L010000000L01111111111";
            else strTemp = "222222222200000000000L000000000P111111100L500000100L000000110L000000011111111111"; break;
        }
    }
}
else if (roomPath == 3) // main room
{
    switch(rand(1,8))
    {
    
        // basic rooms
        case 1: { strTemp = "00000000000000000000000000000000000000000050000000000000000000000000001111111111"; break; }
        case 2: { strTemp = "00000000000000000000000000000000000000005000050000000000000000000000001111111111"; break; }
        case 3: { strTemp = "00000000000000000000000000000050000500000000000000000000000011111111111111111111"; break; }
        case 4: { strTemp = "00000000000000000000000600000000000000000000000000000111110000111111001111111111"; break; }
        // upper plats
        case 5: { strTemp = "00000000000111111110001111110000000000005000050000000000000000000000001111111111"; break; }
        case 6: { strTemp = "00000000000000000000000000000000000000000021111200021111112021111111121111111111"; break; }
        case 7: { strTemp = "10000000011112002111111200211100000000000022222000111111111111111111111111111111"; break; }
        // treasure below
        case 8: {
            if (rand(1,2) == 1) strTemp = "0000000000000000000000000000L001111111P001050000L011000000L010000000L01111111111";
            else strTemp = "000000000000000000000L000000000P111111100L500000100L000000110L000000011111111111"; break;
        }
    }
}
else if (roomPath == 4) // shop
{
    strTemp = "111111111111111111111111221111111l000211...000W010...00000k0..Kiiii000bbbbbbbbbb";
    n = rand(1,7);
    // n = 6;
    switch(n)
    {
        case 1: { shopType = "General"; break; }
        case 2: { shopType = "Bomb"; break; }
        case 3: { shopType = "Weapon"; break; }
        case 4: { shopType = "Rare"; break; }
        case 5: { shopType = "Clothing"; break; }
        case 6: { shopType = "Craps"; strTemp = "11111111111111111111111122111111Kl000211..bQ00W010.0+00000k0.q+dd00000bbbbbbbbbb"; break; }
        case 7: { shopType = "Kissing"; strTemp = "111111111111111111111111221111111l000211...000W010...00000k0..K00D0000bbbbbbbbbb"; oGame.damsel = true; break; }
    }
}
else if (roomPath == 5) // shop
{
    strTemp = "111111111111111111111111221111112000l11101W0000...0k00000...000iiiiK..bbbbbbbbbb";
    n = rand(1,7);
    // n = 6;
    switch(n)
    {
        case 1: { shopType = "General"; break; }
        case 2: { shopType = "Bomb"; break; }
        case 3: { shopType = "Weapon"; break; }
        case 4: { shopType = "Rare"; break; }
        case 5: { shopType = "Clothing"; break; }
        case 6: { shopType = "Craps"; strTemp = "111111111111111111111111221111112000lK1101W0Q00b..0k00000+0.00000dd+q.bbbbbbbbbb"; break; }
        case 7: { shopType = "Kissing"; strTemp = "111111111111111111111111221111112000l11101W0000...0k00000...0000D00K..bbbbbbbbbb"; oGame.damsel = true; break; }
    }
}
else if (roomPath == 8) // snake pit
{
    switch(rand(1,1))
    {
        case 1: { strTemp = "111000011111s0000s11111200211111s0000s11111200211111s0000s11111200211111s0000s11"; break; }
    }
}
else if (roomPath == 9) // snake pit bottom
{
    switch(rand(1,1))
    {
        case 1: { strTemp = "111000011111s0000s1111100001111100S0001111S0110S11111STTS1111111M111111111111111"; break; }
    }    
}
else // drop
{
    if (roomPath == 7) n = rand(4,12);
    else if (roomPathAbove != 2) n = rand(1,12);
    else n = rand(1,8);
    switch(n)
    {
        case 1: { strTemp = "00000000006000060000000000000000000000006000060000000000000000000000000000000000"; break; }
        case 2: { strTemp = "00000000006000060000000000000000000000000000050000000000000000000000001202111111"; break; }
        case 3: { strTemp = "00000000006000060000000000000000000000050000000000000000000000000000001111112021"; break; }
        case 4: { strTemp = "00000000006000060000000000000000000000000000000000000000000002200002201112002111"; break; }
        case 5: { strTemp = "00000000000000220000000000000000200002000112002110011100111012000000211111001111"; break; }
        case 6: { strTemp = "00000000000060000000000000000000000000000000000000001112220002100000001110111111"; break; }
        case 7: { strTemp = "00000000000060000000000000000000000000000000000000002221110000000001201111110111"; break; }
        case 8: { strTemp = "00000000000060000000000000000000000000000000000000002022020000100001001111001111"; break; }
        case 9: { strTemp = "11111111112222222222000000000000000000000000000000000000000000000000001120000211"; break; }
        case 10: { strTemp = "11111111112222111111000002211100000002110000000000200000000000000000211120000211"; break; }
        case 11: { strTemp = "11111111111111112222111220000011200000000000000000000000000012000000001120000211"; break; }
        case 12: { strTemp = "11111111112111111112021111112000211112000002112000000022000002200002201111001111"; break; }
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
        switch(rand(1,8))
        {
            case 1: { strObs1 = "00900"; strObs2 = "01110"; strObs3 = "11111"; break; }
            case 2: { strObs1 = "00900"; strObs2 = "02120"; strObs3 = "02120"; break; }
            case 3: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "92222"; break; }
            case 4: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "22229"; break; }
            case 5: { strObs1 = "00000"; strObs2 = "11001"; strObs3 = "19001"; break; }
            case 6: { strObs1 = "00000"; strObs2 = "10011"; strObs3 = "10091"; break; }
            case 7: { strObs1 = "11111"; strObs2 = "10001"; strObs3 = "40094"; break; }
            case 8: { strObs1 = "00000"; strObs2 = "12021"; strObs3 = "12921"; break; }
        }
    }
    else if (tile == "5") // ground
    {
        switch(rand(1,16))
        {
            case 1: { strObs1 = "11111"; strObs2 = "00000"; strObs3 = "00000"; break; }
            case 2: { strObs1 = "00000"; strObs2 = "11110"; strObs3 = "00000"; break; }
            case 3: { strObs1 = "00000"; strObs2 = "01111"; strObs3 = "00000"; break; }
            case 4: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "11111"; break; }
            case 5: { strObs1 = "00000"; strObs2 = "20200"; strObs3 = "17177"; break; }
            case 6: { strObs1 = "00000"; strObs2 = "02020"; strObs3 = "71717"; break; }
            case 7: { strObs1 = "00000"; strObs2 = "00202"; strObs3 = "77171"; break; }
            case 8: { strObs1 = "00000"; strObs2 = "22200"; strObs3 = "11100"; break; }
            case 9: { strObs1 = "00000"; strObs2 = "02220"; strObs3 = "01110"; break; }
            case 10: { strObs1 = "00000"; strObs2 = "00222"; strObs3 = "00111"; break; }
            case 11: { strObs1 = "11100"; strObs2 = "22200"; strObs3 = "00000"; break; }
            case 12: { strObs1 = "01110"; strObs2 = "02220"; strObs3 = "00000"; break; }
            case 13: { strObs1 = "00111"; strObs2 = "00222"; strObs3 = "00000"; break; }
            case 14: { strObs1 = "00000"; strObs2 = "02220"; strObs3 = "21112"; break; }
            case 15: { strObs1 = "00000"; strObs2 = "20100"; strObs3 = "77117"; break; }
            case 16: { strObs1 = "00000"; strObs2 = "00102"; strObs3 = "71177"; break; }
        }
    }
    else if (tile == "6") // air
    {
        switch(rand(1,10))
        {
            case 1: { strObs1 = "11111"; strObs2 = "00000"; strObs3 = "00000"; break; }
            case 2: { strObs1 = "22222"; strObs2 = "00000"; strObs3 = "00000"; break; }
            case 3: { strObs1 = "11100"; strObs2 = "22200"; strObs3 = "00000"; break; }
            case 4: { strObs1 = "01110"; strObs2 = "02220"; strObs3 = "00000"; break; }
            case 5: { strObs1 = "00111"; strObs2 = "00222"; strObs3 = "00000"; break; }
            case 6: { strObs1 = "00000"; strObs2 = "01110"; strObs3 = "00000"; break; }
            case 7: { strObs1 = "00000"; strObs2 = "01110"; strObs3 = "02220"; break; }
            case 8: { strObs1 = "00000"; strObs2 = "02220"; strObs3 = "01110"; break; }
            case 9: { strObs1 = "00000"; strObs2 = "00220"; strObs3 = "01111"; break; }
            case 10: { strObs1 = "00000"; strObs2 = "22200"; strObs3 = "11100"; break; }
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
                instance_create(xpos, ypos, oBrick);
            }
        }
        else if (tile == "2" and rand(1,2) == 1 and not collision_point(xpos, ypos, oSolid, 0, 0))
        {
            if (rand(1,10) == 1) instance_create(xpos, ypos, oBlock);
            else
            {
                instance_create(xpos, ypos, oBrick);
            }
        }
        else if (tile == "L") instance_create(xpos, ypos, oLadderOrange);
        else if (tile == "P") instance_create(xpos, ypos, oLadderTop);
        else if (tile == "7" and rand(1,3) == 1) instance_create(xpos, ypos, oSpikes);
        else if (tile == "4" and rand(1,4) == 1) instance_create(xpos, ypos, oPushBlock);
        else if (tile == "9")
        {
            block = instance_create(xpos, ypos+16, oBrick);
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
        else if (tile == "A")
        {
            instance_create(xpos, ypos, oAltarLeft);
            instance_create(xpos+16, ypos, oAltarRight);
        }
        else if (tile == "x")
        {
            instance_create(xpos, ypos, oSacAltarLeft);
            instance_create(xpos+16, ypos, oSacAltarRight);
            tile_add(bgKaliBody, 0, 0, 64, 64, xpos-16, ypos-48, 10001);
            instance_create(xpos+16, ypos-80+16, oKaliHead);
        }
        else if (tile == "a")
        {
            instance_create(xpos, ypos, oChest);
        }
        else if (tile == "I")
        {
            instance_create(xpos+16, ypos+12, oGoldIdol);
        }
        else if (tile == "B")
        {
            instance_create(xpos+16, ypos+12, oGiantTikiHead);
            tile_add(bgTiki, 0, 0, 32, 64, xpos, ypos+32, 10001);
            tile_add(bgTikiArms, 16*rand(0,2), 0, 16, 16, xpos+32, ypos+32, 10001)
            tile_add(bgTikiArms, 16*rand(0,2), 16, 16, 16, xpos-16, ypos+32, 10001)
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
        else if (tile == "." and not collision_point(xpos, ypos, oSolid, 0, 0))
        {
            if (rand(1,10) == 1) obj = instance_create(xpos, ypos, oBlock);
            else
            {
                obj = instance_create(xpos, ypos, oBrick);
            }
            obj.shopWall = true;
        }
        else if (tile == "b")
        {
            obj = instance_create(xpos, ypos, oBrickSmooth);
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
        else if (tile == "d")
        {
            instance_create(xpos+8, ypos+8, oDice);
        }
        else if (tile == "D")
        {
            obj = instance_create(xpos+8, ypos+8, oDamsel);
            obj.forSale = true;
            obj.status = 5;
        }
        else if (tile == "s")
        {
            if (rand(1,10) == 1) instance_create(xpos, ypos, oSnake);
            else if (rand(1,2) == 1) instance_create(xpos, ypos, oBrick);
        }
        else if (tile == "S")
        {
            instance_create(xpos, ypos, oSnake);
        }
        else if (tile == "T")
        {
            instance_create(xpos+8, ypos+8, oRubyBig);
        }
        else if (tile == "M")
        {
            instance_create(xpos, ypos, oBrick);
            obj = instance_create(xpos+8, ypos+8, oMattock);
            obj.cost = 0;
            obj.forSale = false;
        }
    }
}
