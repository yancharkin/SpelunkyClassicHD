xAct = x-1;
while (not collision_point(xAct, y+8, oSolid, 0, 0))
{
    if (x - xAct > 96) break;
    xAct -= 1;
}
xAct = (x+8) - xAct;
