if (status != STUNNED and status != EATING)
{
    xVel = 0;
    status = EATING;
    if (other.x > x) facing = RIGHT;
    else facing = LEFT;
    sprite_index = sManTrapEatCavemanL;
        
    with other { instance_destroy(); }
}
