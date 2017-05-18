//
// scrCreateTile(tile, x, y)
//
// Creates a tile in the level editor.
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

obj = 0;

if (collision_rectangle(argument1, argument2, argument1+15, argument2+15, oDrawnSprite, 0, 0))
{
    obj = instance_position(argument1+8, argument2+12, oDrawnSprite);
    if (not obj) obj = instance_position(argument1+8, argument2+4, oDrawnSprite);
    if (obj)
    {
        with obj
        {
            if (type == "Giant Spider" or type == "Mega Mouth" or type == "Yeti King" or type == "Alien Boss"  or type == "Tomb Lord")
            {
                if (x == argument1 and y == argument2)
                {
                    instance_destroy();
                }
            }
            else instance_destroy();
        }
    }
}

if (argument0 == "@")
{
    obj = instance_create(argument1, argument2, oEntrance);
}
else if (argument0 == "X")
{
    obj = instance_create(argument1, argument2, oExit);
}
else if (argument0 == "I")
{
    obj = instance_create(argument1, argument2, oMsgSign);
}
else if (argument0 == "1")
{
    obj = instance_create(argument1, argument2, oBrick);
    obj.sprite_index = sBrick;
}
else if (argument0 == "2")
{
    obj = instance_create(argument1, argument2, oLush);
    obj.sprite_index = sLush;
}
else if (argument0 == "w")
{
    obj = instance_create(argument1, argument2, oWaterTile);
}
else if (argument0 == "3")
{
    obj = instance_create(argument1, argument2, oDark);
    obj.sprite_index = sDark;
}
else if (argument0 == "i")
{
    obj = instance_create(argument1, argument2, oIceTile);
}
else if (argument0 == "d")
{
    obj = instance_create(argument1, argument2, oDarkFall);
}
else if (argument0 == "4")
{
    obj = instance_create(argument1, argument2, oTemple);
    obj.sprite_index = sTemple;
}
else if (argument0 == "l")
{
    obj = instance_create(argument1, argument2, oLavaTile);
}
else if (argument0 == "L")
{
    obj = instance_create(argument1, argument2, oLadderOrange);
}
else if (argument0 == "P")
{
    obj = instance_create(argument1, argument2, oLadderTop);
}
else if (argument0 == "v")
{
    obj = instance_create(argument1, argument2, oVine);
}
else if (argument0 == "t")
{
    obj = instance_create(argument1, argument2, oVineTop);
}
else if (argument0 == "|")
{
    obj = instance_create(argument1, argument2, oTreeTile);
}
else if (argument0 == "x")
{
    obj = instance_create(argument1, argument2, oTreeTile);
    obj.sprite_index = sTreeTop;
}
else if (argument0 == ")")
{
    obj = instance_create(argument1, argument2, oLeavesTile);
}
else if (argument0 == "q")
{
    obj = instance_create(argument1, argument2, oTreeBranchTile);
}
else if (argument0 == "B")
{
    obj = instance_create(argument1, argument2, oBlock);
}
else if (argument0 == "&")
{
    obj = instance_create(argument1, argument2, oWebTile);
}
else if (argument0 == "r")
{
    obj = instance_create(argument1, argument2, oRockTile);
}
else if (argument0 == "j")
{
    obj = instance_create(argument1, argument2, oJarTile);
}
else if (argument0 == "k")
{
    obj = instance_create(argument1, argument2, oBonesTile);
}
else if (argument0 == "b")
{
    obj = instance_create(argument1, argument2, oBatTile);
}
else if (argument0 == "n")
{
    obj = instance_create(argument1, argument2, oSnakeTile);
}
else if (argument0 == "s")
{
    obj = instance_create(argument1, argument2, oSpiderTile);
}
else if (argument0 == "S")
{
    obj = instance_create(argument1, argument2, oGiantSpiderTile);
}
else if (argument0 == "K")
{
    obj = instance_create(argument1, argument2, oSkeletonTile);
}
else if (argument0 == "h")
{
    obj = instance_create(argument1, argument2, oCavemanTile);
}
else if (argument0 == "!")
{
    obj = instance_create(argument1, argument2, oShopkeeperTile);
}
else if (argument0 == "f")
{
    obj = instance_create(argument1, argument2, oFrogTile);
}
else if (argument0 == "F")
{
    obj = instance_create(argument1, argument2, oFireFrogTile);
}
else if (argument0 == "z")
{
    obj = instance_create(argument1, argument2, oZombieTile);
}
else if (argument0 == "A")
{
    obj = instance_create(argument1, argument2, oVampireTile);
}
else if (argument0 == "p")
{
    obj = instance_create(argument1, argument2, oPiranhaTile);
}
else if (argument0 == "{")
{
    obj = instance_create(argument1, argument2, oMegaMouthTile);
}
else if (argument0 == "M")
{
    obj = instance_create(argument1, argument2, oManTrapTile);
}
else if (argument0 == "m")
{
    obj = instance_create(argument1, argument2, oMonkeyTile);
}
else if (argument0 == "y")
{
    obj = instance_create(argument1, argument2, oYetiTile);
}
else if (argument0 == "Y")
{
    obj = instance_create(argument1, argument2, oYetiKingTile);
}
else if (argument0 == "a")
{
    obj = instance_create(argument1, argument2, oAlienTile);
}
else if (argument0 == "U")
{
    obj = instance_create(argument1, argument2, oUFOTile);
}
else if (argument0 == "E")
{
    obj = instance_create(argument1, argument2, oAlienBossTile);
}
else if (argument0 == "H")
{
    obj = instance_create(argument1, argument2, oHawkmanTile);
}
else if (argument0 == "T")
{
    obj = instance_create(argument1, argument2, oTombLordTile);
}
else if (argument0 == "^")
{
    obj = instance_create(argument1, argument2, oSpikes);
}
else if (argument0 == "<")
{
    obj = instance_create(argument1, argument2, oArrowTrapLeft);
}
else if (argument0 == ">")
{
    obj = instance_create(argument1, argument2, oArrowTrapRight);
}
else if (argument0 == "]")
{
    obj = instance_create(argument1, argument2, oSpearTrapTileTop);
}
else if (argument0 == "[")
{
    obj = instance_create(argument1, argument2, oSpearTrapTileBot);
}
else if (argument0 == "_")
{
    obj = instance_create(argument1, argument2, oSpringTrapTile);
}
else if (argument0 == "+")
{
    obj = instance_create(argument1, argument2, oSmashTrapTile);
}
else if (argument0 == "$")
{
    obj = instance_create(argument1, argument2, oGoldBarTile);
}
else if (argument0 == "*")
{
    obj = instance_create(argument1, argument2, oGoldBarsTile);
}
else if (argument0 == "#")
{
    obj = instance_create(argument1, argument2, oGoldIdolTile);
}
else if (argument0 == "O")
{
    obj = instance_create(argument1, argument2, oCrystalSkullTile);
}
else if (argument0 == "5")
{
    obj = instance_create(argument1, argument2, oEmeraldBigTile);
}
else if (argument0 == "6")
{
    obj = instance_create(argument1, argument2, oSapphireBigTile);
}
else if (argument0 == "7")
{
    obj = instance_create(argument1, argument2, oRubyBigTile);
}
else if (argument0 == "8")
{
    obj = instance_create(argument1, argument2, oDiamondTile);
}
else if (argument0 == "c")
{
    obj = instance_create(argument1, argument2, oChestTile);
}
else if (argument0 == "C")
{
    obj = instance_create(argument1, argument2, oCrateTile);
}
else if (argument0 == "D")
{
    obj = instance_create(argument1, argument2, oDamselTile);
}
else if (argument0 == ".")
{
    obj = instance_create(argument1, argument2, oBombBagTile);
}
else if (argument0 == ":")
{
    obj = instance_create(argument1, argument2, oBombBoxTile);
}
else if (argument0 == "u")
{
    obj = instance_create(argument1, argument2, oBombPasteTile);
}
else if (argument0 == "R")
{
    obj = instance_create(argument1, argument2, oRopePileTile);
}
else if (argument0 == "`")
{
    obj = instance_create(argument1, argument2, oParachuteTile);
}
else if (argument0 == "o")
{
    obj = instance_create(argument1, argument2, oCompassTile);
}
else if (argument0 == "/")
{
    obj = instance_create(argument1, argument2, oMacheteTile);
}
else if (argument0 == "~")
{
    obj = instance_create(argument1, argument2, oSpringShoesTile);
}
else if (argument0 == "V")
{
    obj = instance_create(argument1, argument2, oSpikeShoesTile);
}
else if (argument0 == "}")
{
    obj = instance_create(argument1, argument2, oBowTile);
}
else if (argument0 == "-")
{
    obj = instance_create(argument1, argument2, oPistolTile);
}
else if (argument0 == "=")
{
    obj = instance_create(argument1, argument2, oShotgunTile);
}
else if (argument0 == "W")
{
    obj = instance_create(argument1, argument2, oWebCannonTile);
}
else if (argument0 == "%")
{
    obj = instance_create(argument1, argument2, oSpectaclesTile);
}
else if (argument0 == "G")
{
    obj = instance_create(argument1, argument2, oGlovesTile);
}
else if (argument0 == "g")
{
    obj = instance_create(argument1, argument2, oMittTile);
}
else if (argument0 == "?")
{
    obj = instance_create(argument1, argument2, oTeleporterTile);
}
else if (argument0 == "(")
{
    obj = instance_create(argument1, argument2, oMattockTile);
}
else if (argument0 == "\")
{
    obj = instance_create(argument1, argument2, oCapeTile);
}
else if (argument0 == "J")
{
    obj = instance_create(argument1, argument2, oJetpackTile);
}
if (obj)
{
    obj.depth = 100;
    if (argument0 == "@" or argument0 == "X" or argument0 == "I")
        obj.depth -= (floor(room_width/16)-floor(argument1/16));
}
