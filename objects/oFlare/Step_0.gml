action_inherited();
if (instance_exists(oPlayer1))
    distToPlayer = distance_to_object(oPlayer1);
    
if (collision_point(x, y, oWater, -1, -1))
{
    instance_create(x, y, oSplash);
    playSound(global.sndSplash);
    if (held)
    {
        with oPlayer1
        {
            holdItem = 0;
            pickupItemType = "";
        }
        held = false;
    }
    instance_destroy();
}
