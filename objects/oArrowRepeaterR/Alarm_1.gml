xAct = x+16;
while (not collision_point(xAct, y+8, oSolid, 0, 0))
{
    if (xAct - x > 96) break;
    xAct += 1;
}
xAct -= (x+8);
