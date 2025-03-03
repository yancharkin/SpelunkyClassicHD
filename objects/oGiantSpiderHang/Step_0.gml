if ((x > __view_get( e__VW.XView, 0 )-32 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) and
        y > __view_get( e__VW.YView, 0 )-32 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )))
{
dist = distance_to_object(oCharacter)
if (collision_point(x+16, y+8, oSolid, 0, 0))
{
    hp = 0;
}
if (hp < 1)
{
    repeat(rand(1,3))
    {
        n = rand(1,3);
        switch (n)
        {
            case 1: { gem = instance_create(x+16, y+24, oEmeraldBig); break; }
            case 2: { gem = instance_create(x+16, y+24, oSapphireBig); break; }
            case 3: { gem = instance_create(x+16, y+24, oRubyBig); break; }
        }
        gem.xVel = rand(0,3) - rand(0,3);
        gem.yVel = -2;
    }
    obj = instance_create(x+16, y+24, oPaste);
    obj.cost = 0;
    obj.forSale = false;
    scrCreateBlood(x+16, y+24, 4);
    if (countsAsKill)
    {
        if (isRealLevel()) global.enemyKills[3] += 1;
        global.giantspiders += 1;
        global.kills += 1;
    }
    instance_destroy();
}
else if (hp < 10 or not collision_point(x, y-16, oSolid, 0, 0) or (dist < 90 and oCharacter.y > y and abs(oCharacter.x - (x+16)) < 8))
{
  spider = instance_create(x, y, oGiantSpider);
  spider.hp = hp;
  instance_destroy();
}
}
