if (facing == RIGHT) draw_sprite_ext(sprite_index, image_index, x+16, y, -1, image_yscale, image_angle, image_blend, image_alpha);
else draw_sprite_ext(sprite_index, image_index, x, y, 1, image_yscale, image_angle, image_blend, image_alpha);
// draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 1);
if (hasGun and status != IDLE and status != FOLLOW)
{
    if (facing == LEFT) draw_sprite_ext(sShotgunLeft, 0, x+6, y+10, 1, 1, 0, c_white, 1);
    else draw_sprite_ext(sShotgunRight, 0, x+10, y+10, 1, 1, 0, c_white, 1);
}
