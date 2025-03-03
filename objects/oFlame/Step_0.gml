action_inherited();
if (yVel > 6) instance_destroy();

if (isCollisionBottom(1))
{
    if (life > 20) life = 20;
}
