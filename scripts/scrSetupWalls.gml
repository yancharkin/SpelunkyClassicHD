//
// scrSetupWalls()
//
// Adds decorations to walls, changes their sprites depending on placement.
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

with oBrick
{
    up = false;
    down = false;
    left = false;
    right = false;

    if (y == 0 or collision_point(x, y-16, oBrick, 0, 0) or collision_point(x, y-16, oHardBlock, 0, 0)) { up = true; }
    if (y >= argument0 or collision_point(x, y+16, oBrick, 0, 0) or collision_point(x, y+16, oHardBlock, 0, 0)) { down = true; }
    if (collision_point(x-16, y, oBrick, 0, 0) or collision_point(x-16, y, oHardBlock, 0, 0)) { left = true; }
    if (collision_point(x+16, y, oBrick, 0, 0) or collision_point(x+16, y, oHardBlock, 0, 0)) { right = true; }

    if (not up)
    {
        sprite_index = sCaveUp;
        if (global.graphicsHigh)
        {
            // DFK used to be y-16, not y-4, on these next two lines
            //if (rand(1,3) < 3) tile_add2(bgCaveTop, 0, 0, 16, 16, x, y-4, 3);
            //else tile_add2(bgCaveTop, 16, 0, 16, 16, x, y-4, 3);
            if (rand(1,3) < 3) tile_add2(bgCaveTop, 0, 0, 16, 16, x, y-16, 3);
            else tile_add2(bgCaveTop, 16, 0, 16, 16, x, y-16, 3);
        }
        // instance_create(x, y-16, oCaveTop);
    }
    
    if (not down)
    {
        if (not up) sprite_index = sCaveUp2;
        else sprite_index = sBrickDown;
        //instance_create(x, y+16, oCaveBottom);
    }
    
    
    /*if (not left)
    {
        instance_create(x-16, y, oCaveLeft);
    }
    
    if (not right)
    {
        instance_create(x+15, y, oCaveRight);
    }*/
    
    
    
}

with oLush
{
    up = false;
    down = false;
    left = false;
    right = false;

    if (y == 0 or collision_point(x, y-16, oLush, 0, 0)) { up = true; }
    if (y >= argument0 or collision_point(x, y+16, oLush, 0, 0)) { down = true; }
    if (collision_point(x-16, y, oLush, 0, 0)) { left = true; }
    if (collision_point(x+16, y, oLush, 0, 0)) { right = true; }


    if (not up)
    {
        sprite_index = sLushUp;
        if (global.graphicsHigh)
        {
            if (rand(1,8) == 1) tile_add2(bgCaveTop2, 32, 0, 16, 16, x, y-16, 3);
            else if (rand(1,3) < 3) tile_add2(bgCaveTop2, 0, 0, 16, 16, x, y-16, 3);
            else tile_add2(bgCaveTop2, 16, 0, 16, 16, x, y-16, 3);
        }
    }
    
    if (not down)
    {
        if (not up) sprite_index = sLushUp2;
        else sprite_index = sLushDown;
        
        if (not collision_point(x, y+16, oSolid, 0, 0) and global.graphicsHigh)
        {
            if (rand(1,12) == 1) tile_add2(bgCaveTop2, 48, 0, 16, 16, x, y+16, 3);
            else if (rand(1,12) == 1) tile_add2(bgCaveTop2, 64, 0, 16, 16, x, y+16, 3);
        }
        //instance_create(x, y+16, oLushBottom);
    }
    
}

with oDark
{
    up = false;
    down = false;
    left = false;
    right = false;

    if (y == 0 or collision_point(x, y-16, oDark, 0, 0)) { up = true; }
    if (y >= argument0 or collision_point(x, y+16, oDark, 0, 0)) { down = true; }
    if (collision_point(x-16, y, oDark, 0, 0)) { left = true; }
    if (collision_point(x+16, y, oDark, 0, 0)) { right = true; }

    if (not up)
    {
        sprite_index = sDarkUp;
        if (global.graphicsHigh)
        {
            //if (rand(1,3) < 3) tile_add2(bgCaveTop3, 0, 0, 16, 16, x, y/*-16*/, 3);
            //else tile_add2(bgCaveTop3, 16, 0, 16, 16, x, y/*-16*/, 3);
            if (rand(1,3) < 3) tile_add2(bgCaveTop3, 0, 0, 16, 16, x, y-16, 3);
            else tile_add2(bgCaveTop3, 16, 0, 16, 16, x, y-16, 3);
        }
    }

    if (not down)
    {
        if (not up) sprite_index = sDarkUp2;
        else sprite_index = sDarkDown;
        //instance_create(x, y+16, oDarkBottom);
    }
    
    /*
    if (not left)
    {
        instance_create(x-16, y, oDarkLeft);
    }
    
    if (not right)
    {
        instance_create(x+15, y, oDarkRight);
    }
    */
}

with oIce
{
    up = false;
    down = false;
    left = false;
    right = false;

    if (collision_point(x, y-16, oIce, 0, 0)) { up = true; }
    if (collision_point(x, y+16, oIce, 0, 0)) { down = true; }
    if (collision_point(x-16, y, oIce, 0, 0)) { left = true; }
    if (collision_point(x+16, y, oIce, 0, 0)) { right = true; }

    if (not up)
    {
        sprite_index = sIceUp;
    }
    if (not down)
    {
        if (not up) sprite_index = sIceUp2;
        else sprite_index = sIceDown;
        if (rand(1,20) == 1 and not collision_point(x, y+16, oSolid, 0, 0)) instance_create(x, y+16, oIceBottom);
    }
    if (not left)
    {
        if (not up and not down) sprite_index = sIceUDL;
        else if (not up) sprite_index = sIceUL;
        else if (not down) sprite_index = sIceDL;
        else sprite_index = sIceLeft;
    }
    if (not right)
    {
        if (not up and not down) sprite_index = sIceUDR;
        else if (not up) sprite_index = sIceUR;
        else if (not down) sprite_index = sIceDR;
        else sprite_index = sIceRight;
    }
    if (not up and not left and not right and down) sprite_index = sIceULR;
    if (not down and not left and not right and up) sprite_index = sIceDLR;
    if (up and down and not left and not right) sprite_index = sIceLR;
    if (not up and not down and not left and not right)
    {
        sprite_index = sIceBlock;
    }
}

with oTemple
{
    up = false;
    down = false;
    left = false;
    right = false;

    if (y == 0 or collision_point(x, y-16, oTemple, 0, 0) or collision_point(x, y+16, oTempleFake, 0, 0)) { up = true; }
    if (y >= argument0 or collision_point(x, y+16, oTemple, 0, 0) or collision_point(x, y+16, oTempleFake, 0, 0)) { down = true; }
    if (collision_point(x-16, y, oTemple, 0, 0) or collision_point(x-16, y, oTempleFake, 0, 0)) { left = true; }
    if (collision_point(x+16, y, oTemple, 0, 0) or collision_point(x+16, y, oTempleFake, 0, 0)) { right = true; }

    if (global.cityOfGold)
    {
    
    if (not up)
    {
        sprite_index = sGTempleUp;
        if (global.graphicsHigh)
        {
            if (rand(1,4) == 1) tile_add2(bgCaveTop4, 0, 0, 16, 16, x, y-16, 3);
            else if (rand(1,4) == 1) tile_add2(bgCaveTop4, 16, 0, 16, 16, x, y-16, 3);
        }
        if (not left and not right)
        {
        if (not down) sprite_index = sGTempleUp6;
        else sprite_index = sGTempleUp5;
        }
        else if (not left)
        {   
        if (not down) sprite_index = sGTempleUp7;
        else sprite_index = sGTempleUp3;
        }
        else if (not right)
        {   
        if (not down) sprite_index = sGTempleUp8;
        else sprite_index = sGTempleUp4;
        }
        else if (left and right and not down)
        {
        sprite_index = sGTempleUp2;
        }
    }
    else if (not down)
    {
        sprite_index = sGTempleDown;
    }
    
    }
    else {
    if (not up)
    {
        sprite_index = sTempleUp;
        if (global.graphicsHigh)
        {
            if (rand(1,4) == 1) tile_add2(bgCaveTop4, 0, 0, 16, 16, x, y-16, 3);
            else if (rand(1,4) == 1) tile_add2(bgCaveTop4, 16, 0, 16, 16, x, y-16, 3);
        }
        if (not left and not right)
        {
        if (not down) sprite_index = sTempleUp6;
        else sprite_index = sTempleUp5;
        }
        else if (not left)
        {   
        if (not down) sprite_index = sTempleUp7;
        else sprite_index = sTempleUp3;
        }
        else if (not right)
        {   
        if (not down) sprite_index = sTempleUp8;
        else sprite_index = sTempleUp4;
        }
        else if (left and right and not down)
        {
        sprite_index = sTempleUp2;
        }
    }
    else if (not down)
    {
        sprite_index = sTempleDown;
    }}
}

with oTempleFake
{
    up = false;
    down = false;
    left = false;
    right = false;

    if (y == 0 or collision_point(x, y-16, oTemple, 0, 0) or collision_point(x, y-16, oTempleFake, 0, 0)) { up = true; }
    if (collision_point(x, y+16, oTemple, 0, 0) or collision_point(x, y+16, oTempleFake, 0, 0)) { down = true; }
    if (collision_point(x-16, y, oTemple, 0, 0) or collision_point(x-16, y, oTempleFake, 0, 0)) { left = true; }
    if (collision_point(x+16, y, oTemple, 0, 0) or collision_point(x+16, y, oTempleFake, 0, 0)) { right = true; }

    if (global.cityOfGold)
    {
    
    if (not up)
    {
        sprite_index = sGTempleUp;
        if (global.graphicsHigh)
        {
            if (rand(1,4) == 1) tile_add2(bgCaveTop4, 0, 0, 16, 16, x, y-16, 3);
            else if (rand(1,4) == 1) tile_add2(bgCaveTop4, 16, 0, 16, 16, x, y-16, 3);
        }
        if (not left and not right)
        {
        if (not down) sprite_index = sGTempleUp6;
        else sprite_index = sGTempleUp5;
        }
        else if (not left)
        {   
        if (not down) sprite_index = sGTempleUp7;
        else sprite_index = sGTempleUp3;
        }
        else if (not right)
        {   
        if (not down) sprite_index = sGTempleUp8;
        else sprite_index = sGTempleUp4;
        }
        else if (left and right and not down)
        {
        sprite_index = sGTempleUp2;
        }
    }
    else if (not down)
    {
        sprite_index = sGTempleDown;
    }
    
    }
    else {

    if (not up)
    {
        sprite_index = sTempleUp;
        if (not left and not right)
        {
        if (not down) sprite_index = sTempleUp6;
        else sprite_index = sTempleUp5;
        }
        else if (not left)
        {   
        if (not down) sprite_index = sTempleUp7;
        else sprite_index = sTempleUp3;
        }
        else if (not right)
        {   
        if (not down) sprite_index = sTempleUp8;
        else sprite_index = sTempleUp4;
        }
        else if (left and right and not down)
        {
        sprite_index = sTempleUp2;
        }
    }
    else if (not down)
    {
        sprite_index = sTempleDown;
    }}
}

with oWater
{
    if (type == "Water")
    { 
    up = false;
    upWater = false;
    down = false;
    left = false;
    right = false;

    if (collision_point(x, y-16, oWater, 0, 0)) { upWater = true; }
    if (collision_point(x, y-16, oSolid, 0, 0)) { up = true; }
    if (collision_point(x, y+16, oSolid, 0, 0) and not collision_point(x, y+16, oWater, 0, 0)) { down = true; }

    if (not up and not upWater)
    {
        sprite_index = sWaterTop;
    }
    
    if (upWater and collision_point(x, y-32, oWater, 0, 0) and down and rand(1,4) == 1)
    {
        sprite_index = sWaterBottomTall2;
        water = instance_place(x, y-16, oWater);
        if (water) water.sprite_index = sWaterBottomTall1;
    }
    else if ((up or upWater) and down)
    {
        n = rand(1,4);
        switch (n)
        {
        case 1: { sprite_index = sWaterBottom; break; }
        case 2: { sprite_index = sWaterBottom2; break; }
        case 3: { sprite_index = sWaterBottom3; break; }
        case 4: { sprite_index = sWaterBottom4; break; }
        }
    }
    }
}

with oLava
{
    up = false;
    upWater = false;
    down = false;
    left = false;
    right = false;

    if (collision_point(x, y-16, oWater, 0, 0)) { upWater = true; }
    if (collision_point(x, y-16, oSolid, 0, 0)) { up = true; }
    if (collision_point(x, y+16, oSolid, 0, 0)) { down = true; }

    if (not up and not upWater)
    {
        sprite_index = sLavaTop;
        if (rand(1,4) == 1) spurt = true;
    }
    
    /*
    if (upWater and collision_point(x, y-32, oWater, 0, 0) and down and rand(1,4) == 1)
    {
        sprite_index = sWaterBottomTall2;
        water = instance_place(x, y-16, oWater);
        if (water) water.sprite_index = sWaterBottomTall1;
    }
    else if ((up or upWater) and down)
    {
        n = rand(1,4);
        switch (n)
        {
        case 1: { sprite_index = sWaterBottom; break; }
        case 2: { sprite_index = sWaterBottom2; break; }
        case 3: { sprite_index = sWaterBottom3; break; }
        case 4: { sprite_index = sWaterBottom4; break; }
        }
    }
    */
}

with oVine
{
    up = false;
    down = false;
    left = false;
    right = false;

    if (collision_point(x+8, y-8, oLadder, 0, 0)) { up = true; }
    if (collision_point(x+8, y+16, oLadder, 0, 0)) { down = true; }

    if (not up)
    {
        sprite_index = sVineSource;
    }
    else if (not down)
    {
        sprite_index = sVineBottom;
    }
}

with oBlock
{
    down = false;

    if (collision_point(x, y+16, oBrick, 0, 0) or collision_point(x, y+16, oTemple, 0, 0) or collision_point(x, y+16, oHardBlock, 0, 0)) { down = true; }

    // don't want push blocks next to lava until we tighten up liquid draining
    if (collision_point(x-16, y, oLava, 0, 0) or collision_point(x+16, y, oLava, 0, 0)) down = false;
    
    if (down and rand(1,4) == 1)
    {
        instance_create(x, y, oPushBlock);
        instance_destroy();
    }
}

with oTree
{
    up = false;
    down = false;
    left = false;
    right = false;

    if (collision_point(x, y-16, oTree, 0, 0)) { up = true; }
    if (collision_point(x, y+16, oTree, 0, 0)) { down = true; }
    if (collision_point(x-16, y, oTree, 0, 0)) { left = true; }
    if (collision_point(x+16, y, oTree, 0, 0)) { right = true; }
    
    if (not up)
    {
        if (global.cemetary) sprite_index = sTreeTopDead;
        else sprite_index = sTreeTop;
        depth = 1;
    }
}

with oTreeBranch
{
    up = false;
    down = false;
    left = false;
    right = false;

    if (collision_point(x, y-16, oLeaves, 0, 0)) { up = true; }
    if (collision_point(x, y+16, oTreeBranch, 0, 0)) { down = true; }
    if (collision_point(x-16, y, oTreeBranch, 0, 0)) { left = true; }
    if (collision_point(x+16, y, oTree, 0, 0)) { right = true; }
    
    if (up)
    {
        instance_destroy();
    }
    if (right)
    {
        if (global.cemetary) sprite_index = sTreeBranchDeadL;
        else sprite_index = sTreeBranchLeft;
    }
}
