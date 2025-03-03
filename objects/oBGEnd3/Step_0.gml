if (isRoom("rEnd3"))
{
    // do nothing
}
else if (instance_exists(oCamel))
{
    if (oCamel.status == 2)
    {
        // do nothing
    }
    else if (oCamel.x <= 160)
    {
        // do nothing
        
        // or original:
        x = __view_get( e__VW.XView, 0 ) + xOff;
        xOff += 0.02;
    }
}

