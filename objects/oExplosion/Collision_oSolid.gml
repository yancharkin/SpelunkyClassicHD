if (isLevel("rTutorial") or (x > __view_get( e__VW.XView, 0 )-16 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )+16 and
     y > __view_get( e__VW.YView, 0 )-16 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )+16))
{
    with other
    {
        repeat (2)
        {
            tile = tile_layer_find(3, x+1, y-1);
            if (tile > 0) tile_delete(tile);
        }
        tile = tile_layer_find(3, x+1, y+16);
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

//global.checkWater = true;
}

