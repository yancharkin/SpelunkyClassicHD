x += xVel;
y += yVel;

if (status == 0)
{
    if (y >= 160)
    {
        sprite_index = sFallLeft;
        yVel = 4;
        if (yVel < 6) yVel += 0.2;
    }
    else
    {
        sprite_index = sClimbUp3;
        yVel = 2;
        if (alarm[2] < 1) alarm[2] = 8;
    }
    
    if (y >= 176 + 8)
    {
        y = 176 + 8;
        player = instance_create(x, y, oPlayer1);
        player.facing = 18;
        instance_destroy();
    }
}
else
{
    player = instance_create(x, y, oPlayer1);
    player.facing = 18;
    instance_destroy();
}
