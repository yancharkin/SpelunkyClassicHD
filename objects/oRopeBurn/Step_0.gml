y += yVel;

if (collision_point(x, y, oSolid, 0, 0) or not collision_rectangle(x-1, y-8, x+1, y+8, oRope, 0, 0))
{
    instance_destroy();
}

if (collision_point(x, y, oRope, 0, 0))
{
    rope = instance_nearest(x, y, oRope);
    with rope
    {
        burnTimer = 1;
    }
}
