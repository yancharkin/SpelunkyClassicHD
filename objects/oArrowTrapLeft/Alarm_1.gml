if (not isRoom("rLevelEditor"))
{
    xAct = x-1;
    while (not collision_point(xAct, y+8, oSolid, 0, 0))
    {
        if (x - xAct > 96) break;
        xAct -= 1;
    }
    if (xAct > x-16) { xAct = x-16; }
    obj = instance_create(xAct, y, oArrowTrapTest);
    obj.image_xscale = ceil(((x-1)-xAct)/16);
    obj.trapID = id;
}
