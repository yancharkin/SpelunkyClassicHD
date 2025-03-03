if ((x > __view_get( e__VW.XView, 0 )-16 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) and
        y > __view_get( e__VW.YView, 0 )-16 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )))
{
    if (counter > 0) counter -= 1;
    if (not collision_point(x, y+16, oSolid, 0, 0)) instance_destroy();
}
