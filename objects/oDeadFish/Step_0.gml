if ((x > __view_get( e__VW.XView, 0 )-16 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) and
        y > __view_get( e__VW.YView, 0 )-16 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )))
{
if (hp < 1)
{
    repeat(3)
    {
        instance_create(x+4, y+4, oBone);
    }
    if (countsAsKill)
    {
        if (isRealLevel()) global.enemyKills[11] += 1;
        global.deadfish += 1;
        global.kills += 1;
    }
    instance_destroy()
}

dist = point_distance(x, y, oCharacter.x, oCharacter.y)

if (status == IDLE)
{
    if (dir == 0)
    {
        if (collision_point(x+8+2, y, oWater, 0, 0) and not (collision_point(x+10, y, oSolid, 0, 0)))
            moveTo(1,0);
        else dir = 180;
    }
    else
    {
        if (collision_point(x-2, y, oWater, 0, 0) and not (collision_point(x-2, y, oSolid, 0, 0)))
            moveTo(-1,0);
        else dir = 0;
    }

    if (dist < 90 and oCharacter.swimming)
    {
        status = ATTACK;
    }
}
else if (status == PAUSE)
{
    if (counter > 0) counter -= 1;
    else
    {
        status = IDLE;
        dir = rand(0,1)*180;
    }
}
else if (instance_exists(oCharacter))
{
    if (dist < 90 and oCharacter.swimming and not oCharacter.dead)
    {
        dir = point_direction(x, y, oCharacter.x, oCharacter.y)+rand(0,1)-rand(0,1);
        if (collision_point(x + cos(degtorad(dir)), y - sin(degtorad(dir)), oWater, 0, 0))
            moveTo(1 * cos(degtorad(dir)), -1 * sin(degtorad(dir)))
    }
    else
    {
        status = PAUSE;
        counter = rand(20,40);
    }
}

if (dir > 90 and dir < 270)
    sprite_index = sDeadFishLeft;
else
    sprite_index = sDeadFishRight;
    
if (not collision_point(x+4, y+4, oWater, 0, 0))
{
    instance_create(x, y, oFishBone);
    instance_destroy();
}
}
