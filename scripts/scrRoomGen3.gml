//
// scrRoomGen3()
//
// Room generation for Area 3, the Ice Caves.
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
if (scrGetRoomX(x) == global.startRoomX and scrGetRoomY(y) == global.startRoomY) // start room
{
    if (roomPath == 2) n = rand(2,2);
    else n = rand(1,1);
    switch(n)
    {
        case 1: { strTemp = "00000000000000000000000000000000000000000008000000000000000000000000001111111111"; break; }
        // hole
        case 2: { strTemp = "00000000000000000000000000000000000000000008000000000000000000000000000011111110"; break; }
    }
}
else if (scrGetRoomX(x) == global.endRoomX and scrGetRoomY(y) == global.endRoomY) // end room
{
    n = rand(1,1);
    switch(n)
    {
        case 1: { strTemp = "00000000000000000000000000000000000000000008000000000000000000000000001111111111"; break; }
    }
}
else if (roomPath == 0 and rand(1,2) == 1) // side room
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
        // empty
        case 1: { strTemp = "00000000000000000000000000000000000000000000000000000000000000000000000000000000"; break; }
        // steps
        case 2: { strTemp = "10000000001000000000111000000022201100000000220100000000010000000001110000000222"; break; }
        case 3: { strTemp = "00000000010000000001000000011100001102220010220000001000000011100000002220000000"; break; }
        // treasure tower
        case 4: { strTemp = "000000000000021120000001111000000111100000f1111f000002222000f00000000f0000000000"; break; }
        case 5: { strTemp = "0000000000000000000000220022000011ff11000011001200202100120220210012020002002000"; break; }
        case 6: { strTemp = "0jiiiiiij00jij00jij0jjii0jiij0000000jij0jjiij0iij00jiij0jijj0jiij000000jjiiiiijj"; break; }
        case 7: { strTemp = "0jiiiiiij00jij00jij00jii0jiijj0jij0000000jij0jiijj0jij0jiij000000jiij00jjiiiiijj"; break; }
        case 8: { strTemp = "011iiii110000jjjj0000000ii00000000jj00000000ii00000000jj00000000ii00000002222000"; break; }
        // idol
        case 9: { strTemp = "00000000000000I000000000cc000000000000000000000000000000000000007700000000110000"; break; }
        // altars
        case 10: { strTemp = "000000000000000000000000000000000000000000000000000000x0000002211112201111111111"; break; }
    }
}
else if ((roomPath == 0 or roomPath == 1 or roomPath == 2) and (rand(1,10) < 10))
{
    switch(rand(1,9))
    {
        // basic rooms
        case 1: { strTemp = "00000000000000000000000000000000006000000000000000000000000000021111120000222220"; break; }
        case 2: { strTemp = "00000000000000000000000000000060000000000000000000000000000021111120000222220000"; break; }
        case 3: { strTemp = "11111200001111112000111111200000002120001120000000112021200000001120001111120000"; break; }
        case 4: { strTemp = "00002111110002111111000211111100021200000000000211000212021100021100000000211111"; break; }
        case 5: { strTemp = "000000000000000000jj00f2100iii00021000000002111iii000021111100000222220000000000"; break; }
        // falling platforms
        case 6: { strTemp = "00000000000000000000000000000000000000000000000000F00F00F00000000000000000000000"; break; }
        // icy
        case 7: { strTemp = "00000000000000000000000000000000000000000iiiiiiii00021ii120000022220000000000000"; break; }
        case 8: { strTemp = "000000000000000000000iiiiiiii00021ii12000002222000000000000000000000000000000000"; break; }
        case 9: { strTemp = "0011111100000222200000000000000000000000jjjjjjjjjjiiiiiiiiii00000000001111111111"; break; }
    }
}
else if (roomPath == 4) // shop
{
    strTemp = "111111111111111111111111221111111l000211...000W010...00000k0..K$$$$000::::::::::";
    
    switch(rand(1,7))
    {
        case 1: { shopType = "General"; break; }
        case 2: { shopType = "Bomb"; break; }
        case 3: { shopType = "Weapon"; break; }
        case 4: { shopType = "Rare"; break; }
        case 5: { shopType = "Clothing"; break; }
        case 6: { shopType = "Craps"; strTemp = "11111111111111111111111122111111Kl000211..:Q00W010.0+00000k0.q+uu00000::::::::::"; break; }
        case 7: { shopType = "Kissing"; strTemp = "111111111111111111111111221111111l000211...000W010...00000k0..K00!0000::::::::::"; oGame.damsel = true; break; }
    }   
}

else if (roomPath == 5) // shop
{
    strTemp = "111111111111111111111111221111112000l11101W0000...0k00000...000$$$$K..::::::::::";
    
    switch(rand(1,7))
    {
        case 1: { shopType = "General"; break; }
        case 2: { shopType = "Bomb"; break; }
        case 3: { shopType = "Weapon"; break; }
        case 4: { shopType = "Rare"; break; }
        case 5: { shopType = "Clothing"; break; }
        case 6: { shopType = "Craps"; strTemp = "111111111111111111111111221111112000lK1101W0Q00:..0k00000+0.00000uu+q.::::::::::"; break; }
        case 7: { shopType = "Kissing"; strTemp = "111111111111111111111111221111112000l11101W0000...0k00000...0000!00K..::::::::::"; oGame.damsel = true; break; }
    }
}
else if (roomPath == 6) // Moai
{
    switch(rand(1,2))
    {
        case 1: { strTemp = "000000000000000M000000000000000000000000021110002002111mmm2000111111000000000000"; break; }
        case 2: { strTemp = "000000000000M000000000000000000000000000020001112002mmm1112000111111000000000000"; break; }
    }
}
else if (roomPath == 7)
{
    switch(rand(1,1))
    {
        case 1: { strTemp = "0000000000000DAAAAAA0iiiE0E0E00iG00000000C00000000000000000000BBBBBBBB0000000000"; break; }
    }
}
else if (roomPath == 8)
{
    switch(rand(1,1))
    {
        case 1: { strTemp = "0000000000AAAAAAAAAAE0E0E0E0E0000000000000000000000000000000BBBBBBBBBB0000000000"; break; }
    }
}
else if (roomPath == 9)
{
    switch(rand(1,1))
    {
        case 1: { strTemp = "0000022221AAAAAAAAA1E0E0Et2211000000X01100000000T1000022ii11BBBbbbbbbb0000222221"; break; }
    }
}
else
{
    switch(rand(1,1))
    {
        case 1: { strTemp = "00000000000000000000000000000000005000000000000000000000000000021111120000222220"; break; }
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
        switch(rand(1,6))
        {
            case 1: { strObs1 = "00900"; strObs2 = "01110"; strObs3 = "11111"; break; }
            case 2: { strObs1 = "00900"; strObs2 = "02120"; strObs3 = "02120"; break; }
            case 3: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "92222"; break; }
            case 4: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "22229"; break; }
            case 5: { strObs1 = "00000"; strObs2 = "11001"; strObs3 = "19001"; break; }
            case 6: { strObs1 = "00000"; strObs2 = "10011"; strObs3 = "10091"; break; }
        }
    }
    else if (tile == "5") // ground
    {
        switch(rand(1,15))
        {
            case 1: { strObs1 = "11111"; strObs2 = "00000"; strObs3 = "00000"; break; }
            case 2: { strObs1 = "00000"; strObs2 = "11111"; strObs3 = "00000"; break; }
            case 3: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "11111"; break; }
            case 4: { strObs1 = "00000"; strObs2 = "20200"; strObs3 = "10100"; break; }
            case 5: { strObs1 = "00000"; strObs2 = "02020"; strObs3 = "01010"; break; }
            case 6: { strObs1 = "00000"; strObs2 = "00202"; strObs3 = "00101"; break; }
            case 7: { strObs1 = "00000"; strObs2 = "22200"; strObs3 = "11100"; break; }
            case 8: { strObs1 = "00000"; strObs2 = "02220"; strObs3 = "01110"; break; }
            case 9: { strObs1 = "00000"; strObs2 = "00222"; strObs3 = "00111"; break; }
            case 10: { strObs1 = "11100"; strObs2 = "22200"; strObs3 = "00000"; break; }
            case 11: { strObs1 = "01110"; strObs2 = "02220"; strObs3 = "00000"; break; }
            case 12: { strObs1 = "00111"; strObs2 = "00222"; strObs3 = "00000"; break; }
            case 13: { strObs1 = "00000"; strObs2 = "02220"; strObs3 = "21112"; break; }
            case 14: { strObs1 = "00000"; strObs2 = "20100"; strObs3 = "00110"; break; }
            case 15: { strObs1 = "00000"; strObs2 = "00102"; strObs3 = "01100"; break; }
        }
    }
    else if (tile == "6") // air
    {
        switch(rand(1,4))
        {
            case 1: { strObs1 = "00000"; strObs2 = "00000"; strObs3 = "11111"; break; }
            case 2: { strObs1 = "00000"; strObs2 = "11111"; strObs3 = "22222"; break; }
            case 3: { strObs1 = "11111"; strObs2 = "22222"; strObs3 = "00000"; break; }
            case 4: { strObs1 = "0jij0"; strObs2 = "0jij0"; strObs3 = "0jij0"; break; }
        }
    }
    else if (tile == "F") // falling/icy plats
    {
        switch(rand(1,12))
        {
            case 1: { strObs1 = "0ff"; strObs2 = "000"; strObs3 = "000"; break; }
            case 2: { strObs1 = "000"; strObs2 = "0ff"; strObs3 = "000"; break; }
            case 3: { strObs1 = "000"; strObs2 = "000"; strObs3 = "0ff"; break; }
            case 4: { strObs1 = "00f"; strObs2 = "000"; strObs3 = "000"; break; }
            case 5: { strObs1 = "000"; strObs2 = "0f0"; strObs3 = "000"; break; }
            case 6: { strObs1 = "000"; strObs2 = "000"; strObs3 = "0f0"; break; }
            case 7: { strObs1 = "0ji"; strObs2 = "000"; strObs3 = "000"; break; }
            case 8: { strObs1 = "000"; strObs2 = "0ji"; strObs3 = "000"; break; }
            case 9: { strObs1 = "000"; strObs2 = "000"; strObs3 = "0ji"; break; }
            case 10: { strObs1 = "00i"; strObs2 = "000"; strObs3 = "000"; break; }
            case 11: { strObs1 = "000"; strObs2 = "0i0"; strObs3 = "000"; break; }
            case 12: { strObs1 = "000"; strObs2 = "000"; strObs3 = "0i0"; break; }
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
    else if (tile == "F")
    {
        strTemp = string_delete(strTemp, j, 3);
        strTemp = string_insert(strObs1, strTemp, j);
        j += 10;
        strTemp = string_delete(strTemp, j, 3);
        strTemp = string_insert(strObs2, strTemp, j);
        j += 10;
        strTemp = string_delete(strTemp, j, 3);
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
            if (rand(1,10) == 1) instance_create(xpos, ypos, oIce);
            else instance_create(xpos, ypos, oDark);
        }
        else if (tile == "2" and rand(1,2) == 1 and not collision_point(xpos, ypos, oSolid, 0, 0))
        {
            if (rand(1,10) == 1) instance_create(xpos, ypos, oIce);
            else instance_create(xpos, ypos, oDark);
        }
        else if (tile == "L") instance_create(xpos, ypos, oVine);
        else if (tile == "P") instance_create(xpos, ypos, oVine);
        else if (tile == "7") instance_create(xpos, ypos, oSpikes);
        else if (tile == "4" and rand(1,4) == 1) instance_create(xpos, ypos, oPushBlock);
        else if (tile == "9")
        {
            block = instance_create(xpos, ypos+16, oDark);
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
        else if (tile == "a")
        {
            if (rand(1,1) == 1) instance_create(xpos, ypos, oChest);
        }
        else if (tile == "I")
        {
            instance_create(xpos+16, ypos+12, oGoldIdol);
        }
        else if (tile == "." and not collision_point(xpos, ypos, oSolid, 0, 0))
        {
            obj = instance_create(xpos, ypos, oDark);
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
        else if (tile == ":")
        {
            obj = instance_create(xpos, ypos, oBrickSmooth);
            obj.sprite_index = sDarkSmooth;
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
        else if (tile == "$")
        {
            scrShopItemsGen();
        }
        else if (tile == "u")
        {
            instance_create(xpos+8, ypos+8, oDice);
        }
        else if (tile == "!")
        {
            obj = instance_create(xpos+8, ypos+8, oDamsel);
            obj.forSale = true;
            obj.status = 5;
        }
        else if (tile == "Y")
        {
            instance_create(xpos, ypos, oYeti);
        }
        else if (tile == "A")
        {
            instance_create(xpos, ypos, oAlienShip);
            tile_add(bgAlienShip3, 0, 0, 16, 16, xpos, ypos, 9005);
        }
        else if (tile == "B")
        {
            tile = instance_create(xpos, ypos, oAlienShip);
            with tile { sprite_index = sAlienFloor; }
            tile_add(bgAlienShip3, 0, 0, 16, 16, xpos, ypos, 9005);
        }
        else if (tile == "b")
        {
            if (rand(1,2) == 1)
            {
                if (rand(1,10) == 1) instance_create(xpos, ypos, oIce);
                else instance_create(xpos, ypos, oDark);
            }
            else
            {
                tile = instance_create(xpos, ypos, oAlienShip);
                with tile { sprite_index = sAlienFloor; }
                tile_add(bgAlienShip3, 0, 0, 16, 16, xpos, ypos, 9005);
            }
        }
        else if (tile == "C")
        {
            tile = instance_create(xpos, ypos, oAlienShip);
            with tile { sprite_index = sAlienFront; }
            tile = instance_create(xpos, ypos+16, oAlienShip);
            with tile { sprite_index = sAlienFront; }
            tile = instance_create(xpos, ypos+32, oAlienShip);
            with tile { sprite_index = sAlienFront2; }
            tile_add(bgAlienShip3, 0, 0, 16, 16, xpos, ypos, 9005);
            tile_add(bgAlienShip3, 0, 0, 16, 16, xpos, ypos+16, 160);
            tile_add(bgAlienShip3, 0, 0, 16, 16, xpos, ypos+32, 160);
        }
        else if (tile == "D")
        {
            tile = instance_create(xpos, ypos, oAlienShip);
            with tile { sprite_index = sAlienFront3; }
            tile_add(bgAlienShip3, 0, 0, 16, 16, xpos, ypos, 9005);
        }
        else if (tile == "E")
        {
            if (rand(1,3) == 1) tile_add(bgAlienShip, 32, 0, 32, 64, xpos, ypos, 9005);
            else tile_add(bgAlienShip, 0, 0, 32, 64, xpos, ypos, 9005);
        }
        else if (tile == "G")
        {
            
            tile_add(bgAlienShip2, 0, 0, 32, 48, xpos, ypos, 9005);
        }
        else if (tile == "X")
        {
            instance_create(xpos, ypos, oAlienBoss);
        }
        else if (tile == "x")
        {
            instance_create(xpos, ypos, oSacAltarLeft);
            instance_create(xpos+16, ypos, oSacAltarRight);
            tile_add(bgKaliBody, 0, 0, 64, 64, xpos-16, ypos-48, 10001);
            instance_create(xpos+16, ypos-80+16, oKaliHead);
        }
        else if (tile == "T")
        {
            instance_create(xpos, ypos, oDark);
            obj = instance_create(xpos+8, ypos+8, oJetpack);
            obj.cost = 0;
            obj.forSale = false;
        }
        else if (tile == "t")
        {
            instance_create(xpos, ypos, oBarrierEmitter);
        }
        else if (tile == "c")
        {
            instance_create(xpos, ypos, oThinIce);
        }
        else if (tile == "M" and not collision_point(xpos, ypos, oSolid, 0, 0))
        {
            instance_create(xpos, ypos, oMoai);
            instance_create(xpos+16, ypos, oMoai2);
            instance_create(xpos+32, ypos, oMoai3);
            instance_create(xpos+16, ypos+16, oMoaiInside);
            tile_add(bgAlienShip3, 0, 0, 16, 16, xpos+16, ypos+16, 150);
            tile_add(bgAlienShip3, 0, 0, 16, 16, xpos+16, ypos+32, 150);
            instance_create(xpos+16, ypos+32, oThinIce);
            obj = instance_create(xpos+16, ypos+48, oExit);
            obj.type = "Moai Exit";
            obj = instance_create(xpos+16+8, ypos+48+8, oCrown);
            obj.cost = 0;
            obj.forSale = false;
        }
        else if (tile == "m" and not collision_point(xpos, ypos, oSolid, 0, 0))
        {
            obj = instance_create(xpos, ypos, oDark);
            obj.invincible = true;
        }
        else if (tile == "i")
        {
            instance_create(xpos, ypos, oIce);
        }
        else if (tile == "j" and rand(1,2) == 1)
        {
            instance_create(xpos, ypos, oIce);
        }
        else if (tile == "f")
        {
            instance_create(xpos, ypos, oDarkFall);
        }
        else if (tile == "w")
        {
            instance_create(xpos, ypos, oWaterSwim);
        }
    }
}
