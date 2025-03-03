if ((x > __view_get( e__VW.XView, 0 )-16 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) and
        y > __view_get( e__VW.YView, 0 )-16 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )))
{
if (not collision_point(x+8, y+16, oSolid, 0, 0))
{
    y += yVel;
    yVel += yAcc;
}

if (collision_point(x+8, y+15, oSolid, 0, 0))
{
    y -= 1;
}

if (abs(oPlayer1.y-(y+8)) < 8 and abs(oPlayer1.x-(x+8)) < 64)
{
    sprite_index = sSkeletonCreateL;
}
}
