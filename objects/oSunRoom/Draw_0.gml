life = global.plife;
if (life < 0) life = 0;
draw_set_font(global.fontLarge);
draw_set_color(c_white);
draw_sprite(sHeart, -1, __view_get( e__VW.XView, 0 )+8, __view_get( e__VW.YView, 0 )+8);
draw_text(__view_get( e__VW.XView, 0 )+24, __view_get( e__VW.YView, 0 )+8, string_hash_to_newline(life));
draw_sprite(sDamselIcon, -1, __view_get( e__VW.XView, 0 )+64, __view_get( e__VW.YView, 0 )+8);
draw_text(__view_get( e__VW.XView, 0 )+64+16, __view_get( e__VW.YView, 0 )+8, string_hash_to_newline(points));
if (drawStatus < 3)
{
    drawTextHCentered(tr("DAMSEL CHALLENGE BEGINS IN ") + string(3-drawStatus) + "...", "small", c_yellow, -global.room_offset, 216);
}

