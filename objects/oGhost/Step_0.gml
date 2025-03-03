if (hp < 1)
{
    //global.bats += 1;
    global.kills += 1;
    instance_destroy();
}

dir = 0;
dist = point_distance(x+8, y+8, oCharacter.x, oCharacter.y);

if (status == IDLE)
{
    // do nothing
}
else if (status == ATTACK)
{
    dir = point_direction(x+8, y+8, oCharacter.x, oCharacter.y)
    x += 1 * cos(degtorad(dir));
    y += -1 * sin(degtorad(dir));
    if (oCharacter.x < x+8)
    {
        if (sprite_index == sGhostRight) sprite_index = sGhostTurnLeft;
    }
    else
    {
        if (sprite_index == sGhostLeft) sprite_index = sGhostTurnRight;
    }
}
