draw_set_font(global.fontSmall);
draw_set_color(c_white);

if (status == GET_FILE_NAME)
{
    draw_text(__view_get( e__VW.XView, 0 )+9, __view_get( e__VW.YView, 0 )+116, string_hash_to_newline("EDIT LEVEL: " + levelName));
}
else if (status == EDIT_DOOR)
{
    draw_text(__view_get( e__VW.XView, 0 )+9, __view_get( e__VW.YView, 0 )+100, string_hash_to_newline(tr("LABEL:")));
    draw_text(__view_get( e__VW.XView, 0 )+9, __view_get( e__VW.YView, 0 )+116, string_hash_to_newline(textEdit));
}
else if (status == EDIT_MSG)
{
    draw_text(__view_get( e__VW.XView, 0 )+9, __view_get( e__VW.YView, 0 )+100, string_hash_to_newline(tr("MESSAGE:")));
    draw_text(__view_get( e__VW.XView, 0 )+9, __view_get( e__VW.YView, 0 )+116, string_hash_to_newline(textEdit));
}
else if (status == INFO_NAME)
{
    draw_text(__view_get( e__VW.XView, 0 )+9, __view_get( e__VW.YView, 0 )+116, string_hash_to_newline("LEVEL NAME: " + levelName));
}
else if (status == INFO_AUTHOR)
{
    draw_text(__view_get( e__VW.XView, 0 )+9, __view_get( e__VW.YView, 0 )+116, string_hash_to_newline("AUTHOR: " + author));
}
else if (status == INFO_MUSIC)
{
    draw_text(__view_get( e__VW.XView, 0 )+9, __view_get( e__VW.YView, 0 )+116, string_hash_to_newline(tr("MUSIC: ") + music));
}
else if (status == INFO_LIFE)
{
    draw_text(__view_get( e__VW.XView, 0 )+9, __view_get( e__VW.YView, 0 )+116, string_hash_to_newline("START LIFE: " + lifeStart));
}
else if (status == INFO_BOMBS)
{
    draw_text(__view_get( e__VW.XView, 0 )+9, __view_get( e__VW.YView, 0 )+116, string_hash_to_newline("START BOMBS: " + bombStart));
}
else if (status == INFO_ROPE)
{
    draw_text(__view_get( e__VW.XView, 0 )+9, __view_get( e__VW.YView, 0 )+116, string_hash_to_newline("START ROPE: " + ropeStart));
}
else if (status == INFO_NEXT)
{
    draw_text(__view_get( e__VW.XView, 0 )+9, __view_get( e__VW.YView, 0 )+116, string_hash_to_newline("NEXT LEVEL: " + nextLevel));
}
else if (status == EXIT or status == NEW)
{
    strLen = string_length(tr("SAVE LEVEL? (Y/N)"))*global.fontSmallWidth;
    n = 320 - strLen;
    n = ceil(n / 2);
    draw_text(__view_get( e__VW.XView, 0 )+n, __view_get( e__VW.YView, 0 )+116, string_hash_to_newline(tr("SAVE LEVEL? (Y/N)")));
    
    m = 16;
    draw_set_color(c_yellow);
    if not (instance_exists(oEntrance))
    {
        strLen = string_length(tr("WARNING: NO ENTRANCE!"))*global.fontSmallWidth;
        n = 320 - strLen;
        n = ceil(n / 2);
        draw_text(__view_get( e__VW.XView, 0 )+n, __view_get( e__VW.YView, 0 )+116+m, string_hash_to_newline(tr("WARNING: NO ENTRANCE!")));
        m += 8;
    }
    
    if not (instance_exists(oExit))
    {
        strLen = string_length(tr("WARNING: NO EXIT!"))*global.fontSmallWidth;
        n = 320 - strLen;
        n = ceil(n / 2);
        draw_text(__view_get( e__VW.XView, 0 )+n, __view_get( e__VW.YView, 0 )+116+m, string_hash_to_newline(tr("WARNING: NO EXIT!")));
    }
}
else
{
    //draw_text(view_xview[0], view_yview[0], string(mouse_x) + ", " + string(mouse_y));
    if (__view_get( e__VW.YView, 0 ) == 0)
    {
        draw_text(__view_get( e__VW.XView, 0 )+40, __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )-32, string_hash_to_newline(levelName + " BY " + author));
        draw_text(__view_get( e__VW.XView, 0 )+40, __view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )-24, string_hash_to_newline(string(oCursObj.x) + ", " + string(oCursObj.y)));
    }
    else
    {
        draw_text(__view_get( e__VW.XView, 0 )+40, __view_get( e__VW.YView, 0 )+16, string_hash_to_newline(levelName + " BY " + author));
        draw_text(__view_get( e__VW.XView, 0 )+40, __view_get( e__VW.YView, 0 )+24, string_hash_to_newline(string(oCursObj.x) + ", " + string(oCursObj.y)));
    }
}

