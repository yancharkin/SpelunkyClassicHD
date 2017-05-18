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
    global.message = "YOU GOT THE UDJAT EYE!";
    global.message2 = "YOU FEEL AWAKENED.";
    global.messageTimer = 120;
}
else if (holdItem.type == "Ankh")
{
    global.hasAnkh = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = "YOU GOT THE ANKH!";
    global.message2 = "YOU FEEL PROTECTED.";
    global.messageTimer = 120;
}
else if (holdItem.type == "Crown")
{
    global.hasCrown = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = "YOU GOT THE HEDJET!";
    global.message2 = "IT GLOWS A BRILLIANT WHITE.";
    global.messageTimer = 120;
}
else if (holdItem.type == "Kapala")
{
    global.hasKapala = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = "YOU GOT THE KAPALA!";
    global.message2 = "IT THIRSTS FOR BLOOD...";
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
    global.message = "YOU GOT 3 MORE BOMBS!";
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
    global.message = "YOU GOT 12 MORE BOMBS!";
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
    global.message = "YOU GOT STICKY BOMBS!";
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
    global.message = "YOU GOT 3 MORE ROPES!";
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
    global.message = "YOU GOT A PARACHUTE!";
    global.message2 = "IT WILL DEPLOY AUTOMATICALLY.";
    global.messageTimer = 120;
}
else if (holdItem.type == "Spectacles")
{
    global.hasSpectacles = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = "YOU GOT SPECTACLES!";
    global.message2 = "YOUR EYESIGHT SEEMS IMPROVED...";
    global.messageTimer = 120;
}
else if (holdItem.type == "Gloves")
{
    global.hasGloves = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = "YOU GOT CLIMBING GLOVES!";
    if (oPlayer1.pickupItemType == "Web Cannon") global.message2 = "YOUR SPIDER SENSE TINGLES!";
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
    global.message = "YOU GOT A PITCHER'S MITT!";
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
    global.message = "YOU GOT A COMPASS!";
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
    global.message = "YOU GOT SPRING SHOES!";
    global.message2 = "YOU FEEL BOUNCY.";
    global.messageTimer = 120;
}
else if (holdItem.type == "Spike Shoes")
{
    global.hasSpikeShoes = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = "YOU GOT SPIKE SHOES!";
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
    global.message = "YOU GOT JORDANS!";
    global.message2 = "YOU FEEL LIGHT ON YOUR FEET.";
    global.messageTimer = 120;
}
else if (holdItem.type == "Cape")
{
    global.hasCape = true;
    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    with holdItem { instance_destroy(); }
    playSound(global.sndPickup);
    holdItem = 0;
    global.message = "YOU GOT A CAPE!";
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
    global.message = "YOU GOT A JETPACK!";
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
    global.message = "YOU GOT A MACHETE!";
    global.message2 = "";
    global.messageTimer = 120;
}
else if (holdItem.type == "Mattock" and holdItem.cost > 0)
{
    holdItem.cost = 0;
    holdItem.forSale = false;
    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    playSound(global.sndPickup);
    global.message = "YOU GOT A MATTOCK!";
    global.message2 = "IT SEEMS A BIT RUSTY.";
    global.messageTimer = 120;
}
else if (holdItem.type == "Pistol" and holdItem.cost > 0)
{
    holdItem.cost = 0;
    holdItem.forSale = false;
    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    playSound(global.sndPickup);
    global.message = "YOU GOT A PISTOL!";
    global.message2 = "";
    global.messageTimer = 120;
}
else if (holdItem.type == "Web Cannon" and holdItem.cost > 0)
{
    holdItem.cost = 0;
    holdItem.forSale = false;
    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    playSound(global.sndPickup);
    global.message = "YOU GOT A WEB CANNON!";
    global.message2 = "";
    global.messageTimer = 120;
}
else if (holdItem.type == "Teleporter" and holdItem.cost > 0)
{
    holdItem.cost = 0;
    holdItem.forSale = false;
    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    playSound(global.sndPickup);
    global.message = "YOU GOT A TELEPORTER!";
    global.message2 = "";
    global.messageTimer = 120;
}
else if (holdItem.type == "Shotgun" and holdItem.cost > 0)
{
    holdItem.cost = 0;
    holdItem.forSale = false;
    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    playSound(global.sndPickup);
    global.message = "YOU GOT A SHOTGUN!";
    global.message2 = "";
    global.messageTimer = 120;
}
else if (holdItem.type == "Bow" and holdItem.cost > 0)
{
    holdItem.cost = 0;
    holdItem.forSale = false;
    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
    playSound(global.sndPickup);
    global.message = "YOU GOT THE BOW AND ARROWS!";
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
    global.message = "YOU MUST BE IN LOVE!";
    global.message2 = "";
    global.messageTimer = 120;
}
