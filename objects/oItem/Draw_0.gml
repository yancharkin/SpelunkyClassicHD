draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, 1);
if (cost > 0)
{
    draw_sprite_ext(sSmallCollect, cimg, x, y-12, 1, 1, 0, c_white, 1);
    cimg += 1;
    if (cimg > 9) cimg = 0;
}
