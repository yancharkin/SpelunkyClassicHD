if (status != STUNNED and status != EATING)
{
    xVel = 0;
    status = EATING;
    if (other.x > x) facing = RIGHT;
    else facing = LEFT;
    sprite_index = sManTrapEatDamselL;
        
    with other
    {
        if (held)
        {
            oPlayer1.holdItem = 0;
            oPlayer1.pickupItemType = "";
        }
        instance_destroy();
    }
}
