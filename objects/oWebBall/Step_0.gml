x += xVel;
y += yVel;

if (yVel < 6) yVel += 0.2;
// if (yVel > 0) yVel = 0;

if (life > 0) life -= 1;
else
{
    sprite_index = sWebCreate;
}

/*if (collision_point(x, y, oDark, 0, 0) or
    collision_point(x, y, oDarkFall, 0, 0) or
    collision_point(x, y, oIce, 0, 0))
{
    instance_destroy();
}*/
/* */
/*  */
