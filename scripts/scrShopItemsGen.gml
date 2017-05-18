//
// scrShopItemsGen()
//
// Generate shop items.  Must be called from scrRoomGenX().
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

if (shopType == "Bomb")
{
    while (true)
    {
        if (rand(1,5) == 1)
        {
            if (not instance_exists(oPaste)) { obj = instance_create(xpos+8, ypos+10, oPaste); break; }
        }
        else if (rand(1,4) == 1) { obj = instance_create(xpos+8, ypos+8, oBombBox); break; }
        else { obj = instance_create(xpos+8, ypos+10, oBombBag); break; }
    }
}
else if (shopType == "Weapon")
{
    m = 20;
    while (true)
    {
        n = rand(1,4);
        if (m <= 0) { obj = instance_create(xpos+8, ypos+10, oBombBag); break; }
        else if (rand(1,12)==1)
        {
            if (not instance_exists(oWebCannon)) { obj = instance_create(xpos+8, ypos+12, oWebCannon); break; }
        }
        else if (rand(1,10)==1)
        {
            if (not instance_exists(oShotgun)) { obj = instance_create(xpos+8, ypos+12, oShotgun); break; }
        }
        else if (rand(1,6)==1) { obj = instance_create(xpos+8, ypos+10, oBombBox); break; }
        else if (n == 1)
        {
            if (not instance_exists(oPistol)) { obj = instance_create(xpos+8, ypos+12, oPistol); break; }
        }
        else if (n == 2)
        {
            if (not instance_exists(oMachete)) { obj = instance_create(xpos+8, ypos+12, oMachete); break; }
        }
        else if (n == 3) { obj = instance_create(xpos+8, ypos+10, oBombBag); break; }
        else if (n == 4)
        {
            if (not instance_exists(oBow)) { obj = instance_create(xpos+8, ypos+12, oBow); break; }
        }
        m -= 1;
    }
}
else if (shopType == "Clothing")
{
    m = 20;
    while (true)
    {
        n = rand(1,6);
        if (rand(1,m) == 1) { obj = instance_create(xpos+8, ypos+11, oRopePile); break; }
        else if (n == 1)
        {
            if (not instance_exists(oSpringShoes)) { obj = instance_create(xpos+8, ypos+10, oSpringShoes); break; }
        }
        else if (n == 2)
        {
            if (not instance_exists(oSpectacles)) { obj = instance_create(xpos+8, ypos+10, oSpectacles); break; }
        }
        else if (n == 3)
        {
            if (not instance_exists(oGloves)) { obj = instance_create(xpos+8, ypos+8, oGloves); break; }
        }
        else if (n == 4)
        {
            if (not instance_exists(oMitt)) { obj = instance_create(xpos+8, ypos+8, oMitt); break; }
        }
        else if (n == 5)
        {
            if (not instance_exists(oCapePickup)) { obj = instance_create(xpos+8, ypos+10, oCapePickup); break; }
        }
        else if (n == 6)
        {
            if (not instance_exists(oSpikeShoes)) { obj = instance_create(xpos+8, ypos+10, oSpikeShoes); break; }
        }
        m -= 1;
    }
}
else if (shopType == "Rare")
{
    m = 20;
    while (true)
    {
        n = rand(1,11);
        if (rand(1,m) == 1) { obj = instance_create(xpos+8, ypos+8, oBombBox); break; }
        else if (n == 1)
        {
            if (not instance_exists(oSpringShoes)) { obj = instance_create(xpos+8, ypos+10, oSpringShoes); break; }
        }
        else if (n == 2)
        {
            if (not instance_exists(oCompass)) { obj = instance_create(xpos+8, ypos+10, oCompass); break; }
        }
        else if (n == 3)
        {
            if (not instance_exists(oMattock)) { obj = instance_create(xpos+8, ypos+10, oMattock); break; }
        }
        else if (n == 4)
        {
            if (not instance_exists(oSpectacles)) { obj = instance_create(xpos+8, ypos+10, oSpectacles); break; }
        }
        else if (n == 5)
        {
            if (not instance_exists(oJetpack)) { obj = instance_create(xpos+8, ypos+8, oJetpack); break; }
        }
        else if (n == 6)
        {
            if (not instance_exists(oGloves)) { obj = instance_create(xpos+8, ypos+8, oGloves); break; }
        }
        else if (n == 7)
        {
            if (not instance_exists(oMitt)) { obj = instance_create(xpos+8, ypos+8, oMitt); break; }
        }
        else if (n == 8)
        {
            if (not instance_exists(oWebCannon)) { obj = instance_create(xpos+8, ypos+12, oWebCannon); break; }
        }
        else if (n == 9)
        {
            if (not instance_exists(oCapePickup)) { obj = instance_create(xpos+8, ypos+10, oCapePickup); break; }
        }
        else if (n == 10)
        {
            if (not instance_exists(oTeleporter)) { obj = instance_create(xpos+8, ypos+12, oTeleporter); break; }
        }
        else if (n == 11)
        {
            if (not instance_exists(oSpikeShoes)) { obj = instance_create(xpos+8, ypos+10, oSpikeShoes); break; }
        }
        m -= 1;
    }
}
else
{
    while (true)
    {
        n = rand(1,3);
        if (rand(1,20) == 1)
        {
            if (not instance_exists(oMattock)) { obj = instance_create(xpos+8, ypos+10, oMattock); break; }
        }
        else if (rand(1,10) == 1)
        {
            if (not instance_exists(oGloves)) { obj = instance_create(xpos+8, ypos+8, oGloves); break; }
        }
        else if (rand(1,10) == 1)
        {
            if (not instance_exists(oCompass)) { obj = instance_create(xpos+8, ypos+10, oCompass); break; }
        }
        else if (n == 1) { obj = instance_create(xpos+8, ypos+10, oBombBag); break; }
        else if (n == 2) { obj = instance_create(xpos+8, ypos+11, oRopePile); break; }
        else if (n == 3) { obj = instance_create(xpos+8, ypos+10, oParaPickup); break; }
    }
}

if (obj)
{
    obj.forSale = true;
    if (global.currLevel > 2)
    {
        with obj
        {
            cost += (cost/100)*10*(global.currLevel-2);
            if (shopDesc == "") buyMessage = "A " + string_upper(type) + " FOR $" + string(cost) + ".";
            else buyMessage = shopDesc + " FOR $" + string(cost) + ".";
        }
    }
}
