dist = 0;
if (isLevel())
{
    dist = point_distance(x, y, oPlayer1.x, oPlayer1.y)
}
if (spurt and dist < 240)
{
    if (spurtCounter > 0) spurtCounter -= 1;
    else
    {
        spurtCounter = spurtTime;
        if (rand(1,8) == 1) flame = instance_create(x+8, y-4, oMagma);
        else flame = instance_create(x+8, y-4, oFlame);
        flame.yVel = -rand(1,4);
    }
}
