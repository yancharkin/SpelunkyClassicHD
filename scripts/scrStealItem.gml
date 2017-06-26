//
// scrStealItem(xVel, yVel)
//
// The result of buying or stealing an item.  Must be called by oPlayer1.
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

if (holdItem.type == "Udjat Eye")
{
    global.hasUdjatEye = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = global.YouGotTheUdjatEye;
    global.message2 = global.YouFeelAwakened;
    global.messageTimer = 120;
}
else if (holdItem.type == "Ankh")
{
    global.hasAnkh = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = global.YouGotTheAnkh;
    global.message2 = global.YouFeelProtected;
    global.messageTimer = 120;
}
else if (holdItem.type == "Crown")
{
    global.hasCrown = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = global.YouGotTheHedjet;
    global.message2 = global.ItGlowsABrilliantWhite;
    global.messageTimer = 120;
}
else if (holdItem.type == "Kapala")
{
    global.hasKapala = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = global.YouGotTheKapala;
    global.message2 = global.ItThirstsForBlood;
    global.messageTimer = 120;
}
else if (holdItem.type == "Bomb Bag")
{
    global.bombs += 3;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    disp.sprite_index = sBombsGet;
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = global.YouGot3MoreBombs;
    global.message2 = "";
    global.messageTimer = 120;
}
else if (holdItem.type == "Bomb Box")
{
    global.bombs += 12;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    disp.sprite_index = sBombsGet;
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = global.YouGot12MoreBombs;
    global.message2 = "";
    global.messageTimer = 120;
}
else if (holdItem.type == "Paste")
{
    global.hasStickyBombs = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = global.YouGotStickyBombs;
    global.message2 = "";
    global.messageTimer = 120;
}
else if (holdItem.type == "Rope Pile")
{
    global.rope += 3;
    disp = instance_create(holdItem.x, holdItem.y-15, oItemsGet);
    disp.sprite_index = sRopeGet;
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = global.YouGot3MoreRopes;
    global.message2 = "";
    global.messageTimer = 120;
}
else if (holdItem.type == "Parachute")
{
    global.hasParachute = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = global.YouGotAParachute;
    global.message2 = global.ItWillDeployAutomatically;
    global.messageTimer = 120;
}
else if (holdItem.type == "Spectacles")
{
    global.hasSpectacles = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = global.YouGotSpectacles;
    global.message2 = global.YourEyesightSeemsImproved;
    global.messageTimer = 120;
}
else if (holdItem.type == "Gloves")
{
    global.hasGloves = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = global.YouGotClimbingGloves;
    if (oPlayer1.pickupItemType == "Web Cannon") global.message2 = global.YourSpiderSenseTingles;
    else global.message2 = "";
    global.messageTimer = 120;
}
else if (holdItem.type == "Mitt")
{
    global.hasMitt = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = global.YouGotAPitcherSMitt;
    global.message2 = "";
    global.messageTimer = 120;
}
else if (holdItem.type == "Compass")
{
    global.hasCompass = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = global.YouGotACompass;
    global.message2 = "";
    global.messageTimer = 120;
}
else if (holdItem.type == "Spring Shoes")
{
    global.hasSpringShoes = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = global.YouGotSpringShoes;
    global.message2 = global.YouFeelBouncy;
    global.messageTimer = 120;
}
else if (holdItem.type == "Spike Shoes")
{
    global.hasSpikeShoes = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = global.YouGotSpikeShoes;
    global.message2 = "";
    global.messageTimer = 120;
}
else if (holdItem.type == "Jordans")
{
    global.hasJordans = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = global.YouGotJordans;
    global.message2 = global.YouFeelLightOnYourFeet;
    global.messageTimer = 120;
}
else if (holdItem.type == "Cape")
{
    global.hasCape = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = global.YouGotACape;
    global.message2 = "";
    global.messageTimer = 120;
    if (global.hasJetpack)
    {
        obj = instance_create(x, y, oJetpack);
        obj.cost = 0;
        obj.forSale = false;
        obj.yVel = -1;
        global.hasJetpack = false;
    }
}
else if (holdItem.type == "Jetpack")
{
    global.hasJetpack = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = global.YouGotAJetpack;
    global.message2 = "";
    global.messageTimer = 120;
    if (global.hasCape)
    {
        obj = instance_create(x, y, oCapePickup);
        obj.cost = 0;
        obj.forSale = false;
        obj.yVel = -1;
        global.hasCape = false;
        with oCape { instance_destroy(); }
    }
}
else if (holdItem.type == "Machete" and holdItem.cost > 0)
{
    holdItem.cost = 0;
    holdItem.forSale = false;
    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    playSound(global.sndPickup);
    global.message = global.YouGotAMachete;
    global.message2 = "";
    global.messageTimer = 120;
}
else if (holdItem.type == "Mattock" and holdItem.cost > 0)
{
    holdItem.cost = 0;
    holdItem.forSale = false;
    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    playSound(global.sndPickup);
    global.message = global.YouGotAMattock;
    global.message2 = global.ItSeemsABitRusty;
    global.messageTimer = 120;
}
else if (holdItem.type == "Pistol" and holdItem.cost > 0)
{
    holdItem.cost = 0;
    holdItem.forSale = false;
    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    playSound(global.sndPickup);
    global.message = global.YouGotAPistol;
    global.message2 = "";
    global.messageTimer = 120;
}
else if (holdItem.type == "Web Cannon" and holdItem.cost > 0)
{
    holdItem.cost = 0;
    holdItem.forSale = false;
    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    playSound(global.sndPickup);
    global.message = global.YouGotAWebCannon;
    global.message2 = "";
    global.messageTimer = 120;
}
else if (holdItem.type == "Teleporter" and holdItem.cost > 0)
{
    holdItem.cost = 0;
    holdItem.forSale = false;
    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    playSound(global.sndPickup);
    global.message = global.YouGotATeleporter;
    global.message2 = "";
    global.messageTimer = 120;
}
else if (holdItem.type == "Shotgun" and holdItem.cost > 0)
{
    holdItem.cost = 0;
    holdItem.forSale = false;
    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    playSound(global.sndPickup);
    global.message = global.YouGotAShotgun;
    global.message2 = "";
    global.messageTimer = 120;
}
else if (holdItem.type == "Bow" and holdItem.cost > 0)
{
    holdItem.cost = 0;
    holdItem.forSale = false;
    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    playSound(global.sndPickup);
    global.message = global.YouGotTheBowAndArrows;
    global.message2 = "";
    global.messageTimer = 120;
    //global.arrows += 8;
}
else if (holdItem.type == "Damsel" and holdItem.cost > 0)
{
    global.damselsBought += 1;
    holdItem.cost = 0;
    holdItem.forSale = false;
    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    playSound(global.sndPickup);
    global.message = global.YouMustBeInLove;
    global.message2 = "";
    global.messageTimer = 120;
}
