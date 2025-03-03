if (isRoom("rCredits1") and instance_exists(oCamel))
{
    x += 0.02;
}
else if (__view_get( e__VW.XView, 0 ) != 0)
{
    xOff -= 0.02;
}
x = __view_get( e__VW.XView, 0 ) + xOff;
