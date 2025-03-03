if (other.held)
{
    if (global.hasCrown)
    {
        other.held = false;
        with oPlayer1
        {
            holdItem = 0;
            pickupItemType = "";
        }
        with other { instance_destroy(); }
    
        playSound(global.sndChestOpen);
        instance_create(x, y, oXGold);
        instance_destroy();
    }
    else
    {
        global.message = tr("THE SCEPTRE FITS...");
        global.message2 = tr("BUT NOTHING IS HAPPENING!");
        global.messageTimer = 100;
    }
}
