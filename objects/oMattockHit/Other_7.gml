hit = false;
if (collision_point(x, y, oSolid, 0, 0))
{
    obj = instance_place(x, y, oSolid);
    if (not obj.invincible) hit = true;
}
else if (collision_point(x, y+9, oSolid, 0, 0))
{
    obj = instance_place(x, y+9, oSolid);
    if (not obj.invincible) hit = true;
}

if (hit and not isRoom("rTitle") and not isRoom("rHighscores"))
{
    with obj
    {  
        tile = tile_layer_find(3, x, y-16);
        if (tile) tile_delete(tile);
        tile = tile_layer_find(3, x, y+16);
        if (tile) tile_delete(tile);
        
        if (not invincible) instance_destroy();
    }

    with oTreasure
    {
        state = 1;
    }

    with oSpikes
    {
        if (not collision_point(x, y+16, oSolid, 0, 0))
        {
            instance_destroy();
        }
    }
    
    // break mattock
    if (rand(1,20) == 1 and not global.isTunnelMan)
    {
        with oPlayer1
        {
            holdItem = 0;
            pickupItemType = "";
            global.pickupItem = "";
        }
        obj = instance_create(x, y, oMattockHead);
        obj.yVel = -2;
        playSound(global.sndMattockBreak);
        with oMattock
        {
            if (not visible) instance_destroy();
        }
    }
    else
        playSound(global.sndCrunch);
}

instance_destroy();
