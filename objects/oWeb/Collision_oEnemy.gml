if (other.type != "Spider" and other.type != "Giant Spider")
{
    other.xVel = 0;
    other.yVel = 0;
}

if (other.type == "Magma Man")
{
    instance_destroy();
}

if (other.type == "Shopkeeper" and other.hp > 0)
{
    other.status = 2;
}
