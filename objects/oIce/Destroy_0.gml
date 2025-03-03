if (not cleanDeath and not global.cleanSolids)
{
    repeat(3)
    {
        instance_create(x+rand(0,16), y+rand(0,16), oDrip);
    }

    if (collision_point(x+8, y+8, oFrozenCaveman, 0, 0))
    {
        with (instance_place(x+8, y+8, oFrozenCaveman))
        {
            instance_destroy();
        }
    }
}
