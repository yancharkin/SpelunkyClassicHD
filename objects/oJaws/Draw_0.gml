draw_sprite(sprite_index, -1, x, y);
if (sprite_index == sJawsLeft)
{
    if (hp < 10) draw_sprite(sJawsBody3L, 0, x+16, y);
    else if (hp < 20) draw_sprite(sJawsBody2L, 0, x+16, y);
    else draw_sprite(sJawsBody1L, 0, x+16, y);
}
else if (sprite_index == sJawsRight)
{
    if (hp < 10) draw_sprite(sJawsBody3R, 0, x-48, y);
    else if (hp < 20) draw_sprite(sJawsBody2R, 0, x-48, y);
    else draw_sprite(sJawsBody1R, 0, x-48, y);
}

