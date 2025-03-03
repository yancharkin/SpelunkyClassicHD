with other
{
    cleanDeath = false;
    tile = tile_layer_find(3, x, y-16);
    if (tile) tile_delete(tile);
    instance_destroy();
}

