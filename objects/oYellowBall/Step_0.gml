x += xVel;
y += yVel;

if (collision_rectangle(x-8, y-8, x+8, y+8, oSolid, 0, 0) and
    not collision_rectangle(x-8, y-8, x+8, y+8, oOlmec, 0, 0))
{
    x -= xVel;
    y -= yVel;
    if (rand(1,2) == 1) n = rand(1,4);
    else n = rand(1,5);
    switch (n)
    {
        case 1: { instance_create(x-8, y-8, oBat); break; }
        case 2: { instance_create(x-8, y-8, oSpider); break; }
        case 3: { instance_create(x-8, y-8, oSnake); break; }
        case 4: { instance_create(x-8, y-8, oFrog); break; }
        case 5: { instance_create(x-8, y-8, oFireFrog); break; }
    }
    instance_destroy();
}

if (yVel < 6) yVel += 0.15;

/*if (collision_point(x, y, oDark, 0, 0) or
    collision_point(x, y, oDarkFall, 0, 0) or
    collision_point(x, y, oIce, 0, 0))
{
    instance_destroy();
}*/
/* */
/*  */
