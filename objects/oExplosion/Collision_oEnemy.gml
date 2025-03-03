if (other.type == "Magma Man")
{
    with other
    {
        flame = instance_create(x+8, y-4, oMagma);
        flame.yVel = -rand(1,3);
        flame = instance_create(x+8, y-4, oMagma);
        flame.yVel = -rand(1,3);
        instance_destroy();
    }
}
else if (not other.invincible)
{
    other.hp -= 30;
    if (x < other.x) other.xVel = rand(4,6);
    else other.xVel = -rand(4,6);
    other.yVel = -6;
    other.burning = 50;
}
