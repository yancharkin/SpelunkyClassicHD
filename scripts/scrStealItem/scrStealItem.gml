function scrStealItem() {
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
	    message1 = "YOU GOT THE UDJAT EYE!";
	    message2 = "YOU FEEL AWAKENED.";
	}
	else if (holdItem.type == "Ankh")
	{
	    global.hasAnkh = true;
	    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    with holdItem { instance_destroy(); }
	    playSound(global.sndPickup);
	    holdItem = 0;
	    message1 = "YOU GOT THE ANKH!";
	    message2 = "YOU FEEL PROTECTED.";
	}
	else if (holdItem.type == "Crown")
	{
	    global.hasCrown = true;
	    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    with holdItem { instance_destroy(); }
	    playSound(global.sndPickup);
	    holdItem = 0;
	    message1 = "YOU GOT THE HEDJET!";
	    message2 = "IT GLOWS A BRILLIANT WHITE.";
	}
	else if (holdItem.type == "Kapala")
	{
	    global.hasKapala = true;
	    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    with holdItem { instance_destroy(); }
	    playSound(global.sndPickup);
	    holdItem = 0;
	    message1 = "YOU GOT THE KAPALA!";
	    message2 = "IT THIRSTS FOR BLOOD...";
	}
	else if (holdItem.type == "Bomb Bag")
	{
	    global.bombs += 3;
	    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    disp.sprite_index = sBombsGet;
	    with holdItem { instance_destroy(); }
	    playSound(global.sndPickup);
	    holdItem = 0;
	    message1 = "YOU GOT 3 MORE BOMBS!";
	    message2 = "";
	}
	else if (holdItem.type == "Bomb Box")
	{
	    global.bombs += 12;
	    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    disp.sprite_index = sBombsGet;
	    with holdItem { instance_destroy(); }
	    playSound(global.sndPickup);
	    holdItem = 0;
	    message1 = "YOU GOT 12 MORE BOMBS!";
	    message2 = "";
	}
	else if (holdItem.type == "Paste")
	{
	    global.hasStickyBombs = true;
	    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    with holdItem { instance_destroy(); }
	    playSound(global.sndPickup);
	    holdItem = 0;
	    message1 = "YOU GOT STICKY BOMBS!";
	    message2 = "";
	}
	else if (holdItem.type == "Rope Pile")
	{
	    global.rope += 3;
	    disp = instance_create(holdItem.x, holdItem.y-15, oItemsGet);
	    disp.sprite_index = sRopeGet;
	    with holdItem { instance_destroy(); }
	    playSound(global.sndPickup);
	    holdItem = 0;
	    message1 = "YOU GOT 3 MORE ROPES!";
	    message2 = "";
	}
	else if (holdItem.type == "Parachute")
	{
	    global.hasParachute = true;
	    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    with holdItem { instance_destroy(); }
	    playSound(global.sndPickup);
	    holdItem = 0;
	    message1 = "YOU GOT A PARACHUTE!";
	    message2 = "IT WILL DEPLOY AUTOMATICALLY.";
	}
	else if (holdItem.type == "Spectacles")
	{
	    global.hasSpectacles = true;
	    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    with holdItem { instance_destroy(); }
	    playSound(global.sndPickup);
	    holdItem = 0;
	    message1 = "YOU GOT SPECTACLES!";
	    message2 = "YOUR EYESIGHT SEEMS IMPROVED...";
	}
	else if (holdItem.type == "Gloves")
	{
	    global.hasGloves = true;
	    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    with holdItem { instance_destroy(); }
	    playSound(global.sndPickup);
	    holdItem = 0;
	    message1 = "YOU GOT CLIMBING GLOVES!";
	    if (oPlayer1.pickupItemType == "Web Cannon") {
			message2 = "YOUR SPIDER SENSE TINGLES!";
		} else {
			message2 = "";
		}
	}
	else if (holdItem.type == "Mitt")
	{
	    global.hasMitt = true;
	    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    with holdItem { instance_destroy(); }
	    playSound(global.sndPickup);
	    holdItem = 0;
	    message1 = "YOU GOT A PITCHER'S MITT!";
	    message2 = "";
	}
	else if (holdItem.type == "Compass")
	{
	    global.hasCompass = true;
	    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    with holdItem { instance_destroy(); }
	    playSound(global.sndPickup);
	    holdItem = 0;
	    message1 = "YOU GOT A COMPASS!";
	    message2 = "";
	}
	else if (holdItem.type == "Spring Shoes")
	{
	    global.hasSpringShoes = true;
	    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    with holdItem { instance_destroy(); }
	    playSound(global.sndPickup);
	    holdItem = 0;
	    message1 = "YOU GOT SPRING SHOES!";
	    message2 = "YOU FEEL BOUNCY.";
	}
	else if (holdItem.type == "Spike Shoes")
	{
	    global.hasSpikeShoes = true;
	    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    with holdItem { instance_destroy(); }
	    playSound(global.sndPickup);
	    holdItem = 0;
	    message1 = "YOU GOT SPIKE SHOES!";
	    message2 = "";
	}
	else if (holdItem.type == "Jordans")
	{
	    global.hasJordans = true;
	    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    with holdItem { instance_destroy(); }
	    playSound(global.sndPickup);
	    holdItem = 0;
	    message1 = "YOU GOT JORDANS!";
	    message2 = "YOU FEEL LIGHT ON YOUR FEET.";
	}
	else if (holdItem.type == "Cape")
	{
	    global.hasCape = true;
	    disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    with holdItem { instance_destroy(); }
	    playSound(global.sndPickup);
	    holdItem = 0;
	    message1 = "YOU GOT A CAPE!";
	    message2 = "";

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
	    message1 = "YOU GOT A JETPACK!";
	    message2 = "";
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
	    message1 = "YOU GOT A MACHETE!";
	    message2 = "";
	}
	else if (holdItem.type == "Mattock" and holdItem.cost > 0)
	{
	    holdItem.cost = 0;
	    holdItem.forSale = false;
	    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    playSound(global.sndPickup);
	    message1 = "YOU GOT A MATTOCK!";
	    message2 = "IT SEEMS A BIT RUSTY.";
	}
	else if (holdItem.type == "Pistol" and holdItem.cost > 0)
	{
	    holdItem.cost = 0;
	    holdItem.forSale = false;
	    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    playSound(global.sndPickup);
	    message1 = "YOU GOT A PISTOL!";
	    message2 = "";
	}
	else if (holdItem.type == "Web Cannon" and holdItem.cost > 0)
	{
	    holdItem.cost = 0;
	    holdItem.forSale = false;
	    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    playSound(global.sndPickup);
	    message1 = "YOU GOT A WEB CANNON!";
	    message2 = "";
	}
	else if (holdItem.type == "Teleporter" and holdItem.cost > 0)
	{
	    holdItem.cost = 0;
	    holdItem.forSale = false;
	    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    playSound(global.sndPickup);
	    message1 = "YOU GOT A TELEPORTER!";
	    message2 = "";
	}
	else if (holdItem.type == "Shotgun" and holdItem.cost > 0)
	{
	    holdItem.cost = 0;
	    holdItem.forSale = false;
	    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    playSound(global.sndPickup);
	    message1 = "YOU GOT A SHOTGUN!";
	    message2 = "";
	}
	else if (holdItem.type == "Bow" and holdItem.cost > 0)
	{
	    holdItem.cost = 0;
	    holdItem.forSale = false;
	    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    playSound(global.sndPickup);
	    message1 = "YOU GOT THE BOW AND ARROWS!";
	    message2 = "";
	    //global.arrows += 8;
	}
	else if (holdItem.type == "Damsel" and holdItem.cost > 0)
	{
	    global.damselsBought += 1;
	    holdItem.cost = 0;
	    holdItem.forSale = false;
	    //disp = instance_create(holdItem.x, holdItem.y-14, oItemsGet);
	    playSound(global.sndPickup);
	    message1 = "YOU MUST BE IN LOVE!";
	    message2 = "";
	}
	else {
		message1 = "";
		message2 = "";
	}
	trMessages(message1, message2, 0, 0, 120);
}