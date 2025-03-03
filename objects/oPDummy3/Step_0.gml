y += yVel;

if (status == TRANSITION)
{
    if (x >= 904)
    {
        sprite_index = sDuckLeft;
        status = 1;
    }
    else x += 2;
}
else if (status == ROPEDROP)
{
    alarm[0] = 20;
    status += 1;
}
else if (status == 3)
{
    sprite_index = sRunLeft;
    if (x >= 920)
    {
        sprite_index = sClimbUp3;
        status = 4;
    }
    else x += 2;
}
else if (status == 4)
{
    if (y >= 256)
    {
        oIntro.fadeOut = true;
    }
    else
    {
        y += 2;
    }
    if (alarm[2] < 1) alarm[2] = 8;
}
