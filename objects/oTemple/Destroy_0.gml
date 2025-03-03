action_inherited();
if (not cleanDeath and not global.cleanSolids)
{
    rubble = instance_create(x+8+rand(0,8)-rand(0,8), y+8+rand(0,8)-rand(0,8), oRubble);
    rubble.sprite_index = sRubbleLush;
    rubble = instance_create(x+8+rand(0,8)-rand(0,8), y+8+rand(0,8)-rand(0,8), oRubbleSmall);
    rubble.sprite_index = sRubbleLushSmall;
    rubble = instance_create(x+8+rand(0,8)-rand(0,8), y+8+rand(0,8)-rand(0,8), oRubbleSmall);
    rubble.sprite_index = sRubbleLushSmall;

    if (sprite_index == sTempleGold)
    {
        for (i = 0; i < 3; i += 1)
        {
            gold = instance_create(x+8+rand(0,4)-rand(0,4), y+8+rand(0,4)-rand(0,4), oGoldChunk);
            gold.xVel = rand(0,3) - rand(0,3);
            gold.yVel = rand(2,4) * 1;
        }
    }
    else if (sprite_index == sTempleGoldBig or global.cityOfGold)
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
    }

    if (treasure == "Big Ruby")
    {
        instance_create(x+8, y+8, oRubyBig);
    }
}
