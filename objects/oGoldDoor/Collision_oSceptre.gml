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
		trMessages("THE SCEPTRE FITS...", "BUT NOTHING IS HAPPENING!", 0, 0, 100);
    }
}
