// scrGenerateItem(x, y, setType)
//
// Generate an item at (x,y).
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

if (argument2 == 0) // Crate Set
{
    if (rand(1,500) == 1) obj = instance_create(argument0, argument1, oJetpack);
    else if (rand(1,200) == 1) obj = instance_create(argument0, argument1, oCapePickup);
    else if (rand(1,100) == 1) obj = instance_create(argument0, argument1, oShotgun);
    else if (rand(1,100) == 1) obj = instance_create(argument0, argument1, oMattock);
    else if (rand(1,100) == 1) obj = instance_create(argument0, argument1, oTeleporter);
    else if (rand(1,90) == 1) obj = instance_create(argument0, argument1, oGloves);
    else if (rand(1,90) == 1) obj = instance_create(argument0, argument1, oSpectacles);
    else if (rand(1,80) == 1) obj = instance_create(argument0, argument1, oWebCannon);
    else if (rand(1,80) == 1) obj = instance_create(argument0, argument1, oPistol);
    else if (rand(1,80) == 1) obj = instance_create(argument0, argument1, oMitt);
    else if (rand(1,60) == 1) obj = instance_create(argument0, argument1, oPaste);
    else if (rand(1,60) == 1) obj = instance_create(argument0, argument1, oSpringShoes);
    else if (rand(1,60) == 1) obj = instance_create(argument0, argument1, oSpikeShoes);
    else if (rand(1,60) == 1) obj = instance_create(argument0, argument1, oMachete);
    else if (rand(1,40) == 1) obj = instance_create(argument0, argument1, oBombBox);
    else if (rand(1,40) == 1) obj = instance_create(argument0, argument1, oBow);
    else if (rand(1,20) == 1) obj = instance_create(argument0, argument1, oCompass);
    else if (rand(1,10) == 1) obj = instance_create(argument0, argument1, oParaPickup);
    else obj = instance_create(argument0, argument1, oRopePile);
    obj.cost = 0;
    obj.forSale = false;
}
else if (argument2 == 1) // High End Set
{
    if (rand(1,40) == 1) obj = instance_create(argument0, argument1, oJetpack);
    else if (rand(1,25) == 1) obj = instance_create(argument0, argument1, oCapePickup);
    else if (rand(1,20) == 1) obj = instance_create(argument0, argument1, oShotgun);
    else if (rand(1,10) == 1) obj = instance_create(argument0, argument1, oGloves);
    else if (rand(1,10) == 1) obj = instance_create(argument0, argument1, oTeleporter);
    else if (rand(1,8) == 1) obj = instance_create(argument0, argument1, oMattock);
    else if (rand(1,8) == 1) obj = instance_create(argument0, argument1, oPaste);
    else if (rand(1,8) == 1) obj = instance_create(argument0, argument1, oSpringShoes);
    else if (rand(1,8) == 1) obj = instance_create(argument0, argument1, oSpikeShoes);
    else if (rand(1,8) == 1) obj = instance_create(argument0, argument1, oCompass);
    else if (rand(1,8) == 1) obj = instance_create(argument0, argument1, oPistol);
    else if (rand(1,8) == 1) obj = instance_create(argument0, argument1, oMachete);
    else obj = instance_create(argument0, argument1, oBombBox);
}
else if (argument2 == 2) // Underground Set
{
    switch(rand(0,18))
    {
        case 0: { obj = instance_create(argument0, argument1-2, oJetpack); break; }
        case 1: { obj = instance_create(argument0, argument1, oCapePickup); break; }
        case 2: { obj = instance_create(argument0, argument1, oShotgun); break; }
        case 3: { obj = instance_create(argument0, argument1, oMattock); break; }
        case 4: { obj = instance_create(argument0, argument1+3, oTeleporter); break; }
        case 5: { obj = instance_create(argument0, argument1-1, oGloves); break; }
        case 6: { obj = instance_create(argument0, argument1, oSpectacles); break; }
        case 7: { obj = instance_create(argument0-2, argument1, oWebCannon); break; }
        case 8: { obj = instance_create(argument0, argument1, oPistol); break; }
        case 9: { obj = instance_create(argument0, argument1-1, oMitt); break; }
        case 10: { obj = instance_create(argument0, argument1, oPaste); break; }
        case 11: { obj = instance_create(argument0, argument1, oSpringShoes); break; }
        case 12: { obj = instance_create(argument0, argument1, oSpikeShoes); break; }
        case 13: { obj = instance_create(argument0, argument1, oMachete); break; }
        case 14: { obj = instance_create(argument0, argument1-2, oBombBox); break; }
        case 15: { obj = instance_create(argument0, argument1, oBow); break; }
        case 16: { obj = instance_create(argument0, argument1, oCompass); break; }
        case 17: { obj = instance_create(argument0, argument1, oParaPickup); break; }
        case 18: { obj = instance_create(argument0, argument1, oRopePile); break; }
    }
    obj.cost = 0;
    obj.forSale = false;
}
