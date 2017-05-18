//
// scrEntityGen()
//
// Generates enemies, traps, and treasure.
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

// Note: depth of trees, statues is 9005

global.LockedChest = false;
global.Key = false;
global.lockedChestChance = 8;

if (global.levelType == 0)
{
    global.giantSpider = false;
    global.genGiantSpider = false;
    if (rand(1,6) == 1) global.genGiantSpider = true;
    with oSolid
    {
        if (not isInShop(x, y) and y > 16)
        {
            if (type != "Altar")
            {
                scrTreasureGen(0);
            }
        
            // enemies
            if (scrGetRoomX(x) != global.startRoomX or scrGetRoomY(y-16) != global.startRoomY)
            {
                if (y < room_height - 64 and 
                    not collision_point(x, y+16, oSolid, 0, 0) and not collision_point(x, y+32, oSolid, 0, 0) and
                    not collision_point(x, y+16, oWater, 0, 0) and not collision_point(x, y+32, oWater, 0, 0) and
                    not collision_point(x, y+16, oEnemy, 0, 0))
                {
                    if (global.genGiantSpider and
                        not global.giantSpider and
                        not collision_point(x+16, y+16, oSolid, 0, 0) and
                        not collision_point(x+16, y+32, oSolid, 0, 0) and
                        rand(1,40) == 1)
                    {
                        instance_create(x, y+16, oGiantSpiderHang);
                        global.giantSpider = true;
                    }
                    else if (global.darkLevel and rand(1,60) == 1) instance_create(x, y+16, oLamp);
                    else if (global.darkLevel and rand(1,40) == 1) instance_create(x, y+16, oScarab);
                    else if (rand(1,60) == 1) instance_create(x, y+16, oBat);
                    else if (rand(1,80) == 1) instance_create(x, y+16, oSpiderHang);
                }
            
                if (not collision_point(x, y-16, oSolid, 0, 0))
                {
                    if (rand(1,60) == 1) instance_create(x, y-16, oSnake);
                    else if (rand(1,800) == 1) instance_create(x, y-16, oCaveman);
                }
            }
        }
    }
    
    // force generate chest
    if (global.genUdjatEye and not global.LockedChest)
    {
        with oExit
        {
            if (not collision_point(x-8, y, oSolid, 0, 0) and
                not collision_point(x-8, y+15, oTreasure, 0, 0) and
                not collision_point(x-8, y+8, oChest, 0, 0) and
                not collision_point(x-8, y+8, oSpikes, 0, 0))
            {
                instance_create(x-8, y+8, oLockedChest);
                global.LockedChest = true;
                break;
            }
            else if (not collision_point(x+8, y, oSolid, 0, 0) and
                     not collision_point(x+8, y+15, oTreasure, 0, 0) and
                     not collision_point(x+8, y+8, oChest, 0, 0) and
                     not collision_point(x+8, y+8, oSpikes, 0, 0))
            {
                instance_create(x+16+8, y+8, oLockedChest);
                global.LockedChest = true;
                break;
            }
            else
            {
                instance_create(x+8, y+8, oLockedChest);
                global.LockedChest = true;
                break;
            }
        }
    }
    
    // generate key if locked chest has been generated
    if (instance_exists(oLockedChest))
    {
        n = 1;
        while (n < 8 and global.Key == false)
        {
            with oTreasure
            {
                if (rand(1,8) <= 1 and not collision_point(x, y, oSolid, 0, 0) and global.Key == false)
                {
                    if (type == "Gold Bars") instance_create(x, y+4, oKey);
                    else instance_create(x, y, oKey);
                    global.Key = true;
                    instance_destroy();
                    break;
                }
            }
            n += 1;
        }
        if (not global.Key)
        {
            with oTreasure
            {
                if (not collision_point(x, y, oSolid, 0, 0))
                {
                    if (type == "Gold Bars") instance_create(x, y+4, oKey);
                    else instance_create(x, y, oKey);
                    global.Key = true;
                    instance_destroy();
                    break;
                }
            }
        }
    }
    
    if (global.Key) global.madeUdjatEye = true;
    
    with oBlock
    {
        if (not isInShop(x, y))
        {
            n = point_distance(x, y, oEntrance.x, oEntrance.y);
            if (not isInShop(x, y) and
                rand(1,4) == 1 and not
                (y == oEntrance.y and n < 144) and
                n > 48)
            {
                if (collision_point(x+16, y, oSolid, 0, 0) and not
                    collision_rectangle(x-32, y, x-1, y+15, oSolid, 0, 0))
                {
                    if (global.darkLevel) instance_create(x, y, oArrowTrapLeftLit);
                    else instance_create(x, y, oArrowTrapLeft);
                    instance_destroy();
                }
                else if (collision_point(x-16, y, oSolid, 0, 0) and not
                    collision_rectangle(x+16, y, x+48, y+15, oSolid, 0, 0))
                {
                    if (global.darkLevel) instance_create(x, y, oArrowTrapRightLit);
                    else instance_create(x, y, oArrowTrapRight);
                    instance_destroy();
                }
            }
        }
    }
}
else if (global.levelType == 1)
{
    global.ashGrave = false;
    if (global.cemetary)
    {
        with oLush
        {
            // generate graves
            if (not collision_point(x, y-16, oSolid, 0, 0) and
                not collision_point(x, y-16, oEntrance, 0, 0) and
                not collision_point(x, y-16, oExit, 0, 0) and
                rand(1,20) == 1 and
                x != 160 and x != 176 and x != 320 and x != 336 and x != 480 and x != 496)
            {
                obj = instance_create(x, y-16, oGrave);
                if (not global.ashGrave and rand(1,40) == 1)
                {
                    obj.sprite_index = sGraveAsh;
                    obj = instance_create(x+8, y+8, oShotgun);
                    obj.cost = 0;
                    obj.forSale = false;
                    ashGrave = true;                
                }
                else if (not collision_point(x+8, y+8, oTreasure, 0, 0))
                {
                    if (rand(1,2) == 1) instance_create(x+8, y+8, oGoldNugget);
                    else if (rand(1,4) == 1) instance_create(x+8, y+8, oSapphireBig);
                    else if (rand(1,6) == 1) instance_create(x+8, y+8, oEmeraldBig);
                    else if (rand(1,8) == 1) instance_create(x+8, y+8, oRubyBig);
                }
            }
        }
    }

    with oSolid
    {
        // bg
        if (rand(1,100) == 1 and not collision_point(x, y-16, oSolid, 0, 0)) tile_add(bgTrees, 0, 0, 16, 48, x, y-32, 9005);
        
        if (not isInShop(x, y))
        {
        
        if (y > 32 and collision_point(x, y-16, oSolid, 0, 0) and global.genMarketEntrance and not global.madeMarketEntrance)
        {
            obj = instance_place(x, y-16, oSolid);
            if (obj.type != "Tree" and type != "Altar" and not obj.invincible and rand(1,global.marketChance) <= 1)
            {
                instance_create(x, y-16, oXMarket);
                invincible = true;
                global.madeMarketEntrance = true;
            }
            else global.marketChance -= 1;
        }
        else if (type != "Tree" and type != "Altar" and y != 0 and
                 not collision_rectangle(x, y-32, x+15, y-1, oSolid, false, true) and
                 not collision_rectangle(x, y-16, x+15, y-1, oEnemy, 0, 0) and
                 (not collision_point(x-16, y, oSolid, 0, 0) or not collision_point(x+16, y, oSolid, 0, 0)) and
                 collision_point(x, y+16, oSolid, 0, 0) and
                 not collision_point(x, y, oXMarket, 0, 0) and
                 not isInShop(x, y) and
                 point_distance(x, y, oEntrance.x, oEntrance.y) > 64)
        {
            if (global.darkLevel and not collision_point(x, y-32, oWater, 0, 0) and rand(1,20) == 1)
            {
                instance_create(x, y-32, oTikiTorch);
            }
            else if (rand(1,12) == 1 and
                     x != 160 and x != 176 and x != 320 and x != 336 and x != 480 and x != 496)
            {
                if (collision_point(x, y-16, oSolid, 0, 0))
                {
                    sol = instance_nearest(x, y-16, oSolid);
                    with sol { cleanDeath = true; instance_destroy(); }
                }
                instance_create(x, y, oSpearTrapBottom);
                if (global.darkLevel) instance_create(x, y-16, oSpearTrapLit);
                else instance_create(x, y-16, oSpearTrapTop);
                cleanDeath = true;
                instance_destroy();
            }
        }
        
        if (type != "Altar")
        {
            if (global.cemetary) scrTreasureGen(10);
            else scrTreasureGen(0);
        }
    
        // enemies
        if (scrGetRoomX(x) != global.startRoomX or scrGetRoomY(y-16) != global.startRoomY)
        {
            if (y < room_height - 64 and 
                not collision_point(x, y+16, oSolid, 0, 0) and not collision_point(x, y+32, oSolid, 0, 0) and
                not collision_point(x, y+16, oWater, 0, 0) and not collision_point(x, y+32, oWater, 0, 0))
            {
                if (global.cemetary) n = 60;
                else n = 80;
                
                if (global.darkLevel and rand(1,40) == 1) instance_create(x, y+16, oScarab);
                else if (rand(1,n) == 1) instance_create(x, y+16, oBat);
                // else if (rand(1,40) == 1) instance_create(x, y+16, oSpiderHang);
            }
            
            if (y > 16 and not collision_point(x, y-16, oSolid, 0, 0) and
                not collision_point(x, y, oEnemy, 0, 0) and
                not collision_point(x, y, oSpikes, 0, 0))
            {
                if (global.cemetary)
                {
                    if (rand(1,25) == 1) instance_create(x, y-16, oZombie);
                    else if (rand(1,160) == 1) instance_create(x, y-16, oVampire);
                }
                else if (not collision_point(x, y-16, oWater, 0, 0))
                {
                    if (global.blackMarket and (y mod 128 == 0)) n = 0; // to prevent mantraps from spawning near shopkeepers in black market 
                    else n = 1;
                    if (rand(1,60) == n) instance_create(x, y-16, oManTrap);
                    else if (rand(1,60) == 1) instance_create(x, y-16, oCaveman);
                    else if (rand(1,120) == 1) instance_create(x, y-16, oFireFrog);
                    else if (rand(1,30) == 1) instance_create(x, y-16, oFrog);
                }
                else if (rand(1,120) == 1) instance_create(x, y-16, oFireFrog);
                else if (rand(1,30) == 1) instance_create(x, y-16, oFrog);
            }
        }
        
        // rock
        }
    }

    // force market entrance
    if (global.genMarketEntrance and not global.madeMarketEntrance)
    {
        with oSolid
        {
            if (y > 32 and collision_point(x, y-16, oSolid, 0, 0))
            {
                obj = instance_place(x, y-16, oSolid);
                if (obj.type != "Tree" and type != "Altar" and not obj.invincible)
                {
                    instance_create(x, y-16, oXMarket);
                    invincible = true;
                    global.madeMarketEntrance = true;
                }
            }
        }
    }
    
    with oVine
    {
        if (rand(1,15) == 1) instance_create(x, y, oMonkey);
    }
    
    with oWater
    {
        if (not collision_point(x, y, oSolid, 0, 0))
        {
            if (rand(1,30) == 1)
            {
                if (global.cemetary) instance_create(x+4, y+4, oDeadFish);
                else instance_create(x+4, y+4, oPiranha);
            }
        }
    }
}
else if (global.levelType == 2)
{
    with oSolid
    {
        if (not isInShop(x, y))
        {
        // enemies
        n = 30;
        if (global.yetiLair) n = 90;
        
        if (scrGetRoomX(x) != global.startRoomX or scrGetRoomY(y-16) != global.startRoomY)
        {
            if (y < room_height - 64 and 
                not collision_point(x, y+16, oSolid, 0, 0) and not collision_point(x, y+32, oSolid, 0, 0) and
                not collision_point(x, y+16, oWater, 0, 0) and not collision_point(x, y+32, oWater, 0, 0))
            {
                if (global.darkLevel and rand(1,40) == 1) instance_create(x, y+16, oScarab);
            }
            else if (y > 16 and y < 592 and not collision_point(x, y-16, oSolid, 0, 0) and not isInShop(x, y))
            {
                if (rand(1,n) == 1) instance_create(x, y-16, oUFO);
            }
        }
        
        if (y > 16 and y < 592 and
            not collision_point(x, y-16, oSolid, 0, 0) and
            not collision_point(x+8, y-8, oEnemy, 0, 0) and
            not collision_point(x+8, y-1, oSpikes, 0, 0) and
            point_distance(x, y, oEntrance.x, oEntrance.y) > 64 and
            not isInShop(x, y))
        {
            if (rand(1,10) == 1 and sprite_index = sDark and not collision_rectangle(x, y-64, x+15, y-1, oSolid, 0, 0) and distance_to_object(oExit) > 64) instance_create(x, y-16, oSpringTrap);
            else if (rand(1,20) == 1 and point_distance(x, y, oEntrance.x, oEntrance.y) > 64) instance_create(x, y-16, oYeti);
        }
        
        if (type != "Altar")
        {    
            scrTreasureGen(0);
        }
        }
    }
}
else if (global.levelType == 3)
{
    global.TombLord = false;
    global.genTombLord = false;
    if (global.currLevel == 13) global.genTombLord = true;
    else if (rand(1,4) == 1) global.genTombLord = true;
    
    global.genGoldEntrance = false;
    if (global.currLevel == 14) global.genGoldEntrance = true;
    global.madeGoldEntrance = false;

    with oSolid
    {   
        // bg
        if (rand(1,100) == 1 and not collision_point(x, y-16, oSolid, 0, 0)) tile_add(bgStatues, 0, 0, 16, 48, x, y-32, 9005);
    
        if (not isInShop(x, y))
        {
        
        // traps
        if (y > 32 and not collision_point(x, y-16, oSolid, 0, 0) and global.genGoldEntrance and not global.madeGoldEntrance)
        {
            if (rand(1,global.goldChance) == 1)
            {
                instance_create(x, y-16, oGoldDoor);
                invincible = true;
                global.madeGoldEntrance = true;
            }
            else global.goldChance -= 1;
        }
        else if (type != "Tree" and type != "Altar" and y != 0 and
                 not collision_point(x, y-16, oSolid, 0, 0) and
                 not collision_point(x, y-16, oLava, 0, 0) and
                 not collision_rectangle(x, y-16, x+15, y-1, oEnemy, 0, 0) and
                 not collision_point(x, y-32, oSolid, 0, 0) and
                 (not collision_point(x-16, y, oSolid, 0, 0) or not collision_point(x+16, y, oSolid, 0, 0)) and
                 collision_point(x, y+16, oSolid, 0, 0) and
                 not isInShop(x, y) and
                 x != 160 and x != 176 and x != 320 and x != 336 and x != 480 and x != 496)
        {
            if (rand(1,12) == 1 and point_distance(x, y, oEntrance.x, oEntrance.y) > 64)
            {
                // to keep the spear trap from plugging up lava passage
                if (collision_point(x-16, y-32, oSolid, 0, 0) and collision_point(x+16, y-32, oSolid, 0, 0) and
                    not collision_point(x, y-32, oSolid, 0, 0))
                {
                    // do nothing
                }
                else
                {
                    if (collision_point(x, y-16, oSolid, 0, 0))
                    {
                        sol = instance_nearest(x, y-16, oSolid);
                        with sol { cleanDeath = true; instance_destroy(); }
                    }
                    instance_create(x, y, oSpearTrapBottom);
                    if (global.darkLevel) instance_create(x, y-16, oSpearTrapLit);
                    else instance_create(x, y-16, oSpearTrapTop);
                    cleanDeath = true;
                    instance_destroy();
                }
            }
        }
    
        // enemies
        if (y < room_height - 64 and 
                not collision_point(x, y+16, oSolid, 0, 0) and not collision_point(x, y+32, oSolid, 0, 0) and
                not collision_point(x, y+16, oWater, 0, 0) and not collision_point(x, y+32, oWater, 0, 0))
        {
            if (global.darkLevel and rand(1,40) == 1) instance_create(x, y+16, oScarab);
        }

        if (scrGetRoomX(x) != global.startRoomX or scrGetRoomY(y-16) != global.startRoomY and
            not collision_point(x, y-16, oEnemy, 0, 0))
        {         
            if (y > 16 and not collision_point(x, y-16, oSolid, 0, 0))
            {
                if (global.genTombLord and
                    not global.TombLord and
                    not collision_rectangle(x, y-32, x+32, y-1, oSolid, 0, 0) and
                    rand(1,40) == 1)
                {
                    instance_create(x, y-32, oTombLord);
                    global.TombLord = true;
                }
                else if (rand(1,40) == 1) instance_create(x, y-16, oCaveman);
                else if (rand(1,40) == 1) instance_create(x, y-16, oHawkman);
                else if (rand(1,60) == 1)
                {
                    if (global.darkLevel) instance_create(x, y-16, oSmashTrapLit);
                    else instance_create(x, y-16, oSmashTrap);
                }
            }
        }
        
        if (type != "Altar")
        {       
            scrTreasureGen(0);
        }
        }
    }
    
    // force generate gold door
    if (global.genGoldEntrance and not global.madeGoldEntrance)
    {
        with oSolid
        {
            if (y > 32 and not collision_point(x, y-16, oSolid, 0, 0))
            {
                instance_create(x, y-16, oGoldDoor);
                invincible = true;
                global.madeGoldEntrance = true;
                break;
            }
        }
    }
    
    with oBlock
    {   
        cleanDeath = true;
        if (not isInShop(x, y))
        {
            n = point_distance(x, y, oEntrance.x, oEntrance.y);
            if (not isInShop(x, y) and
                rand(1,3) == 1 and not
                (y == oEntrance.y and n < 144) and
                n > 48)
            {
                if (collision_point(x+16, y, oSolid, 0, 0) and not
                    collision_rectangle(x-32, y, x-1, y+15, oSolid, 0, 0))
                {
                    if (global.darkLevel) instance_create(x, y, oArrowTrapLeftLit);
                    else instance_create(x, y, oArrowTrapLeft);
                    instance_destroy();
                }
                else if (collision_point(x-16, y, oSolid, 0, 0) and not
                    collision_rectangle(x+16, y, x+48, y+15, oSolid, 0, 0))
                {
                    if (global.darkLevel) instance_create(x, y, oArrowTrapRightLit);
                    else instance_create(x, y, oArrowTrapRight);
                    instance_destroy();
                }
            }
        }
    }
}

// add box of flares to dark level
if (global.darkLevel)
{
    with oEntrance
    {
        if (not collision_point(x-16, y, oSolid, 0, 0))
        {
            instance_create(x-16+8, y+8, oFlareCrate);
        }
        else if (not collision_point(x+16, y, oSolid, 0, 0))
        {
            instance_create(x+16+8, y+8, oFlareCrate);
        }
        else
        {
            instance_create(x+8, y+8, oFlareCrate);
        }
    }
}

global.cleanSolids = false;
