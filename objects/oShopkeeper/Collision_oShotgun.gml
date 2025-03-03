if (hp > 0 and status == ATTACK and not hasGun)
{
    with other
    {
        if (held)
        {
            oPlayer1.holdItem = 0;
            oPlayer1.pickupItemType = "";
            held = false;
        }
        instance_destroy();
    }
    hasGun = true;
}
