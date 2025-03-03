function scrShopkeeperAnger(argument0) {
	//
	// scrShopkeeperAnger(message)
	//
	// Make the nearest shopkeeper angry.  RAWR! 
	//

	shp = instance_nearest(x, y, oShopkeeper);
	if (shp)
	{
	    if (not shp.dead and not shp.angered)
	    {
	        shp.status = 2;
	        if (global.murderer) global.message = tr("YOU'LL PAY FOR YOUR CRIMES!");
	        else if (argument0 == 0) global.message = tr("COME BACK HERE, THIEF!");
	        else if (argument0 == 1) global.message = tr("DIE, YOU VANDAL!");
	        else if (argument0 == 2) global.message = tr("TERRORIST!");
	        else if (argument0 == 3) global.message = tr("HEY, ONLY I CAN DO THAT!");
	        else global.message = tr("NOW I'M REALLY STEAMED!");
	        global.message2 = "";
	        global.messageTimer = 80;
	        if (global.thiefLevel > 0) global.thiefLevel += 3;
	        else global.thiefLevel += 2;
	    }
	}



}
