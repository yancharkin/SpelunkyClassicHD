x += xVel;
y += yVel;
yVel += yAcc;

if (collision_point(x, y, oWaterSwim, 0, 0))
{
    if (type == "Drip") instance_destroy();
    else if (type == "Leaf") { yVel = 0; sprite_index = sLeafStill; }
    else yVel = 0.2;
}
else if (collision_point(x, y, oLava, 0, 0))
{
    instance_destroy();
}

if (collision_point(x, y, oSolid, 0, 0))
{
    instance_destroy();
}

if (view_enabled)
{
    if (x < __view_get( e__VW.XView, 0 ) - 32 or
        x > __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) + 32 or
        y < __view_get( e__VW.YView, 0 ) - 32 or
        y > __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) + 32)
    {
        instance_destroy();
    }
}
