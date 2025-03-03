if (active)
{
if (hp < 1)
{
    scrCreateBlood(x+4, y+4, 3);
    if (countsAsKill)
    {
        if (isRealLevel()) global.enemyKills[11] += 1;
        global.piranhas += 1;
        global.kills += 1;
    }
    instance_destroy()
}

dist = point_distance(x+4, y+4, oCharacter.x, oCharacter.y)

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

    if (dist < 90 and oCharacter.swimming and not oCharacter.dead)
    {
        status = ATTACK;
    }
    
    obj = instance_nearest(x, y, oCaveman);
    if (obj) if (obj.hp <= 0) obj = 0;
    if (!obj) obj = instance_nearest(x, y, oShopkeeper);
    if (obj) if (obj.hp <= 0) obj = 0;
    if (!obj) obj = instance_nearest(x, y, oHawkman);
    if (obj) if (obj.hp <= 0) obj = 0;
    if (!obj) obj = instance_nearest(x, y, oYeti);
    if (obj) if (obj.hp <= 0) obj = 0;
    if (obj)
    {
        if (obj.swimming && obj.hp > 0)
        {
            status = ATTACK_ENEMY;
        }
    }
}
else if (status == PAUSE)
{
    canBite = true;
    if (counter > 0) counter -= 1;
    else
    {
        status = IDLE;
        dir = rand(0,1)*180;
    }
}
else if (status == ATTACK && instance_exists(oCharacter))
{
    if (dist < 90 and oCharacter.swimming and not oCharacter.dead)
    {
        dir = point_direction(x+4, y+4, oCharacter.x, oCharacter.y)+rand(0,1)-rand(0,1);
        if (collision_point(x + cos(degtorad(dir)), y - sin(degtorad(dir)), oWater, 0, 0))
            moveTo(1 * cos(degtorad(dir)), -1 * sin(degtorad(dir)))
    }
    else
    {
        status = PAUSE;
        counter = rand(20,40);
    }
}
else if (status == ATTACK_ENEMY)
{
    obj = instance_nearest(x, y, oCaveman);
    if (obj) if (obj.hp <= 0) obj = 0;
    if (!obj) obj = instance_nearest(x, y, oShopkeeper);
    if (obj) if (obj.hp <= 0) obj = 0;
    if (!obj) obj = instance_nearest(x, y, oHawkman);
    if (obj) if (obj.hp <= 0) obj = 0;
    if (!obj) obj = instance_nearest(x, y, oYeti);
    if (obj) if (obj.hp <= 0) obj = 0;
    if (obj)
    {
        if (!obj.swimming || obj.hp <= 0)
        {
            status = PAUSE;
        }
    }
    else status = PAUSE;
    
    if (status != PAUSE)
    {
        dir = point_direction(x+4, y+4, obj.x+8, obj.y+8)+rand(0,1)-rand(0,1);
        if (collision_point(x + cos(degtorad(dir)), y - sin(degtorad(dir)), oWater, 0, 0))
            moveTo(1 * cos(degtorad(dir)), -1 * sin(degtorad(dir)))
        else
        {
            status = PAUSE;
            counter = rand(20,40);
        }
        
        dist = point_distance(x+4, y+4, obj.x+8, obj.y+8)
        if (dist < 4)
        {
            obj.status = 2;
            if (canBite)
            {
                obj.hp -= 1;
                canBite = false;
                alarm[0] = 10;
                scrCreateBlood(x+4, y+4, 1);
            }
        }
    }
    else counter = rand(20,40);
}

if (bubbleTimer > 0) bubbleTimer -= 1;
else
{
    instance_create(x, y, oBubble);
    bubbleTimer = (rand(bubbleTimerMax-10, bubbleTimerMax+10));
}


if (dir > 90 and dir < 270)
    sprite_index = sPiranhaLeft;
else
    sprite_index = sPiranhaRight;
    
if (not collision_point(x+4, y+4, oWater, 0, 0))
{
    instance_create(x, y, oFishBone);
    instance_destroy();
}
}
