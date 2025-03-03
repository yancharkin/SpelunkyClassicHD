if (other.xVel > 0 or other.yVel > 0)
{
    instance_create(x, y, oParaUsed);
    instance_destroy();
}
