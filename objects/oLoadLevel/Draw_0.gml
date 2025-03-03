draw_set_font(global.fontSmall);
draw_set_color(c_white);

if (status == GET_FILE_NAME)
{
    draw_text(__view_get( e__VW.XView, 0 )+32, __view_get( e__VW.YView, 0 )+64, string_hash_to_newline("LOAD LEVEL: " + levelName));
    draw_set_color(c_yellow);
    draw_text(__view_get( e__VW.XView, 0 )+40, __view_get( e__VW.YView, 0 )+96, string_hash_to_newline(tr("LEVELS")));
    draw_text(__view_get( e__VW.XView, 0 )+224, __view_get( e__VW.YView, 0 )+96, string_hash_to_newline(string(page) + "/" + string(numPages)));
    if (msgTimer > 0)
    {
        draw_set_color(c_red);
        draw_text(__view_get( e__VW.XView, 0 )+32, __view_get( e__VW.YView, 0 )+224, string_hash_to_newline(tr("NO SUCH LEVEL EXISTS!")));
    }
    else draw_text(__view_get( e__VW.XView, 0 )+32, __view_get( e__VW.YView, 0 )+224, string_hash_to_newline(tr("PRESS ESCAPE TO RETURN TO TITLE.")));
    draw_set_color(c_white);
    n = 112;
    m = 0;
    i = (page-1)*10;
    while (m < 10 and i+m < numLevels)
    {
        draw_text(__view_get( e__VW.XView, 0 )+40, __view_get( e__VW.YView, 0 )+n, string_hash_to_newline(string_upper(levelList[i+m])));
        n += 8;
        m += 1;
    }
}

if (blackOut)
{
    draw_set_color(c_black);
    draw_rectangle(0, 0, 320, 240, false);
}
