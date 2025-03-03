if (sprite_index = sSpearsLeft and not collision_point(x+16, y, oSpearTrapTop, 0, 0) and not collision_point(x+16, y, oSpearTrapBottom, 0, 0))
{
    instance_destroy();
}
if (sprite_index = sSpearsRight and not collision_point(x-16, y, oSpearTrapTop, 0, 0) and not collision_point(x-16, y, oSpearTrapBottom, 0, 0))
{
    instance_destroy();
}
depth = 995;
