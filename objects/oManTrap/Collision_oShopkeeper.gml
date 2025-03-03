if (status != STUNNED and status != EATING)
{
    xVel = 0;
    status = EATING;
    if (other.x > x) facing = RIGHT;
    else facing = LEFT;
    sprite_index = sManTrapEatShopkeeperL;
    if (other.hp > 0) ateShopkeeper = true;
    
    with other
    {
        if (hasGun)
        {
            obj = instance_create(x+8, y+8, oShotgun);
            obj.yVel = rand(4,6);
            if (xVel < 0) obj.xVel = -1 * rand(4,6);
            else obj.xVel = rand(4,6);
            obj.cost = 0;
            obj.forSale = false;
            hasGun = false;
        }
        instance_destroy();
    }
}

