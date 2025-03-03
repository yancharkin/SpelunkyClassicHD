action_inherited();
if (status == DEAD)
{
    if (deathTimer > 0) deathTimer -= 1;
    else
    {
        scrCreateBlood(x+8, y+8, 3);
        instance_destroy();
    }
}

