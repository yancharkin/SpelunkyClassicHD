action_inherited();
if (not cleanDeath and not global.cleanSolids)
{
    instance_create(x+8+rand(0,8)-rand(0,-8), y+8+rand(0,8)-rand(0,-8), oRubbleDark);
    instance_create(x+8+rand(0,8)-rand(0,-8), y+8+rand(0,8)-rand(0,-8), oRubbleDarkSmall);
    instance_create(x+8+rand(0,8)-rand(0,-8), y+8+rand(0,8)-rand(0,-8), oRubbleDarkSmall);
    
    if (sprite_index == sDarkGold)
    {
        for (i = 0; i < 3; i += 1)
        {
            gold = instance_create(x+8+rand(0,4)-rand(0,4), y+8+rand(0,4)-rand(0,4), oGoldChunk);
            gold.xVel = rand(0,3) - rand(0,3);
            gold.yVel = rand(2,4) * 1;
        }
    }

    if (sprite_index == sDarkGoldBig)
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

