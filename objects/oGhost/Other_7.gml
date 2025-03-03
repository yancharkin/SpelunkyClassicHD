if (sprite_index == sGhostTurnRight)
{
    sprite_index = sGhostRight;
}
else if (sprite_index == sGhostTurnLeft)
{
    sprite_index = sGhostLeft;
}
else if (sprite_index == sGhostDisappear)
{
    instance_destroy();
}
