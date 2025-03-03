if (collision_point(x+12, y, oLava, 0, 0) and burnTimer == 0)
{
    instance_create(x+8, y, oRopeBurn);
}

if (burnTimer > 1) burnTimer -= 1;
else if (burnTimer == 1)
{
    if (oPlayer1.state == 14)
    {
        if (collision_point(x+12, y+4, oPlayer1, false, false))
        {
            oPlayer1.state = 16;
        }
    }
    instance_destroy();
}
