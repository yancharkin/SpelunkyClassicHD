if (isRoom("rCredits1") and instance_exists(oCamel))
{
    x += 0.01;
}
else if (__view_get( e__VW.XView, 0 ) != 0)
{
    xOff -= 0.01;
}
x = __view_get( e__VW.XView, 0 ) + 208 + xOff;
