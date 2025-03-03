if (not cleanDeath and not global.cleanSolids)
{
    repeat(3)
    {
        instance_create(x+rand(0,16), y+rand(0,16), oDrip);
    }
}
