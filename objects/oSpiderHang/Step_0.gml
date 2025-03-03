if ((x > __view_get( e__VW.XView, 0 )-20 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )+4 and
        y > __view_get( e__VW.YView, 0 )-20 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )+4))
{
dist = distance_to_object(oCharacter)
if (collision_point(x+8, y+4, oSolid, 0, 0))
{
    hp = 0;
}
if (hp < 1)
{
    scrCreateBlood(x+8, y+8, 3);
    if (isRealLevel()) global.enemyKills[2] += 1;
    global.spiders += 1;
    global.kills += 1;
    instance_destroy();
}
else if (not collision_point(x, y-16, oSolid, 0, 0) or (dist < 90 and oCharacter.y > y and abs(oCharacter.x - (x+8)) < 8))
{
  spider = instance_create(x, y, oSpider);
  spider.hp = hp;
  instance_destroy();
}
}
