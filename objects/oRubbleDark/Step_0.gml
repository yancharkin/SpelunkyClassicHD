y += yVel;
yVel += yAcc;

if (collision_point(x, y, oBrick, 0, 0) or
    collision_point(x, y, oBlock, 0, 0))
{
    instance_destroy();
}
