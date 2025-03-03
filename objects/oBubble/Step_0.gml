y += yVel;

if (not collision_point(x, y, oWater, 0, 0))
{
    instance_destroy();
}
