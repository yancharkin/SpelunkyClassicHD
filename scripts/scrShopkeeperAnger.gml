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
        if (global.murderer) global.message = global.YoullPayForYourCrimes;
        else if (argument0 == 0) global.message = global.ComeBackHereThief;
        else if (argument0 == 1) global.message = global.DieYouVandal;
        else if (argument0 == 2) global.message = global.Terrorist;
        else if (argument0 == 3) global.message = global.HeqOnlyICanDoThat;
        else global.message = global.NowImReallySteamed;
        global.message2 = "";
        global.messageTimer = 80;
        if (global.thiefLevel > 0) global.thiefLevel += 3;
        else global.thiefLevel += 2;
    }
}
