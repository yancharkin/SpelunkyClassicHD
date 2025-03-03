action_inherited();
if ((sprite_index == sDamselKissL or sprite_index = sPKissL) and image_index == 7)
{
    instance_create(x-8, y-8, oHeart);
    playSound(global.sndKiss);
}
