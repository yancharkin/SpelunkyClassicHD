if (not spriteSet)
{
    if ((collision_point(x-16, y, oTree, 0, 0) or collision_point(x-16, y, oLeaves, 0, 0))and
    (collision_point(x+16, y, oTree, 0, 0) or collision_point(x+16, y, oLeaves, 0, 0)))
    {
        sprite_index = sLeavesTop;
    }
}

if (x > __view_get( e__VW.XView, 0 )-16 and x < __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 )+16 and
        y > __view_get( e__VW.YView, 0 )-16 and y < __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 )+16)
{
    if (sprite_index == sLeavesTop)
    {
        if ((not collision_point(x-16, y, oTree, 0, 0) and not collision_point(x-16, y, oLeaves, 0, 0)) or
            (not collision_point(x+16, y, oTree, 0, 0) and not collision_point(x+16, y, oLeaves, 0, 0)))
        {
            instance_destroy();
        }
    }
    else if (sprite_index == sLeaves or sprite_index == sLeavesDead)
    {
        if (not collision_point(x+16, y, oTree, 0, 0) and not collision_point(x+16, y, oLeaves, 0, 0))
        {
            instance_destroy();
        }
    }
    else if (sprite_index == sLeavesRight or sprite_index == sLeavesDeadR)
    {
        if (not collision_point(x-16, y, oTree, 0, 0) and not collision_point(x-16, y, oLeaves, 0, 0))
        {
            instance_destroy();
        }
    }
}
