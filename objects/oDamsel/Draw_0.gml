if (facing == RIGHT) image_xscale = -1;
else image_xscale = 1;

draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

if (cost > 0)
{
    draw_sprite_ext(sSmallCollect, cimg, x, y-12, 1, 1, 0, c_white, 1);
    cimg += 1;
    if (cimg > 9) cimg = 0;
}
