//
// scrRoomGen4()
//
// Room generation for Area 4, the Temple.
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
        case 2: { strTemp = "00000000000000000000000000000000000000000008000000000000000000000000002000000002"; break; }
    }
}
else if (scrGetRoomX(x) == global.endRoomX and scrGetRoomY(y) == global.endRoomY) // end room
{
    n = rand(1,1);
    switch(n)
    {
        case 1: { strTemp = "00000000000000000000000000000000000000000008000000000000000000000000000000000000"; break; }
    }
}
else if (roomPath == 0 and rand(1,4) > 1) // side room
{
    if (global.cityOfGold)
    {
        n = rand(1,14);
        if (n == 12) n = 15;
    }
    else if (not oGame.altar and rand(1,12) == 1)
    {
        n = 16;
        oGame.altar = true;
    }
    else if (oGame.idol)
    {
        n = rand(1,11);
    }
    else
    {
        n = rand(1,12);
        if (n == 12) oGame.idol = true;
    }
        
    switch(n)
    {
        // upper plats
        case 1: { strTemp = "11111000001111100000111110000011111000001111150000111110000011111000001111111111"; break; }
        case 2: { strTemp = "00000111110000011111000001111100000111115000011111000001111100000111111111111111"; break; }
        // triangles
        case 3: { strTemp = "11000000001110000000211100000011111000002211110000111111100022211111001111111111"; break; }
        case 4: { strTemp = "00000000110000000111000000111200000111110000111122000111111100111112221111111111"; break; }
        case 5: { strTemp = "11111111110000000000111111100011111100001111100000111100000011100000001100000011"; break; }
        case 6: { strTemp = "11111111110000000000000111111100001111110000011111000000111100000001111100000011"; break; }
        case 7: { strTemp = "11111111112000000002110122101111000000111101221011200000000220012210021100000011"; break; }
        case 8: { strTemp = "11111111110002112000110011001111102201111100110011020111102000021120001111111111"; break; }
        case 9: { strTemp = "1111111111000000000011011110111101111011100111100111wwwwww1111wwwwww111111111111"; break; }
        // sun room
        case 10: {
            if (rand(1,2) == 1) strTemp = "1000000001000000000010000000011000000001100000000100T0000T000dddddddd01111111111";
            else strTemp = "1000000001000000000010000000011000000001100000000100T0000T000dddddddd01111111111";
            break;
        }
        case 11: { strTemp = "10000000010021111200100000000110000000011111001111111200211111120021111111001111"; break; }
        // idol
        case 12: { strTemp = "11CCCCCC11110000001111000000111D000000D1100000000100000000000000I000001111111111"; break; }
        // treasure vaults
        case 13: { strTemp = "11ttttt0111111111011110ttttt11110111111111ttttt011111111101111cttttt111111111111"; break; }
        case 14: { strTemp = "1111111111110ttttc11110111111111ttttt0111111111011110ttttt1111011111111100000011"; break; }
        case 15: { strTemp = "111111111111111111111111cc1111110111101111c1111c111111cc111111111111111111111111"; break; }
        // altars
        case 16: { strTemp = "220000002200000000000000000000000000000000000000000000x0000002211112201111111111"; break; }
    }
}
else if (roomPath == 0 or roomPath == 1)
{
    if (global.cityOfGold) n = rand(1,12);
    else n = rand(1,10);
    switch(n)
    {
        // basic rooms
        case 1: { strTemp = "1000000001200r000002100000000110000000011100000011000000000000000000001111111111"; break; }
        case 2: { strTemp = "1000000000100r000000100000000010000000001100000000000000000000000000001111111111"; break; }
        case 3: { strTemp = "0000000001000r000001000000000100000000010000000011000000000000000000001111111111"; break; }
        case 4: { strTemp = "0000000001000r000001000000000100000000010000000011000022000000011110001111111111"; break; }
        case 5: { strTemp = "110000001100L0000L0011Pr000P1111L0000L1111L0000L1102L0000L2000000000001111111111"; break; }
        // hallways
        case 6: { strTemp = "11111111111111111111111111111111111111111111111111000000000000000000001111111111"; break; }
        case 7: { strTemp = "1000000001000r000000100000000110000000011111111111000000000000000000001111111111"; break; }
        case 8: { strTemp = "120r000021000000000012000000211220LL02211111PP11110011LL11000000LL00001111111111"; break; }         
        case 9: { strTemp = "11111111112400000042110111101112000000211111111111000000000000000000001111111111"; break; }         
        // lava
        case 10: { strTemp = "0000000000000000000000000000000000000000013wwww310013wwww31011133331111111111111"; break; }
        case 11: { strTemp = "1000000001000r0000001000000001100000000111111111110000?0000000000000001111111111"; break; }         
        case 12: { strTemp = "100000000100000000001000?0000110000000011111111111000000000000000000001111111111"; break; }         
    }
}
else if (roomPath == 3)
{
    switch(rand(1,4))
    {
        // basic rooms
        case 1: { strTemp = "1000000001100r000001100000000110000000011100000011000000000000000000001111111111"; break; }
        case 2: { strTemp = "1000000000100r000000100000000010000000001100000000000000000000000000001111111111"; break; }
        case 3: { strTemp = "0000000001000r000001000000000100000000010000000011000000000000000000001111111111"; break; }
        // lava
        case 4: { strTemp = "0000000000000000000000000000000000000000013wwww310013wwww31011133331111111111111"; break; }
    }
}
else if (roomPath == 4) // shop
{
    strTemp = "111111111111111111111111221111111l000211...000W010...00000k0..Kiiii000bbbbbbbbbb";
    
    if (oGame.damsel) n = rand(1,6);
    else n = rand(1,7);
    switch(n)
    {
        case 1: { shopType = "General"; break; }
        case 2: { shopType = "Bomb"; break; }
        case 3: { shopType = "Weapon"; break; }
        case 4: { shopType = "Rare"; break; }
        case 5: { shopType = "Clothing"; break; }
        case 6: { shopType = "Craps"; strTemp = "11111111111111111111111122111111Kl000211..bQ00W010.0+00000k0.q+uu00000bbbbbbbbbb"; break; }
        case 7: { shopType = "Kissing"; strTemp = "111111111111111111111111221111111p000211...000W010...00000k0..K00A0000bbbbbbbbbb"; oGame.damsel = true; break; }
    }   
}
else if (roomPath == 5) // shop
{
    strTemp = "111111111111111111111111221111112000l11101W0000...0k00000...000iiiiK..bbbbbbbbbb";
    
    if (oGame.damsel) n = rand(1,6);
    else n = rand(1,7);
    switch(n)
    {
        case 1: { shopType = "General"; break; }
        case 2: { shopType = "Bomb"; break; }
        case 3: { shopType = "Weapon"; break; }
        case 4: { shopType = "Rare"; break; }
        case 5: { shopType = "Clothing"; break; }
        case 6: { shopType = "Craps"; strTemp = "111111111111111111111111221111112000lK1101W0Q00b..0k00000+0.00000uu+q.bbbbbbbbbb"; break; }
        case 7: { shopType = "Kissing"; strTemp = "111111111111111111111111221111112000p11101W0000...0k00000...0000A00K..bbbbbbbbbb"; oGame.damsel = true; break; }
    }
}
else if (roomPath == 6) // Lady Xoc
{
    strTemp = "000000000000X0000000000000000000000000000000000000000000000000000000001111111111";
}
else if (roomPath == 7) // pit top
{
    strTemp = "0000000000000000000000000000000000000000000100100000110011000111;01110111BBBB111";
}
else if (roomPath == 8) // pit
{
    strTemp = "11200002111120000211112000021111200002111120000211112000021111200002111120000211";
}
else if (roomPath == 9) // pit bottom
{
    strTemp = "112000021111200002111120000211113wwww311113wwww311113wwww31111RRRRRR111111111111";
}
else // drop
{
    switch(rand(1,8))
    {
        case 1: { strTemp = "00000000000000000000000000000000000000000000000000000000000000444044401111101111"; break; }
        case 2: { strTemp = "00000000000000000000000000000000000000000000000000000000000004440004441111000111"; break; }
        case 3: { strTemp = "00000000006000060000000000000000000000006000060000000000000000000000001000000001"; break; }
        case 4: { strTemp = "00000000000000000000000000000000000000000000000000000000000000000000001000111111"; break; }
        case 5: { strTemp = "00000000000000000000000000000000000000000000000000000000000000000000001111110001"; break; }
        case 6: { strTemp = "00000000000060000000000000000000000000000000000000001112220000100000001110111111"; break; }
        case 7: { strTemp = "00000000000060000000000000000000000000000000000000002221110000000001001111110111"; break; }
        case 8: { strTemp = "00000000000060000000000000000000000000000000000000001011010000100001001111001111"; break; }
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
        switch(rand(1,10))
        {
            case 1: { strObs1 = "11111"; strObs2 = "00000"; strObs3 = "00000"; break; }
            case 2: { strObs1 = "22222"; strObs2 = "00000"; strObs3 = "00000"; break; }
            case 3: { strObs1 = "22200"; strObs2 = "22200"; strObs3 = "00000"; break; }
            case 4: { strObs1 = "02220"; strObs2 = "02220"; strObs3 = "00000"; break; }
            case 5: { strObs1 = "00222"; strObs2 = "00222"; strObs3 = "00000"; break; }
            case 6: { strObs1 = "00000"; strObs2 = "01110"; strObs3 = "00000"; break; }
            case 7: { strObs1 = "00000"; strObs2 = "01110"; strObs3 = "02220"; break; }
            case 8: { strObs1 = "00000"; strObs2 = "02220"; strObs3 = "01110"; break; }
            case 9: { strObs1 = "00000"; strObs2 = "20100"; strObs3 = "00111"; break; }
            case 10: { strObs1 = "00000"; strObs2 = "00102"; strObs3 = "11100"; break; }
        }
    }
    else if (tile == "r") // air
    {
        switch(rand(1,10))
        {
            case 1: { strObs1 = "1111"; strObs2 = "0000"; strObs3 = "0000"; break; }
            case 2: { strObs1 = "2222"; strObs2 = "0000"; strObs3 = "0000"; break; }
            case 3: { strObs1 = "2220"; strObs2 = "2220"; strObs3 = "0000"; break; }
            case 4: { strObs1 = "0222"; strObs2 = "0222"; strObs3 = "0000"; break; }
            case 5: { strObs1 = "2222"; strObs2 = "0000"; strObs3 = "2222"; break; }
            case 6: { strObs1 = "0000"; strObs2 = "1111"; strObs3 = "0000"; break; }
            case 7: { strObs1 = "0000"; strObs2 = "1111"; strObs3 = "2222"; break; }
            case 8: { strObs1 = "0000"; strObs2 = "2222"; strObs3 = "1111"; break; }
            case 9: { strObs1 = "0000"; strObs2 = "0220"; strObs3 = "2112"; break; }
            case 10: { strObs1 = "0000"; strObs2 = "2002"; strObs3 = "1221"; break; }
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
    else if (tile == "r")
    {
        strTemp = string_delete(strTemp, j, 4);
        strTemp = string_insert(strObs1, strTemp, j);
        j += 10;
        strTemp = string_delete(strTemp, j, 4);
        strTemp = string_insert(strObs2, strTemp, j);
        j += 10;
        strTemp = string_delete(strTemp, j, 4);
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
            if (rand(1,100) == 1) instance_create(xpos, ypos, oLush);
            else if (rand(1,10) == 1) instance_create(xpos, ypos, oBlock);
            else instance_create(xpos, ypos, oTemple);
        }
        else if (tile == "2" and rand(1,2) == 1 and not collision_point(xpos, ypos, oSolid, 0, 0))
        {
            if (rand(1,10) == 1) instance_create(xpos, ypos, oBlock);
            else instance_create(xpos, ypos, oTemple);
        }
        else if (tile == "3" and not collision_point(xpos, ypos, oSolid, 0, 0))
        {
            if (rand(1,2) == 1) instance_create(xpos, ypos, oLava);
            else instance_create(xpos, ypos, oTemple);
        }
        else if (tile == "R" and not collision_point(xpos, ypos, oSolid, 0, 0))
        {
            block = instance_create(xpos, ypos, oTemple);
            with block { treasure = "Big Ruby"; }
        }
        else if (tile == "L") instance_create(xpos, ypos, oLadderOrange);
        else if (tile == "P") instance_create(xpos, ypos, oLadderTop);
        else if (tile == "7" and rand(1,3) == 1) instance_create(xpos, ypos, oSpikes);
        else if (tile == "4" and rand(1,4) == 1) instance_create(xpos, ypos, oPushBlock);
        else if (tile == "9")
        {
            block = instance_create(xpos, ypos+16, oTemple);
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
            instance_create(xpos+8, ypos+8, oChest);
        }
        else if (tile == "c")
        {
            if (rand(1,2) == 1) instance_create(xpos+8, ypos+8, oChest);
            else instance_create(xpos+8, ypos+8, oCrate);
        }
        else if (tile == "t")
        {
            if (rand(1,120) == 1) instance_create(xpos+8, ypos+12, oRubyBig);
            else if (rand(1,80) == 1) instance_create(xpos+8, ypos+12, oSapphireBig);
            else if (rand(1,60) == 1) instance_create(xpos+8, ypos+12, oEmeraldBig);
            else instance_create(xpos+8, ypos+8, oGoldBars);
        }
        else if (tile == "x")
        {
            instance_create(xpos, ypos, oSacAltarLeft);
            instance_create(xpos+16, ypos, oSacAltarRight);
            tile_add(bgKaliBody, 0, 0, 64, 64, xpos-16, ypos-48, 10001);
            instance_create(xpos+16, ypos-80+16, oKaliHead);
        }
        else if (tile == "X")
        {
            for (l = 0; l < 6; l += 1)
            {
                for (k = 0; k < 5; k += 1)
                {
                    obj = instance_create(xpos+k*16, ypos+l*16, oXocBlock);
                    if (k == 2 and l == 1) obj.treasure = "Diamond";
                    if (k == 1 and l == 2) obj.treasure = "Sapphire";
                    if (k == 3 and l == 2) obj.treasure = "Sapphire";
                    if (k == 0 and l == 3) obj.treasure = "Emerald";
                    if (k == 4 and l == 3) obj.treasure = "Emerald";
                    if (k == 2 and l == 4) obj.treasure = "Ruby";
                    tile_add(bgLadyXoc, k*16, l*16, 16, 16, xpos+k*16, ypos+l*16, 99);
                }
            }
        }
        else if (tile == "I")
        {
            instance_create(xpos+16, ypos+12, oGoldIdol);
        }
        else if (tile == ";")
        {
            obj = instance_create(xpos+8, ypos+8, oDamsel);
            obj.cost = 0;
            obj.forSale = false;
            instance_create(xpos+16+8, ypos+12, oGoldIdol);
        }
        else if (tile == "B")
        {
            if (rand(1,1) == 1) instance_create(xpos, ypos, oTrapBlock);
        }
        else if (tile == "C")
        {
            instance_create(xpos, ypos, oCeilingTrap);
        }
        else if (tile == "D")
        {
            instance_create(xpos, ypos, oDoor);
            instance_create(xpos, ypos, oTempleFake);
            instance_create(xpos, ypos+16, oTempleFake);
        }
        else if (tile == "A")
        {
            obj = instance_create(xpos+8, ypos+8, oDamsel);
            obj.forSale = true;
            obj.status = 5;
        }
        else if (tile == "?")
        {
            instance_create(xpos, ypos, oTombLord);
        }
        else if (tile == "." and not collision_point(xpos, ypos, oSolid, 0, 0))
        {
            obj = instance_create(xpos, ypos, oTemple);
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
            obj = instance_create(xpos, ypos, oTemple);
            obj.shopWall = true;
        }
        else if (tile == "l")
        {
            instance_create(xpos, ypos, oLamp);
        }
        else if (tile == "p")
        {
            instance_create(xpos, ypos, oLampRed);
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

        else if (tile == "w")
        {
            instance_create(xpos, ypos, oLava);
        }
        else if (tile == "u")
        {
            instance_create(xpos+8, ypos+8, oDice);
        }
        else if (tile == "d")
        {
            instance_create(xpos, ypos, oLush);
        }
        else if (tile == "e")
        {
            if (rand(1,2) == 1) instance_create(xpos, ypos, oLush);
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
