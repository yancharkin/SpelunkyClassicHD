with other
{
    if (not invincible)
    {
        if (collision_point(x, y, oGold, 0, 0))
        {
            gold = instance_place(x, y, oGold);
            with gold { instance_destroy(); }
        }
        if (collision_point(x, y, oGoldBig, 0, 0))
        {
            gold = instance_place(x, y, oGoldBig);
            with gold { instance_destroy(); }
        }
        instance_destroy();
    }
    
    tile = tile_layer_find(3, x, y-16);
    if (tile) tile_delete(tile);
}

instance_create(x, y, oLaserExplode);
// global.checkWater = true;
instance_destroy();
