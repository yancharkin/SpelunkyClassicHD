function scrShopkeeperAnger(argument0) {
	//
	// scrShopkeeperAnger(message)
	//
	// Make the nearest shopkeeper angry.  RAWR! 
	//
	
	shp = instance_nearest(x, y, oShopkeeper);
	if (shp) {
	    if (not shp.dead and not shp.angered)
	    {
	        shp.status = 2;
	        if (global.murderer) message1 = "YOU'LL PAY FOR YOUR CRIMES!";
	        else if (argument0 == 0) message1 = "COME BACK HERE, THIEF!";
	        else if (argument0 == 1) message1 = "DIE, YOU VANDAL!";
	        else if (argument0 == 2) message1 = "TERRORIST!";
	        else if (argument0 == 3) message1 = "HEY, ONLY I CAN DO THAT!";
	        else message1 = "NOW I'M REALLY STEAMED!";
	        message2 = "";
	        if (global.thiefLevel > 0) global.thiefLevel += 3;
	        else global.thiefLevel += 2;
			trMessages(message1, message2, 0, 0, 80);
	    }
	}
}