if (not cleanDeath)
{
    if (not global.cityOfGold)
    {
        rubble = instance_create(x+8+rand(0,8)-rand(0,8), y+8+rand(0,8)-rand(0,8), oRubble);
        rubble.sprite_index = sRubbleLush;
        rubble = instance_create(x+8+rand(0,8)-rand(0,8), y+8+rand(0,8)-rand(0,8), oRubbleSmall);
        rubble.sprite_index = sRubbleLushSmall;
        rubble = instance_create(x+8+rand(0,8)-rand(0,8), y+8+rand(0,8)-rand(0,8), oRubbleSmall);
        rubble.sprite_index = sRubbleLushSmall;
    }
    else
    {
        for (i = 0; i < 3; i += 1)
        {
            gold = instance_create(x+8+rand(0,4)-rand(0,4), y+8+rand(0,4)-rand(0,4), oGoldChunk);
            gold.xVel = rand(0,3) - rand(0,3);
            gold.yVel = rand(2,4) * 1;
        }
        gold = instance_create(x+8+rand(0,4)-rand(0,4), y+8+rand(0,4)-rand(0,4), oGoldNugget);
        gold.xVel = rand(0,3) - rand(0,3);
        gold.yVel = rand(2,4) * 1;
    
        if (treasure == "Diamond") repeat(2) { instance_create(x+8, y+8, oDiamond); }
        if (treasure == "Ruby") repeat(2) { instance_create(x+8, y+8, oRubyBig); }
        if (treasure == "Sapphire") repeat(2) { instance_create(x+8, y+8, oSapphireBig); }
        if (treasure == "Emerald") repeat(2) { instance_create(x+8, y+8, oEmeraldBig); }
    }
}

tile = tile_layer_find(99, x, y);
if (tile) tile_delete(tile);
