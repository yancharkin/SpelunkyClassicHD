y += yVel;
yVel += yAcc;
if (yVel > 4) yVel = 0;

/*if (collision_point(x, y, oDark, 0, 0) or
    collision_point(x, y, oDarkFall, 0, 0) or
    collision_point(x, y, oIce, 0, 0))
{
    instance_destroy();
}*/
/* */
/*  */
