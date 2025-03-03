action_inherited();
if (dying)
{
    if (deathTimer > 0) deathTimer -= 1;
    else instance_destroy();
}
