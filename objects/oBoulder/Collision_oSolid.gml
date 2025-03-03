if (true)
{   
    if (other.invincible or abs(xVel) < 1)
    {
        xVel = -xVel * 0.5;
    }
    else
    {
        if (abs(xVel) < 1 or other.y > y+13)
        {
            y -= 1;
            // nothing
        }
        else
        {
            with other
            {
                tile = tile_layer_find(3, x, y-16);
                if (tile) tile_delete(tile);
                
                tile = tile_layer_find(3, x, y-8);
                if (tile) tile_delete(tile);
                
                tile = tile_layer_find(3, x, y);
                if (tile) tile_delete(tile);
                
                
                tile = instance_position(x+8, y-1, oSpikes);
                if (tile) with tile { instance_destroy(); }
                instance_destroy();
            }
            playSound(global.sndCrunch);
        }
        if (xVel > 0) xVel -= 0.1;
        else if (xVel < 0) xVel += 0.1;
        if (abs(xVel) < 1) xVel = 0;
    }
}

