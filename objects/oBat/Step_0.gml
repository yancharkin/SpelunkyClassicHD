if ((x > __view_get( e__VW.XView, 0 )-20 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )+4 and
        y > __view_get( e__VW.YView, 0 )-20 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )+4))
{
moveTo(xVel, yVel);

if (collision_point(x+8, y+8, oSolid, 0, 0)) hp = -999;

if (hp < 1)
{
    scrCreateBlood(x+8, y+8, 3);
    if (countsAsKill)
    {
        if (isRealLevel()) global.enemyKills[0] += 1;
        global.bats += 1;
        global.kills += 1;
    }
    instance_destroy();
}

dir = 0
dist = point_distance(x+8, y+8, oPlayer1.x, oPlayer1.y)

if (status == HANG)
{
  if (not oPlayer1.swimming and not oPlayer1.dead and
      ((dist < 90 and oPlayer1.y > y + 16) or not collision_point(x+8, y-1, oSolid, 0, 0)))
  {
    status = ATTACK;
    playSound(global.sndBat);
  }
  
  sprite_index = sBatHang
}
else if (instance_exists(oPlayer1) and not oPlayer1.swimming and not oPlayer1.dead)
{
    if (dist < 160)
    {
        dir = point_direction(x+8, y+8, oPlayer1.x, oPlayer1.y)
        if (isCollisionRight(1) and oPlayer1.x > x+8)
        {
            if (oPlayer1.y < y+8) dir = 90;
            else dir = 270;
        }
        if (isCollisionLeft(1) and oPlayer1.x < x+8)
        {
            if (oPlayer1.y < y+8) dir = 90;
            else dir = 270;
        }
        if (isCollisionTop(1) and oPlayer1.y < y+8 and abs(oPlayer1.x - x) > 8)
        {
            if (oPlayer1.x < x+8) dir = 180;
            else dir = 0;
        }
        if (isCollisionBottom(1) and oPlayer1.y > y+8 and abs(oPlayer1.x - x) > 8)
        {
            if (oPlayer1.x < x+8) dir = 180;
            else dir = 0;
        }
        
        if (collision_point(x+8, y+16, oWater, 0, 0) and dir > 180 and dir < 360)
        {
            dir = 90;
        }
        
        if (not collision_point(x, y+12, oWater, 0, 0) or oPlayer1.y < y)
        {
            xVel = 1 * cos(degtorad(dir));
            yVel = -1 * sin(degtorad(dir));
        }
    }
    else
    {
        if (collision_point(x+8, y-1, oSolid, 0, 0)) status = HANG;
        else
        {
            dir = 90;
            xVel = 1 * cos(degtorad(dir));
            yVel = -1 * sin(degtorad(dir));  
        }
    }
  
    if (oPlayer1.x < x+8)
        sprite_index = sBatLeft
    else
        sprite_index = sBatRight
}
else
{
    if (collision_point(x+8, y-1, oSolid, 0, 0)) status = HANG;
    else
    {
        dir = 90;
        xVel = 1 * cos(degtorad(dir));
        yVel = -1 * sin(degtorad(dir));  
    }
}}
