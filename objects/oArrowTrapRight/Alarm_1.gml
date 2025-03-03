if (not isRoom("rLevelEditor"))
{
    // calculate how far to motion detect
    xAct = x+16;
    n = 100;
    while (not collision_point(xAct, y+8, oSolid, 0, 0) && n > 0)
    {
        if (xAct - x > 96) break;
        xAct += 1;
        n -= 1;
    }
    xAct -= (x+8);
    if (xAct < 32) { xAct = 32; }
    obj = instance_create(x+16, y, oArrowTrapTest);
    obj.image_xscale = ceil((xAct-16)/16);
    obj.trapID = id;
}
