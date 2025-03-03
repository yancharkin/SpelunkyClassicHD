if (status == 0)
{
    x -= 1;
    if (x <= 160+64)
    {
        status = 1;
    }
}
else if (status == 1)
{
    x -= 0.01;
}
else if (status == 2)
{
    x -= 2;
}

if (x < -64)
{
    oCredits2.fadeOut = true;
}
