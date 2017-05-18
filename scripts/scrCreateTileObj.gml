//
// scrCreateTileObj(tile, x, y)
//
// Creates an obj in the level loader.
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
    obj = instance_create(argument1, argument2, oWaterSwim);
}
else if (argument0 == "3")
{
    obj = instance_create(argument1, argument2, oDark);
    obj.sprite_index = sDark;
}
else if (argument0 == "i")
{
    obj = instance_create(argument1, argument2, oIce);
    with oFrozenCaveman { instance_destroy(); }
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
    obj = instance_create(argument1, argument2, oLava);
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
    obj = instance_create(argument1, argument2, oTree);
}
else if (argument0 == "x")
{
    obj = instance_create(argument1, argument2, oTree);
    obj.sprite_index = sTreeTop;
}
else if (argument0 == ")")
{
    obj = instance_create(argument1, argument2, oLeaves);
}
else if (argument0 == "q")
{
    obj = instance_create(argument1, argument2, oTreeBranch);
}
else if (argument0 == "B")
{
    obj = instance_create(argument1, argument2, oPushBlock);
}
else if (argument0 == "&")
{
    obj = instance_create(argument1, argument2, oWeb);
}
else if (argument0 == "r")
{
    obj = instance_create(argument1+8, argument2+12, oRock);
}
else if (argument0 == "j")
{
    obj = instance_create(argument1+8, argument2+10, oJar);
}
else if (argument0 == "k")
{
    obj = instance_create(argument1, argument2, oBones);
    obj = instance_create(argument1+12, argument2+12, oSkull);
}
else if (argument0 == "b")
{
    obj = instance_create(argument1, argument2, oBat);
}
else if (argument0 == "n")
{
    obj = instance_create(argument1, argument2, oSnake);
}
else if (argument0 == "s")
{
    obj = instance_create(argument1, argument2, oSpiderHang);
}
else if (argument0 == "S")
{
    obj = instance_create(argument1, argument2, oGiantSpiderHang);
}
else if (argument0 == "K")
{
    obj = instance_create(argument1, argument2, oSkeleton);
}
else if (argument0 == "h")
{
    obj = instance_create(argument1, argument2, oCaveman);
}
else if (argument0 == "!")
{
    obj = instance_create(argument1, argument2, oShopkeeper);
    obj.status = 4;
}
else if (argument0 == "f")
{
    obj = instance_create(argument1, argument2, oFrog);
}
else if (argument0 == "F")
{
    obj = instance_create(argument1, argument2, oFireFrog);
}
else if (argument0 == "z")
{
    obj = instance_create(argument1, argument2, oZombie);
}
else if (argument0 == "A")
{
    obj = instance_create(argument1, argument2, oVampire);
}
else if (argument0 == "p")
{
    obj = instance_create(argument1, argument2, oWaterSwim);
    obj = instance_create(argument1+4, argument2+4, oPiranha);
}
else if (argument0 == "{")
{
    instance_create(argument1, argument2, oWaterSwim);
    instance_create(argument1+16, argument2, oWaterSwim);
    instance_create(argument1+32, argument2, oWaterSwim);
    instance_create(argument1+48, argument2, oWaterSwim);
    instance_create(argument1, argument2+16, oWaterSwim);
    instance_create(argument1+16, argument2+16, oWaterSwim);
    instance_create(argument1+32, argument2+16, oWaterSwim);
    instance_create(argument1+48, argument2+16, oWaterSwim);
    obj = instance_create(argument1, argument2, oJaws);
}
else if (argument0 == "M")
{
    obj = instance_create(argument1, argument2, oManTrap);
}
else if (argument0 == "m")
{
    obj = instance_create(argument1, argument2, oMonkey);
}
else if (argument0 == "y")
{
    obj = instance_create(argument1, argument2, oYeti);
}
else if (argument0 == "Y")
{
    obj = instance_create(argument1, argument2, oYetiKing);
}
else if (argument0 == "a")
{
    obj = instance_create(argument1, argument2, oAlien);
}
else if (argument0 == "U")
{
    obj = instance_create(argument1, argument2, oUFO);
}
else if (argument0 == "E")
{
    obj = instance_create(argument1, argument2, oAlienBoss);
}
else if (argument0 == "H")
{
    obj = instance_create(argument1, argument2, oHawkman);
}
else if (argument0 == "T")
{
    obj = instance_create(argument1, argument2, oTombLord);
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
    obj = instance_create(argument1, argument2, oSpearTrapTop);
}
else if (argument0 == "[")
{
    obj = instance_create(argument1, argument2, oSpearTrapBottom);
}
else if (argument0 == "_")
{
    obj = instance_create(argument1, argument2, oSpringTrap);
}
else if (argument0 == "+")
{
    obj = instance_create(argument1, argument2, oSmashTrap);
}
else if (argument0 == "$")
{
    obj = instance_create(argument1+8, argument2+12, oGoldBar);
}
else if (argument0 == "*")
{
    obj = instance_create(argument1+8, argument2+8, oGoldBars);
}
else if (argument0 == "#")
{
    obj = instance_create(argument1+8, argument2+12, oGoldIdol);
}
else if (argument0 == "O")
{
    obj = instance_create(argument1+8, argument2+12, oCrystalSkull);
}
else if (argument0 == "5")
{
    obj = instance_create(argument1+8, argument2+12, oEmeraldBig);
}
else if (argument0 == "6")
{
    obj = instance_create(argument1+8, argument2+12, oSapphireBig);
}
else if (argument0 == "7")
{
    obj = instance_create(argument1+8, argument2+12, oRubyBig);
}
else if (argument0 == "8")
{
    obj = instance_create(argument1+8, argument2+12, oDiamond);
}
else if (argument0 == "c")
{
    obj = instance_create(argument1+8, argument2+8, oChest);
}
else if (argument0 == "C")
{
    obj = instance_create(argument1+8, argument2+8, oCrate);
}
else if (argument0 == "D")
{
    obj = instance_create(argument1+8, argument2+8, oDamsel);
}
else if (argument0 == ".")
{
    obj = instance_create(argument1+8, argument2+10, oBombBag);
    obj.cost = 0;
    obj.forSale = false;
}
else if (argument0 == ":")
{
    obj = instance_create(argument1+8, argument2+8, oBombBox);
    obj.cost = 0;
    obj.forSale = false;
}
else if (argument0 == "u")
{
    obj = instance_create(argument1+8, argument2+10, oPaste);
    obj.cost = 0;
    obj.forSale = false;
}
else if (argument0 == "R")
{
    obj = instance_create(argument1+8, argument2+11, oRopePile);
    obj.cost = 0;
    obj.forSale = false;
}
else if (argument0 == "`")
{
    obj = instance_create(argument1+8, argument2+10, oParaPickup);
    obj.cost = 0;
    obj.forSale = false;
}
else if (argument0 == "o")
{
    obj = instance_create(argument1+8, argument2+10, oCompass);
    obj.cost = 0;
    obj.forSale = false;
}
else if (argument0 == "/")
{
    obj = instance_create(argument1+8, argument2+12, oMachete);
    obj.cost = 0;
    obj.forSale = false;
}
else if (argument0 == "~")
{
    obj = instance_create(argument1+8, argument2+10, oSpringShoes);
    obj.cost = 0;
    obj.forSale = false;
}
else if (argument0 == "V")
{
    obj = instance_create(argument1+8, argument2+10, oSpikeShoes);
    obj.cost = 0;
    obj.forSale = false;
}
else if (argument0 == "}")
{
    obj = instance_create(argument1+8, argument2+12, oBow);
    obj.cost = 0;
    obj.forSale = false;
}
else if (argument0 == "-")
{
    obj = instance_create(argument1+8, argument2+12, oPistol);
    obj.cost = 0;
    obj.forSale = false;
}
else if (argument0 == "=")
{
    obj = instance_create(argument1+8, argument2+12, oShotgun);
    obj.cost = 0;
    obj.forSale = false;
}
else if (argument0 == "W")
{
    obj = instance_create(argument1+8, argument2+12, oWebCannon);
    obj.cost = 0;
    obj.forSale = false;
}
else if (argument0 == "%")
{
    obj = instance_create(argument1+8, argument2+10, oSpectacles);
    obj.cost = 0;
    obj.forSale = false;
}
else if (argument0 == "G")
{
    obj = instance_create(argument1+8, argument2+8, oGloves);
    obj.cost = 0;
    obj.forSale = false;
}
else if (argument0 == "g")
{
    obj = instance_create(argument1+8, argument2+8, oMitt);
    obj.cost = 0;
    obj.forSale = false;
}
else if (argument0 == "?")
{
    obj = instance_create(argument1+8, argument2+12, oTeleporter);
    obj.cost = 0;
    obj.forSale = false;
}
else if (argument0 == "(")
{
    obj = instance_create(argument1+8, argument2+10, oMattock);
    obj.cost = 0;
    obj.forSale = false;
}
else if (argument0 == "\")
{
    obj = instance_create(argument1+8, argument2+10, oCapePickup);
    obj.cost = 0;
    obj.forSale = false;
}
else if (argument0 == "J")
{
    obj = instance_create(argument1+8, argument2+8, oJetpack);
    obj.cost = 0;
    obj.forSale = false;
}
