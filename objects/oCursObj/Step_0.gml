if (mouse_x > __view_get( e__VW.XView, 0 ) and mouse_x < __view_get( e__VW.XView, 0 )+320 and
    mouse_y > __view_get( e__VW.YView, 0 ) and mouse_y < __view_get( e__VW.YView, 0 )+240)
{
    x = mouse_x-8;
    y = mouse_y-8;
    move_snap(16, 16);
    if (x < 0) x = 0;
    if (x > room_width-16) x = room_width-16;
    if (y < 0) y = 0;
    if (y > room_height-16) y = room_height-16;
}
