action_inherited();
if (not cleanDeath and not global.cleanSolids)
{
    instance_create(x+8+rand(0,8)-rand(0,8), y+8+rand(0,8)-rand(0,8), oRubble);
    instance_create(x+8+rand(0,8)-rand(0,8), y+8+rand(0,8)-rand(0,8), oRubbleSmall);
    instance_create(x+8+rand(0,8)-rand(0,8), y+8+rand(0,8)-rand(0,8), oRubbleSmall);

    if (sprite_index == sBrickGold)
    {
        for (i = 0; i < 3; i += 1)
        {
            gold = instance_create(x+8+rand(0,4)-rand(0,4), y+8+rand(0,4)-rand(0,4), oGoldChunk);
            gold.xVel = rand(0,3) - rand(0,3);
            gold.yVel = rand(2,4) * 1;
        }
    }
    if (sprite_index == sBrickGoldBig)
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
}
