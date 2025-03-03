for (i = 0; i < 3; i += 1)
{
    instance_create(x+rand(0,16), y+rand(0,16), oLavaDrip);
}
if (rand(1,6) == 1)
{
    flame = instance_create(x+8, y+8, oFlame);
    flame.yVel = 4;
}
