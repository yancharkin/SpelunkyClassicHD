action_inherited();
if ((x > __view_get( e__VW.XView, 0 )-8 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )+8 and
        y > __view_get( e__VW.YView, 0 )-8 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )+8))
{
// get money for idols at shops
if (isLevel())
{
    if (not held and
        collision_point(x, y+4, oBrickSmooth, 0, 0) and
        instance_exists(oShopkeeper) and
        global.thiefLevel == 0 and not global.murderer)
    {
        if (oShopkeeper.status == 0 and abs(x - oShopkeeper.x) < 80)
        {
            global.collect += value*(global.levelType+1);
            global.collectCounter += 20;
            if (global.collectCounter > 100) global.collectCounter = 100;
            global.idols += 1;
            playSound(global.sndCoin);
            instance_create(x, y-8, oBigCollect);
            global.message = tr("PLEASURE DOING BUSINESS!");
            global.message2 = "";
            global.messageTimer = 100;
            instance_destroy();
        }
    }
}
if (not colBot and trigger)
{
    trigger = false;
    global.idolsGrabbed += 1;
}
}
