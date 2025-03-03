
if (global.darkLevel)
{
    draw_set_alpha(darkness);
    draw_set_color(c_black);
    draw_rectangle(__view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ), __view_get( e__VW.XView, 0 )+global.display_w, __view_get( e__VW.YView, 0 )+global.display_h, false);
    draw_set_alpha(1);

}

/*
if (not global.darkLevel and global.messageTimer > 0)
{
    draw_set_font(global.fontSmall);
    draw_set_color(c_white);
    strLen = string_length(global.message)*global.fontSmallWidth;
    n = global.display_w - strLen;
    n = ceil(n / 2);
    draw_text(view_xview[0]+n, view_yview[0]+216, string(global.message));
    
    if (not isLevel("rTutorial")) draw_set_color(c_yellow);
    strLen = string_length(global.message2)*global.fontSmallWidth;
    n = global.display_w - strLen;
    n = ceil(n / 2);
    draw_text(view_xview[0]+n, view_yview[0]+224, string(global.message2));
    
    global.messageTimer -= 1;
}
*/

/* */
/*  */
