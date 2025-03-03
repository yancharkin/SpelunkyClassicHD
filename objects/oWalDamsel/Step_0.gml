if (image_index == 11)
{
    instance_create(x, y+16, oHeart);
    if (not oEndCustom.fadeOut) playSound(global.sndKiss);
}
