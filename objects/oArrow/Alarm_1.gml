instance_create(x, y, oExplosion);
if (global.graphicsHigh)
{
    scrCreateFlame(x, y, 3);
}

if (held)
{
    if (oCharacter) oCharacter.holdItem = 0;
}
instance_destroy();
