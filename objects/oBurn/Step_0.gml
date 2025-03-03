y += yVel;

if (collision_point(x, y, oSolid, 0, 0))
{
    instance_destroy();
}
