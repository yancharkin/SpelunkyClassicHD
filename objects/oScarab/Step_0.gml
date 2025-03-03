if ((x > __view_get( e__VW.XView, 0 )-20 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )+4 and
        y > __view_get( e__VW.YView, 0 )-20 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )+4))
{
moveTo(xVel, yVel);

if (collision_point(x+8, y+8, oSolid, 0, 0)) hp = -999;

if (hp < 1)
{
    repeat(3)
    {
        obj = instance_create(x+2+rand(0,14), y+2+rand(0,14), oFlareSpark);
        obj.yVel = rand(1,3);
    }
    instance_destroy();
}

dir = 0
dist = point_distance(x+8, y+8, oCharacter.x, oCharacter.y)

if (status == IDLE)
{
    if (xVel > 0) xVel -= 0.5;
    if (yVel > 0) yVel -= 0.5;
    if (xVel < 0) xVel += 0.5;
    if (yVel < 0) yVel += 0.5;
    if (abs(xVel) < 1) { xVel = 0; }
    if (abs(yVel) < 1) { yVel = 0; }
    
    if (xVel == 0 and yVel == 0 and counter > 0) counter -= 1;
    
    if (counter == 0 and xVel < 1 and yVel < 1)
    {
        if (dist < 64)
        {
            dir = point_direction(x+8, y+8, oCharacter.x, oCharacter.y) + 180;
        }
        else
        {
            dir = rand(0,360);
        }
        xVel = 4 * cos(degtorad(dir));
        yVel = -4 * sin(degtorad(dir));
        counter = rand(10,30);
    }
    
    if (isCollisionRight(1) and xVel > 0)
    {
        xVel = -xVel;
    }
    if (isCollisionLeft(1) and xVel < 0)
    {
        xVel = -xVel;
    }
    if (isCollisionTop(1) and yVel < 0)
    {
        yVel = -yVel;
    }
    if (isCollisionBottom(1) and yVel > 0)
    {
        yVel = -yVel;
    }
}
}
