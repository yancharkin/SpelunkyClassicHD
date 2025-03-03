if ((x > __view_get( e__VW.XView, 0 )-48 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )+48 and
        y > __view_get( e__VW.YView, 0 )-48 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )+48))
{

if (not collision_point(x+8, y+16, oWater, 0, 0))
{
    hp -= 1;
}

if (hp < 1)
{
    if (countsAsKill)
    {
        if (isRealLevel()) global.enemyKills[12] += 1;
        global.megamouths += 1;
        global.kills += 1;
    }
    scrCreateBlood(x+22+rand(0,4), y+14+rand(0,4), 4);
    repeat(4)
    {
        instance_create(x+22+rand(0,4), y+14+rand(0,6), oBone);
    }
    repeat(4)
    {
        obj = instance_create(x+16, y+16, oCrate);
        obj.xVel = rand(0,3)-rand(0,3);
        obj.yVel = -rand(1,2);
    }
    instance_destroy();
}

dist = point_distance(x, y, oPlayer1.x, oPlayer1.y)

if (status == IDLE)
{
    if (dir == 0) // right
    {
        if (collision_point(x+18, y+16, oWater, 0, 0) and not (collision_point(x+18, y+16, oSolid, 0, 0)))
        {
            moveTo(2,0);
        }
        else if (not collision_rectangle(x-32, y, x, y+32, oSolid, 0, 0))
        {
            status = TURN;
            dir = 180;
            x = x-48;
            sprite_index = sJawsTurnL;
            image_index = 0;
        }
    }
    else
    {
        if (collision_point(x-2, y+16, oWater, 0, 0) and not (collision_point(x-2, y+16, oSolid, 0, 0)))
        {
            moveTo(-2,0);
        }
        else if (not collision_rectangle(x+16, y, x+48, y+32, oSolid, 0, 0))
        {
            status = TURN;
            dir = 0;
            sprite_index = sJawsTurnR;
            image_index = 0;
        }
    }
    
    if (not isCollisionBottom(2))
    {
        y += 1;
    }

    if (oPlayer1.swimming and not oPlayer1.dead)
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
        if (dir > 90 and dir < 270) dir = 180;
        else dir = 0;
    }
}
else if (status == ATTACK and instance_exists(oPlayer1))
{
    if (oPlayer1.swimming and not oPlayer1.dead)
    {
        if (sprite_index == sJawsLeft or sprite_index == sJawsRight)
            dir = point_direction(x+8, y+16, oPlayer1.x, oPlayer1.y-8);
        
        turn = false;
        if (oPlayer1.x < x+8)
        {
            if (sprite_index == sJawsRight and not collision_rectangle(x-32, y, x, y+32, oSolid, 0, 0))
            {
                status = TURN;
                dir = 180;
                x = x-48;
                sprite_index = sJawsTurnL;
                image_index = 0;
                turn = true;
            }
        }
        else
        {
            if (sprite_index == sJawsLeft and not collision_point(x-2, y+16, oSolid, 0, 0))
            {
                status = TURN;
                dir = 0;
                sprite_index = sJawsTurnR;
                image_index = 0;
                turn = true;
            }
        }
        
        if (not turn)
        {
            if (collision_point(x + cos(degtorad(dir)), y - sin(degtorad(dir)), oWater, 0, 0) and
            not collision_point(x + cos(degtorad(dir)), y - sin(degtorad(dir)), oSolid, 0, 0))
            {
                moveTo(3 * cos(degtorad(dir)), -3 * sin(degtorad(dir)));
            }
        }
    }
    else
    {
        status = IDLE;
        if (dir > 90 and dir < 270) dir = 180;
        else dir = 0;
    }
}

if (bubbleTimer > 0) bubbleTimer -= 1;
else
{
    instance_create(x, y+16, oBubble);
    bubbleTimer = bubbleTimerMax;
}

if (sprite_index == sJawsLeft)
{
    setCollisionBounds(0, 0, 64, 32);
}
else if (sprite_index == sJawsRight)
{
    setCollisionBounds(-48, 0, 16, 32);
}

}
