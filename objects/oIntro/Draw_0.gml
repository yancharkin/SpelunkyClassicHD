draw_set_color(c_black);
draw_set_alpha(fadeLevel);
draw_rectangle(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), __view_get( e__VW.XView, 0 )+global.display_w, __view_get( e__VW.YView, 0 )+global.display_h, false);
draw_set_alpha(1);

offsetY = 8 - global.fontSmallHeight;

if (drawStatus > 0) {
    drawTextHCentered(tr(str1), "small", c_white, 0, 116-16+offsetY)
}
if (drawStatus > 1) {
    drawTextHCentered(tr(str2), "small", c_white, 0, 116+offsetY)
}
if (drawStatus > 2) {
    drawTextHCentered(tr(str3), "small", c_white, 0, 116+16+offsetY)
}