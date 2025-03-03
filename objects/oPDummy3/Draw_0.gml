if (facing == RIGHT) image_xscale = -1;
else image_xscale = 1;

draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
