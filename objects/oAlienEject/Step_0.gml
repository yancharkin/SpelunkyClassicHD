if ((x > __view_get( e__VW.XView, 0 )-20 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )+4 and
        y > __view_get( e__VW.YView, 0 )-20 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )+16))
{
x += xVel;
y += yVel;

if (status == EJECT)
{
    xVel = 0;
    yVel += 0.5;
    if (yVel >= 0 or isCollisionTop(1))
    {
        yVel = 0;
        status = FLOAT;
        sprite_index = sAlienDeploy;
    }
    if (rand(1,5) == 1) instance_create(x+rand(0,3)-rand(0,3), y+rand(0,3)-rand(0,3), oBurn);
}
else if (status == FLOAT)
{
    xVel = 0;
    yVel = 2;
    if (collision_point(x, y+6, oSolid, 0, 0))
    {
        instance_create(x-8, y-12, oAlien);
        instance_destroy();
    }
    else if (dir == 0)
    {
        xVel = -1;
        if (collision_point(x-8, y, oSolid, 0, 0)) dir = 99;
    }
    else if (dir == 1)
    {
        xVel = 1;
        if (collision_point(x+8, y, oSolid, 0, 0)) dir = 99;
    }
}
}
