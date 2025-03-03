if (not instance_exists(oPlayer1))
{
    instance_destroy();
}
else if (sprite_index = sWhipRight)
{
    x = oPlayer1.x+16;
    y = oPlayer1.y;
}
else if (sprite_index = sWhipLeft)
{
    x = oPlayer1.x-16;
    y = oPlayer1.y;
}

