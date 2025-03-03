if (not collision_point(x+8, y+16, oSolid, 0, 0))
{
    y += yVel;
    yVel += yAcc;
}

if (collision_point(x+8, y+15, oSolid, 0, 0))
{
    y -= 1;
}
